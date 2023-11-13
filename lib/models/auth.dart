enum AuthStatus { authenticated, notAuthenticated }

class AuthState {
  final AuthStatus status;
  final String? authToken;

  AuthState({required this.status, this.authToken});
}
