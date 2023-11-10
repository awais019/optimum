class User {
  final String id;
  final String name;
  final String role;

  User(this.id, this.name, this.role);

  User copyWith({String? id, String? name, String? role}) {
    return User(id ?? this.id, name ?? this.name, role ?? this.role);
  }
}

class AppState {
  final User user;

  AppState({required this.user});

  AppState.initialState() : user = User("", "", "");
}
