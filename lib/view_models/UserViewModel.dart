import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:optimum/models/user.dart';
import 'package:optimum/redux/actions.dart';

class UserViewModel {
  final User user;

  final Function(User) onUpdateUser;
  final Function(String) onUpdateUserGender;
  final Function(String) onUpdateAuthToken;
  final Function(DateTime) onUpdateDOB;

  UserViewModel(
      {required this.user,
      required this.onUpdateUser,
      required this.onUpdateUserGender,
      required this.onUpdateAuthToken,
      required this.onUpdateDOB});

  factory UserViewModel.create(Store<AppState> store) {
    _onUpdateUser(User user) {
      store.dispatch(UpdateUserAction(user));
    }

    _onUpdateUserGender(String gender) {
      store.dispatch(UpdateUserGenderAction(gender));
    }

    _onUpdateAuthToken(String token) {
      store.dispatch(UpdateAuthToken(token));
    }

    _onUpdateDOB(DateTime dob) {
      store.dispatch(UpdateDOB(dob));
    }

    return UserViewModel(
        user: store.state.user,
        onUpdateUser: _onUpdateUser,
        onUpdateUserGender: _onUpdateUserGender,
        onUpdateAuthToken: _onUpdateAuthToken,
        onUpdateDOB: _onUpdateDOB);
  }
}
