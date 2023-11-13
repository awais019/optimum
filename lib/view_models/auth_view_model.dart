import 'package:redux/redux.dart';
import 'package:optimum/models/app.dart';
import 'package:optimum/models/auth.dart';
import 'package:optimum/redux/auth_actions.dart';

class AuthViewModel {
  final AuthState auth;

  final Function(String) onLogin;
  final Function() onLogout;

  AuthViewModel(
      {required this.auth, required this.onLogin, required this.onLogout});

  factory AuthViewModel.create(Store<AppState> store) {
    _onLogin(String authToken) {
      store.dispatch(LoginAction(authToken));
    }

    _onLogout() {
      store.dispatch(LogoutAction());
    }

    return AuthViewModel(
        auth: store.state.auth, onLogin: _onLogin, onLogout: _onLogout);
  }
}
