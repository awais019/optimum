class Doctor {
  String id;
  String name;
  int experience;
  String clinicName;
  String address;
  String city;
  String state;

  Doctor({
    required this.id,
    required this.name,
    required this.experience,
    required this.clinicName,
    required this.address,
    required this.city,
    required this.state,
  });

  Doctor.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        experience = json["experience"],
        clinicName = json["clinicName"],
        address = json["address"],
        city = json["city"],
        state = json["state"];
}

class Charges {
  String appointment_type;
  int charges;

  Charges({
    required this.appointment_type,
    required this.charges,
  });

  factory Charges.fromJson(Map<String, dynamic> json) {
    return Charges(
      appointment_type: json["appointment_type"],
      charges: json["charges"],
    );
  }
}

class DoctorProfileModel extends Doctor {
  List<Charges> charges;

  DoctorProfileModel({
    required String id,
    required String name,
    required int experience,
    required String clinicName,
    required String address,
    required String city,
    required String state,
    required this.charges,
  }) : super(
          id: id,
          name: name,
          experience: experience,
          clinicName: clinicName,
          address: address,
          city: city,
          state: state,
        );

  factory DoctorProfileModel.fromJson(Map<String, dynamic> json) {
    return DoctorProfileModel(
      id: json["id"],
      name: json["name"],
      experience: json["experience"],
      clinicName: json["clinicName"],
      address: json["address"],
      city: json["city"],
      state: json["state"],
      charges: json["charges"]
          .map<Charges>((charge) => Charges.fromJson(charge))
          .toList(),
    );
  }
}
