import 'package:flutter/material.dart';
import 'package:optimum/app_colors.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        leading: const Icon(
          Icons.navigate_before,
          color: Colors.white,
          size: 24.0,
        ),
        title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Image.asset('assets/icons/man.png', height: 24.0)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 24.0),
        child: Center(
          child: Column(children: [
            const SizedBox(height: 48.0),
            RichText(
                text: const TextSpan(
                    style: TextStyle(
                      color: AppColors.darkNeutrals500,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w700,
                      height: 1.23,
                    ),
                    children: [
                  TextSpan(text: "Thank You! "),
                  TextSpan(
                      text: "for providing your details",
                      style: TextStyle(color: AppColors.primaryColor)),
                ])),
            const SizedBox(height: 8.0),
            const Text("We will review your details and inform you shortly",
                style: TextStyle(
                    color: AppColors.darkNeutrals100,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    height: 1.5)),
            const SizedBox(height: 32.0),
          ]),
        ),
      ),
    );
  }
}
