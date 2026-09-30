/// Model representing parsed weather data.
class WeatherData {
  final String cityName;
  final int temperature;
  final int humidity;
  final int condition;
  final String weatherIcon;
  final String message;

  const WeatherData({
    required this.cityName,
    required this.temperature,
    required this.humidity,
    required this.condition,
    required this.weatherIcon,
    required this.message,
  });
}