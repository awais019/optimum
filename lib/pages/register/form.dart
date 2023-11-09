import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:optimum/app_colors.dart';
import 'package:optimum/pages/register/verify_email.dart';
import 'package:optimum/services/user.service.dart';

class RegisterUser extends StatefulWidget {
  final String role;

  const RegisterUser({super.key, required this.role});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _formKey = GlobalKey<FormState>();
  String error = "";
  bool isHidden = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final UserService userService = UserService();

  void handleSubmit() async {
    try {
      Response res = await userService.create(nameController.text,
          emailController.text, passwordController.text, widget.role);

      final Map<String, dynamic> data = json.decode(res.body);

      if (res.statusCode != 200) {
        setState(() {
          error = data["message"];
        });
      } else {
        if (mounted) {
          error = "";
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      VerifyEmail(email: emailController.text)));
        }
      }
    } catch (e) {
      debugPrint('An unknown error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.navigate_before,
            color: AppColors.darkNeutrals500,
            size: 24.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
        child: ListView(
          children: [
            const SizedBox(height: 48.0),
            const Text("Signup",
                style: TextStyle(
                    fontSize: 26.0, height: 1.23, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8.0),
            const Text("Fil the details to register account",
                style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.darkNeutrals100,
                    height: 1.5)),
            const SizedBox(height: 32.0),
            Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            prefixIcon: IconTheme(
                              data: const IconThemeData(
                                  color: AppColors.darkNeutrals100),
                              child: Image.asset("assets/icons/person.png"),
                            ),
                            hintText: 'Full Name',
                            hintStyle: const TextStyle(
                                color: AppColors.darkNeutrals100,
                                fontSize: 16.0,
                                height: 1.5,
                                fontWeight: FontWeight.w500),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor, width: 1.0),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.darkNeutrals50, width: 1.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name is required";
                          } else if (value.length < 5) {
                            return "Name should be at least 5 characters long";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            prefixIcon: IconTheme(
                              data: const IconThemeData(
                                  color: AppColors.darkNeutrals100),
                              child: Image.asset("assets/icons/email.png"),
                            ),
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                                color: AppColors.darkNeutrals100,
                                fontSize: 16.0,
                                height: 1.5,
                                fontWeight: FontWeight.w500),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor, width: 1.0),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.darkNeutrals50, width: 1.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required";
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Enter a valid email address";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      TextFormField(
                        controller: passwordController,
                        obscureText: isHidden,
                        decoration: InputDecoration(
                            prefixIcon: IconTheme(
                              data: const IconThemeData(
                                  color: AppColors.darkNeutrals100),
                              child: Image.asset("assets/icons/password.png"),
                            ),
                            suffixIcon: GestureDetector(
                              child: IconTheme(
                                  data: const IconThemeData(
                                      color: AppColors.darkNeutrals100,
                                      size: 24.0),
                                  child: isHidden
                                      ? Image.asset(
                                          "assets/icons/eye_closed.png")
                                      : Image.asset(
                                          "assets/icons/eye_open.png")),
                              onTap: () {
                                setState(() {
                                  isHidden = !isHidden;
                                });
                              },
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                                color: AppColors.darkNeutrals100,
                                fontSize: 16.0,
                                height: 1.5,
                                fontWeight: FontWeight.w500),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor, width: 1.0),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.darkNeutrals50, width: 1.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "password is required";
                          } else if (value.length < 5) {
                            return "Password should at least 8 characters long";
                          }
                          return null;
                        },
                      ),
                      if (error.isNotEmpty)
                        Text(
                          error,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 48.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: handleSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            elevation: 16,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            shadowColor:
                                const Color.fromRGBO(230, 126, 26, 0.15),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 32.0),
                          ),
                          child: const Text("Register",
                              style: TextStyle(
                                fontSize: 16.0,
                                height: 1.5,
                                fontWeight: FontWeight.bold,
                                color: AppColors.light50,
                              )),
                        ),
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
