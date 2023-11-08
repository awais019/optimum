import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  static final baseURL = Uri.parse('http://10.0.2.2:4000');
  Future<http.Response> create(
      String name, String email, String password, String role) {
    final createURI = baseURL.resolve("/api/user");
    return http.post(createURI,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "role": role
        }));
  }
}
