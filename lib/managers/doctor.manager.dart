import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:optimum/models/doctor.model.dart';
import 'package:optimum/managers/user.manager.dart';

class DoctorManager {
  List<Doctor>? _doctors;
  final baseURI = Uri.parse("http://10.0.2.2:4000");

  Future<void> fetchDoctors() async {
    final getURI = baseURI.resolve("/api/doctor");

    final response = await http.get(getURI, headers: {
      "x-auth-toke": userManager.getToken,
    });
    if (response.statusCode == 200) {
      _doctors = [];
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      for (var json in data["data"]) {
        _doctors!.add(Doctor.fromJson(json));
      }
    } else {
      throw Exception("Failed to fetch doctors");
    }
  }

  Future<List<Doctor>> getDoctors() async {
    if (_doctors == null) {
      await fetchDoctors();
    }
    return _doctors!;
  }
}

DoctorManager doctorManager = DoctorManager();
