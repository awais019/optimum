import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:optimum/app_colors.dart';
import 'package:optimum/pages/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AnimatedSplashScreen(
        duration: 2500,
        backgroundColor: AppColors.primaryColor,
        splash: Column(
          children: [
            Image.asset('assets/icons/man.png'),
            const Expanded(
              child: Text("Optimum",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.visible)),
            ),
          ],
        ),
        nextScreen: const OnBoarding(),
      ),
      Positioned(
          bottom: 0,
          child: Stack(children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/ellipse2.png", fit: BoxFit.cover)),
            Positioned(
                bottom: 0,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child:
                        Image.asset('assets/ellipse3.png', fit: BoxFit.cover)))
          ])),
    ]);
  }
}
