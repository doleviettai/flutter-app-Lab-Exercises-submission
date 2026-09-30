import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../constants/app_colors.dart';
import '../services/weather_service.dart';
import 'location_screen.dart';

/// Loading screen fetching initial weather and showing animated spinner.
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final WeatherService _weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    _getLocationData();
  }

  Future<void> _getLocationData() async {
    final weatherData = await _weatherService.getLocationWeather();

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(
            locationWeather: weatherData,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
              color: Colors.white,
              size: 80.0,
            ),
            SizedBox(height: 24.0),
            Text(
              'Đang tải dữ liệu thời tiết...',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}