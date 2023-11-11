import 'package:optimum/models/user.dart';

class UpdateUserAction {
  final User user;

  UpdateUserAction(this.user);
}

class UpdateUserGenderAction {
  final String gender;

  UpdateUserGenderAction(this.gender);
}