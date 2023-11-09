import 'package:http/http.dart' as http;
import 'dart:convert';

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
}
