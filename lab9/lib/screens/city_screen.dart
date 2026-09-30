import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

/// Screen allowing the user to search weather by city name.
class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final TextEditingController _cityController = TextEditingController();

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _cityController.text.trim();
    if (text.isNotEmpty) {
      Navigator.pop(context, text);
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
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 32.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _cityController,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  onSubmitted: (_) => _submit(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.inputBg,
                    icon: const Icon(Icons.location_city, color: Colors.white),
                    hintText: 'Nhập tên thành phố (vd: Tokyo, London, Hà Nội)...',
                    hintStyle: const TextStyle(color: Colors.white38),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 4.0,
                ),
                onPressed: _submit,
                child: const Text(
                  'LẤY THỜI TIẾT',
                  style: AppStyles.buttonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}