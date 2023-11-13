import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:optimum/models/user.dart';

class AuthService {
  static final baseURL = Uri.parse('http://10.0.2.2:4000');

  static Future<http.Response> verifyEmail(String email, int code) {
    final createURI = baseURL.resolve("/api/auth/email/verify");
    return http.post(createURI,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"email": email, "code": code}));
  }

  static Future<http.Response> resendEmail(String email) {
    final createURI = baseURL.resolve("/api/auth/email/resend");
    return http.post(createURI,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"email": email}));
  }

  static Future<http.Response> updatePatientProfile(
      User user, String authToken) {
    final updateURI = baseURL.resolve("/api/auth/me");
    return http.put(updateURI,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': authToken
        },
        body: jsonEncode({
          "name": user.name,
          "role": user.role,
          "gender": user.gender,
          "dob": user.dob.toString()
        }));
  }
}
