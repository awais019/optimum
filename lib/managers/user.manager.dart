import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:optimum/models/user.model.dart';

class UserManager {
  final User _user = User.init();
  String _token = "";
  static final baseURL = Uri.parse('http://10.0.2.2:4000');

  setRole(String role) {
    _user.role = role;
  }

  setGender(String gender) {
    _user.gender = gender;
  }

  setDOB(DateTime dob) {
    _user.dob = dob;
  }

  setToken(String token) {
    _token = token;
  }

  String get getRole => _user.role!;

  String get getEmail => _user.email!;

  Future<http.Response> create(
      String name, String email, String password) async {
    _user.name = name;
    _user.email = email;

    final createURI = baseURL.resolve("/api/user");
    return http.post(createURI,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "role": _user.role,
        }));
  }

  Future<http.Response> verifyEmail(int code) {
    final createURI = baseURL.resolve("/api/auth/email/verify");
    return http.post(createURI,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"email": _user.email, "code": code}));
  }

  Future<http.Response> resendEmail() {
    final createURI = baseURL.resolve("/api/auth/email/resend");
    return http.post(createURI,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"email": _user.email}));
  }

  Future<http.Response> updatePatientProfile() {
    final updateURI = baseURL.resolve("/api/auth/me");
    return http.put(updateURI,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': _token,
        },
        body: jsonEncode({
          "name": _user.name,
          "role": _user.role,
          "gender": _user.gender,
          "dob": _user.dob.toString(),
        }));
  }
}
