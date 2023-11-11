import 'package:flutter/material.dart';
import 'package:optimum/pages/splash_screen.dart';
import 'package:optimum/pages/register/index.dart';
import 'package:optimum/pages/profile_completion/gender.dart';
import 'package:optimum/pages/profile_completion/date_of_birth.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:optimum/models/user.dart';
import 'package:optimum/redux/reducers.dart';

void main() async {
  final store =
      Store<AppState>(appStateReducer, initialState: AppState.initialState());
  runApp(Optimum(store: store));
}

class Optimum extends StatelessWidget {
  final Store<AppState> store;

  const Optimum({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          title: 'Optimum',
          theme: ThemeData(
              fontFamily: 'Plus Jakarta Sans',
              scaffoldBackgroundColor: Colors.white),
          initialRoute: "/dob",
          routes: {
            "/splash": (context) => const SplashScreen(),
            "/register": (context) => const Register(),
            "/gender": (context) => const Gender(),
            "/dob": (context) => const DOB(),
          }),
    );
  }
}
