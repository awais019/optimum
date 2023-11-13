class User {
  final String id;
  final String name;
  final String role;
  String? gender;
  String? authToken;
  DateTime? dob;

  User(this.id, this.name, this.role, {this.gender, this.authToken, this.dob});

  User copyWith(
      {String? id,
      String? name,
      String? role,
      String? gender,
      String? authToken,
      DateTime? dob}) {
    return User(id ?? this.id, name ?? this.name, role ?? this.role,
        gender: gender ?? this.gender,
        authToken: authToken ?? this.authToken,
        dob: dob ?? this.dob);
  }
}

class AppState {
  final User user;

  AppState({required this.user});

  AppState.initialState() : user = User("", "", "");
}
