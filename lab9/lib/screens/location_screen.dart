import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';
import '../models/weather_data.dart';
import '../services/weather_service.dart';
import 'city_screen.dart';

/// Main weather display screen for current location or searched city.
class LocationScreen extends StatefulWidget {
  final WeatherData locationWeather;

  const LocationScreen({
    super.key,
    required this.locationWeather,
  });

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final WeatherService _weatherService = WeatherService();
  late WeatherData _weatherData;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _weatherData = widget.locationWeather;
  }

  Future<void> _refreshLocation() async {
    setState(() => _isLoading = true);
    final data = await _weatherService.getLocationWeather();
    if (mounted) {
      setState(() {
        _weatherData = data;
        _isLoading = false;
      });
    }
  }

  Future<void> _searchCity() async {
    final typedCity = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const CityScreen()),
    );

    if (typedCity != null && typedCity.isNotEmpty) {
      setState(() => _isLoading = true);
      final data = await _weatherService.getCityWeather(typedCity);
      if (mounted) {
        setState(() {
          _weatherData = data;
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.dayGradient,
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.accent,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Top Navigation Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.near_me,
                              size: 40.0,
                              color: Colors.white,
                            ),
                            tooltip: 'Vị trí hiện tại',
                            onPressed: _refreshLocation,
                          ),
                          Text(
                            _weatherData.cityName,
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.1,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.location_city,
                              size: 40.0,
                              color: Colors.white,
                            ),
                            tooltip: 'Tìm kiếm thành phố',
                            onPressed: _searchCity,
                          ),
                        ],
                      ),

                      // Center: Temperature & Weather Icon
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${_weatherData.temperature}°',
                                  style: AppStyles.tempTextStyle,
                                ),
                                const SizedBox(width: 16.0),
                                Text(
                                  _weatherData.weatherIcon,
                                  style: AppStyles.conditionTextStyle,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            // Display Humidity (Độ ẩm) requirement from Lab 9 description
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 0.15),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.water_drop, color: Colors.lightBlueAccent, size: 22.0),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    'Độ ẩm: ${_weatherData.humidity}%',
                                    style: AppStyles.detailTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Bottom: Advisory Message Card
                      Card(
                        color: AppColors.cardBg,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            '${_weatherData.message} tại ${_weatherData.cityName}!',
                            textAlign: TextAlign.center,
                            style: AppStyles.messageTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
