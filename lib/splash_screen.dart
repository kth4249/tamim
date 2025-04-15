import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 배경색은 로고 배경과 유사하게 설정 (필요시 조정)
      backgroundColor: const Color(0xFFF8F5EF),
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', // pubspec.yaml에 등록한 로고 이미지 경로
          width: 200, // 로고 크기 조정 (필요시 조정)
        ),
      ),
    );
  }
}
