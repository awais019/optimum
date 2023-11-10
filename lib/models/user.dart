class User {
  final String id;
  final String name;

  User(this.id, this.name);

  User copyWith({String? id, String? name}) {
    return User(
      id ?? this.id,
      name ?? this.name,
    );
  }
}

class AppState {
  final User user;

  AppState({required this.user});

  AppState.initialState() : user = User("", "");
}
