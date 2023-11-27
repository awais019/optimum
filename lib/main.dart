import 'package:flutter/material.dart';
import 'package:optimum/pages/splash_screen.dart';
import 'package:optimum/pages/register/index.dart';
import 'package:optimum/pages/profile_completion/gender.dart';
import 'package:optimum/pages/profile_completion/date_of_birth.dart';
import 'package:optimum/pages/home.dart';

void main() async {
  runApp(const Optimum());
}

class Optimum extends StatelessWidget {
  const Optimum({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Optimum',
      theme: ThemeData(
          fontFamily: 'Plus Jakarta Sans',
          scaffoldBackgroundColor: Colors.white),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreen(),
        "/": (context) => const Home(),
        "/register": (context) => const Register(),
        "/gender": (context) => const Gender(),
        "/dob": (context) => const DOB(),
      },
    );
  }
}
