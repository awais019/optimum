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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 24.0),
            const Image(image: AssetImage("assets/onboarding1.png")),
            const SizedBox(height: 24.0),
            const Text("Your fitness revolution starts here!!",
                style: TextStyle(
                  color: AppColors.darkNeutrals500,
                  fontSize: 26.0,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 24.0),
            const Text(
                "Track your progress with real-time monitoring while enjoying expert-designed exercises.",
                style: TextStyle(
                  color: AppColors.darkNeutral100,
                  fontSize: 16.0,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                )),
            const SizedBox(height: 32.0),
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                  ),
                  child: const Text("Get Started",
                      style: TextStyle(
                        fontSize: 16.0,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.light50,
                      )),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 1.0,
                    ),
                  ),
                  child: const Center(
                    child: Text("Log in",
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
