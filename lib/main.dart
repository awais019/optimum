import 'package:flutter/material.dart';
import 'package:optimum/pages/splash_screen.dart';
import 'package:optimum/pages/register/index.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(MaterialApp(
      title: 'Optimum',
      theme: ThemeData(fontFamily: 'Plus Jakarta Sans'),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreen(),
        "/register": (context) => const Register(),
      }));
}
