class User {
  String? id;
  String? name;
  String? email;
  String? gender;
  String? role;
  DateTime? dob;

  User.init() {
    id = "";
    name = "";
    email = "";
    role = "";
    gender = "";
    dob = DateTime.now();
  }

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.role,
    required this.dob,
  });
}
