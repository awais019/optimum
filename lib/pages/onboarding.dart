import 'package:flutter/material.dart';
import 'package:optimum/app_colors.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Optimum",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              height: 1.2,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
      ),
    );
  }
}
