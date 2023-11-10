import 'package:optimum/models/user.dart';
import 'package:optimum/redux/actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(user: userReducer(state.user, action));
}

User userReducer(User state, action) {
  if (action is UpdateUserAction) {
    return action.user;
  }
  return state;
}
