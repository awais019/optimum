import 'package:optimum/models/app.dart';
import 'package:optimum/models/user.dart';
import 'package:optimum/models/auth.dart';
import 'package:optimum/redux/user_actions.dart';
import 'package:optimum/redux/auth_actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
      user: userReducer(state.user, action),
      auth: authReducer(state.auth, action));
}

User userReducer(User state, action) {
  if (action is UpdateUserAction) {
    return action.user;
  } else if (action is UpdateUserGenderAction) {
    return state.copyWith(gender: action.gender);
  } else if (action is UpdateDOB) {
    return state.copyWith(dob: action.dob);
  }
  return state;
}

AuthState authReducer(AuthState state, action) {
  if (action is LoginAction) {
    return AuthState(
        status: AuthStatus.authenticated, authToken: action.authToken);
  } else if (action is LogoutAction) {
    return AuthState(status: AuthStatus.notAuthenticated);
  }
  return state;
}
