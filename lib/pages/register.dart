import 'package:flutter/material.dart';
import 'package:optimum/app_colors.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register",
            style: TextStyle(
              color: AppColors.darkNeutrals500,
              fontSize: 20.0,
              height: 1.5,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.navigate_before,
            color: AppColors.darkNeutrals500,
            size: 24.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48.0),
            const Text("Type of Account",
                style: TextStyle(
                  fontSize: 26.0,
                  height: 1.23,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkNeutrals500,
                )),
            const SizedBox(height: 8.0),
            const Text("Choose an option to start signup process",
                style: TextStyle(
                    fontSize: 16.0,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkNeutral100)),
            const SizedBox(height: 32.0),
            TextButton(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: AppColors.darkNeutrals50,
                      width: 1.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Patient",
                          style: TextStyle(
                              fontSize: 20.0,
                              height: 1.2,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkNeutrals500)),
                      Image.asset("assets/icons/patient.png")
                    ],
                  ),
                )),
            TextButton(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: AppColors.darkNeutrals50,
                      width: 1.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Doctor",
                          style: TextStyle(
                              fontSize: 20.0,
                              height: 1.2,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkNeutrals500)),
                      Image.asset("assets/icons/doctor.png")
                    ],
                  ),
                )),
            const SizedBox(height: 64.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  elevation: 16,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  shadowColor: const Color.fromRGBO(230, 126, 26, 0.15),
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                ),
                child: const Text("Continue",
                    style: TextStyle(
                      fontSize: 16.0,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: AppColors.light50,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
