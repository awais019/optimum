import 'package:optimum/models/user.dart';
import 'package:optimum/redux/actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(user: userReducer(state.user, action));
}

User userReducer(User state, action) {
  if (action is UpdateUserAction) {
    return action.user;
  } else if (action is UpdateUserGenderAction) {
    return state.copyWith(gender: action.gender);
  } else if (action is UpdateAuthToken) {
    return state.copyWith(authToken: action.authToken);
  } else if (action is UpdateDOB) {
    return state.copyWith(dob: action.dob);
  }
  return state;
}
