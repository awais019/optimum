import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:optimum/models/doctor.model.dart';
import 'package:optimum/managers/user.manager.dart';

class DoctorManager {
  List<Doctor>? _doctors;
  DoctorProfileModel? _doctor;
  final baseURI = Uri.parse("http://10.0.2.2:4000");

  Future<void> fetchDoctors() async {
    final getURI = baseURI.resolve("/api/doctor");

    _doctors = [];
    http.Response response = await http.get(getURI, headers: {
      "x-auth-token": userManager.getToken,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      for (var json in data["data"]) {
        _doctors!.add(Doctor.fromJson(json));
      }
    } else if (response.statusCode == 401) {
      userManager.signOut();
    }
  }

  Future<List<Doctor>> getDoctors() async {
    if (_doctors == null) {
      await fetchDoctors();
    }
    return _doctors!;
  }

  Future<DoctorProfileModel> getDoctor(String id) async {
    final getURI = baseURI.resolve("/api/doctor/$id");

    http.Response response = await http.get(getURI, headers: {
      "x-auth-token": userManager.getToken,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      _doctor = DoctorProfileModel.fromJson(data["data"]);
      return _doctor!;
    } else if (response.statusCode == 401) {
      userManager.signOut();
    }
    return _doctor!;
  }
}

DoctorManager doctorManager = DoctorManager();
