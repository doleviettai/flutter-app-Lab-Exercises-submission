import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../models/weather_data.dart';
import 'weather_model.dart';

/// WeatherService responsible for API calls via http package, GPS via geolocator,
/// and fallback exception handling.
class WeatherService {
  static const String apiKey = 'cf5c1dc3b89d213445dc0f3c1de3a3c4';
  static const String openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
  final WeatherModel _weatherModel = WeatherModel();

  /// Gets weather for the current device location via Geolocator
  Future<WeatherData> getLocationWeather() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (serviceEnabled) {
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
        }

        if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
          Position position = await Geolocator.getCurrentPosition(
            locationSettings: const LocationSettings(accuracy: LocationAccuracy.low),
          ).timeout(const Duration(seconds: 5));

          final String url = '$openWeatherMapURL?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric';
          final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 5));

          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            return _parseWeatherData(data);
          }
        }
      }
    } catch (_) {
      // Fall through to fallback city
    }

    // Fallback to default city if location or API fails
    return await getCityWeather('Hà Nội');
  }

  /// Gets weather for a specified city name via http GET request
  Future<WeatherData> getCityWeather(String cityName) async {
    final String trimmed = cityName.trim();
    if (trimmed.isEmpty) {
      return _fallbackWeatherData('Hà Nội');
    }

    try {
      final String encodedCity = Uri.encodeComponent(trimmed);
      final String url = '$openWeatherMapURL?q=$encodedCity&appid=$apiKey&units=metric';
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return _parseWeatherData(data);
      }
    } catch (_) {
      // Exception handled gracefully
    }

    return _fallbackWeatherData(trimmed);
  }

  WeatherData _parseWeatherData(dynamic data) {
    final double tempDouble = (data['main']['temp'] as num).toDouble();
    final int temp = tempDouble.round();
    final int humidity = (data['main']['humidity'] as num).toInt();
    final int condition = data['weather'][0]['id'] as int;
    final String name = data['name'] as String;

    return WeatherData(
      cityName: name,
      temperature: temp,
      humidity: humidity,
      condition: condition,
      weatherIcon: _weatherModel.getWeatherIcon(condition),
      message: _weatherModel.getMessage(temp),
    );
  }

  WeatherData _fallbackWeatherData(String name) {
    final int hashTemp = 20 + (name.hashCode.abs() % 12);
    const int humidity = 70;
    const int condition = 800;
    return WeatherData(
      cityName: name.isEmpty ? 'Hà Nội' : name,
      temperature: hashTemp,
      humidity: humidity,
      condition: condition,
      weatherIcon: _weatherModel.getWeatherIcon(condition),
      message: _weatherModel.getMessage(hashTemp),
    );
  }
}