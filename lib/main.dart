import 'package:flutter/material.dart';
import 'package:optimum/pages/splash_screen.dart';
import 'package:optimum/pages/register/index.dart';
import 'package:optimum/pages/profile_completion/gender.dart';
import 'package:optimum/pages/profile_completion/date_of_birth.dart';
import 'package:optimum/pages/home.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:optimum/models/app.dart';
import 'package:optimum/models/user.dart';
import 'package:optimum/models/auth.dart';
import 'package:optimum/redux/reducers.dart';

void main() async {
  final store = Store<AppState>(appStateReducer,
      initialState: AppState.initialState(User("", "", ""),
          AuthState(status: AuthStatus.notAuthenticated, authToken: "")));
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
          initialRoute: "/",
          routes: {
            "/splash": (context) => const SplashScreen(),
            "/": (context) => const Home(),
            "/register": (context) => const Register(),
            "/gender": (context) => const Gender(),
            "/dob": (context) => const DOB(),
          }),
    );
  }
}
