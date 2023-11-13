import 'package:optimum/models/user.dart';

class UpdateUserAction {
  final User user;

  UpdateUserAction(this.user);
}

class UpdateUserGenderAction {
  final String gender;

  UpdateUserGenderAction(this.gender);
}

class UpdateAuthToken {
  final String authToken;

  UpdateAuthToken(this.authToken);
}

class UpdateDOB {
  final DateTime dob;

  UpdateDOB(this.dob);
}
