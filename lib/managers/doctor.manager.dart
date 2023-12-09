import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:optimum/models/doctor.model.dart';
import 'package:optimum/managers/user.manager.dart';

class DoctorManager {
  List<Doctor>? _doctors;
  final baseURI = Uri.parse("http://10.0.2.2/");

  Future<void> fetchDoctors() async {
    final getURI = baseURI.resolve("/api/doctor");
    final response = await http.get(getURI, headers: {
      "x-auth-toke": userManager.getToken,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _doctors = data.map((doctor) => Doctor.fromJson(doctor)).toList();
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
