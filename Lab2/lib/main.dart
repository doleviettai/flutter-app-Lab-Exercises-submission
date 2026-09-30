import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 2',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF55C7E8),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // =========================
              // ẢNH ĐẠI DIỆN
              // =========================
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,
                backgroundImage: const AssetImage(
                  'assets/avatar.jpg',
                ),
              ),

              const SizedBox(height: 15),

              // =========================
              // HỌ VÀ TÊN
              // =========================
              const Text(
                'Đỗ Lê Viết Tài',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              // =========================
              // NGHỀ NGHIỆP
              // =========================
              const Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 25),

              // =========================
              // KHUNG SỐ ĐIỆN THOẠI
              // =========================
              Container(
                width: 330,
                height: 55,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: Colors.teal,
                      size: 23,
                    ),

                    SizedBox(width: 15),

                    Text(
                      '0384406365',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // =========================
              // KHUNG EMAIL
              // =========================
              Container(
                width: 330,
                height: 55,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.teal,
                      size: 23,
                    ),

                    SizedBox(width: 15),

                    Text(
                      'doleviettai231105@gmail.com',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}