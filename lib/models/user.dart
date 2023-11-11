class User {
  final String id;
  final String name;
  final String role;
  String gender;

  User(this.id, this.name, this.role, this.gender);

  User copyWith({String? id, String? name, String? role, String? gender}) {
    return User(id ?? this.id, name ?? this.name, role ?? this.role,
        gender ?? this.gender);
  }
}

class AppState {
  final User user;

  AppState({required this.user});

  AppState.initialState() : user = User("", "", "", "");
}
