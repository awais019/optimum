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
