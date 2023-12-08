import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:optimum/models/user.model.dart';

class UserManager {
  final User _user = User.init();
  String _token = "";
  static final baseURL = Uri.parse('http://127.0.0.1:4000');

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

  Future<http.Response> createPatient() {
    final updateURI = baseURL.resolve("/api/patient/");
    return http.post(updateURI,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': _token,
        },
        body: jsonEncode({
          "gender": _user.gender,
          "dob": _user.dob.toString(),
        }));
  }

  Future<http.StreamedResponse> createDoctor(
      int experience, Uint8List fileBytes, String fileName) {
    final updateURI = baseURL.resolve("/api/doctor/");

    http.MultipartRequest request = http.MultipartRequest('POST', updateURI);

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'x-auth-token': _token,
    });

    request.files.add(http.MultipartFile.fromBytes(
      'file',
      fileBytes,
      filename: fileName,
    ));

    request.fields.addAll({
      'gender': _user.gender!,
      'experience': experience.toString(),
    });

    return request.send();
  }
}
