import 'package:flutter/material.dart';

// pages
import 'package:optimum/pages/splash_screen.dart';
import 'package:optimum/pages/register/index.dart';
import 'package:optimum/pages/register/form.dart';
import 'package:optimum/pages/register/verify_email.dart';
import 'package:optimum/pages/profile_completion/gender.dart';
import 'package:optimum/pages/profile_completion/date_of_birth.dart';
import 'package:optimum/pages/profile_completion/experience.dart';
import 'package:optimum/pages/profile_completion/clinic_details.dart';
import 'package:optimum/pages/profile_completion/charges.dart';
import 'package:optimum/pages/profile_completion/schedule.dart';
import 'package:optimum/pages/home.dart';

// data managers
import 'package:optimum/managers/user.manager.dart';

void main() async {
  runApp(Optimum());
}

class Optimum extends StatelessWidget {
  final UserManager userManager = UserManager();
  Optimum({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Optimum',
      theme: ThemeData(
        fontFamily: 'Plus Jakarta Sans',
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreen(),
        "/": (context) => const Home(),
        "/register": (context) => Register(userManager: userManager),
        "/register/form": (context) => RegisterUser(userManager: userManager),
        "/register/verify_email": (context) =>
            VerifyEmail(userManager: userManager),
        "/profile_completion/gender": (context) =>
            Gender(userManager: userManager),
        "/profile_completion/dob": (context) => DOB(userManager: userManager),
        "/profile_completion/experience": (context) =>
            Experience(userManager: userManager),
        "/profile_completion/clinic_details": (context) =>
            ClinicDetails(userManager: userManager),
        "/profile_completion/charges": (context) => const Charges(),
        "/profile_completion/schedule": (context) => const Schedule(),
      },
    );
  }
}
