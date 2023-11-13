import 'package:optimum/models/user.dart';
import 'package:optimum/models/auth.dart';

class AppState {
  final User user;
  final AuthState auth;

  AppState({required this.user, required this.auth});

  AppState.initialState(this.user, this.auth);
}