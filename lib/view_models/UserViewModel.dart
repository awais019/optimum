import 'package:redux/redux.dart';
import 'package:optimum/models/user.dart';
import 'package:optimum/redux/actions.dart';

class UserViewModel {
  final User user;

  final Function(User) onUpdateUser;
  final Function(String) onUpdateUserGender;

  UserViewModel(
      {required this.user,
      required this.onUpdateUser,
      required this.onUpdateUserGender});

  factory UserViewModel.create(Store<AppState> store) {
    _onUpdateUser(User user) {
      store.dispatch(UpdateUserAction(user));
    }

    _onUpdateUserGender(String gender) {
      store.dispatch(UpdateUserGenderAction(gender));
    }

    return UserViewModel(
        user: store.state.user,
        onUpdateUser: _onUpdateUser,
        onUpdateUserGender: _onUpdateUserGender);
  }
}
