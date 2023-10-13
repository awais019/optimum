import 'package:flutter/material.dart';
import 'package:optimum/pages/splash_screen.dart';
import 'package:optimum/pages/register/index.dart';
import 'package:optimum/pages/register/form.dart';

void main() {
  runApp(MaterialApp(
      title: 'Optimum',
      theme: ThemeData(fontFamily: 'Plus Jakarta Sans'),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreen(),
        "/register": (context) => const Register(),
      }));
}
