import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:optimum/models/user.dart';
import 'package:optimum/redux/actions.dart';

class UserViewModel {
  final User user;

  final Function(User) onUpdateUser;

  UserViewModel({required this.user, required this.onUpdateUser});

  factory UserViewModel.create(Store<AppState> store) {
    onUpdateUser(User user) {
      store.dispatch(UpdateUserAction(user));
    }

    return UserViewModel(user: store.state.user, onUpdateUser: onUpdateUser);
  }
}
