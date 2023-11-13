import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:optimum/app_colors.dart';
import 'package:optimum/services/auth.service.dart';
import "package:fluttertoast/fluttertoast.dart";

import 'package:optimum/models/user.dart';
import 'package:optimum/view_models/user_view_model.dart';

class VerifyEmail extends StatefulWidget {
  final String email;

  const VerifyEmail({super.key, required this.email});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  TextEditingController codeController = TextEditingController();

  void handleVerify(UserViewModel viewModel) async {
    try {
      setState(() {
        isLoading = true;
      });
      Response res = await AuthService.verifyEmail(
          widget.email, int.parse(codeController.text));

      setState(() {
        isLoading = false;
      });

      final Map<String, dynamic> data = json.decode(res.body);
      if (res.statusCode == 200) {
        User user = User(
            data['data']['id'], data['data']['name'], data['data']['role']);
        viewModel.onUpdateUser(user);
        viewModel.onUpdateAuthToken(data['data']['token']);
        if (mounted) {
          Navigator.pushNamed(context, "/gender");
        }
      } else {
        Fluttertoast.showToast(msg: data['message']);
      }
    } catch (e) {
      debugPrint('$e');
      Fluttertoast.showToast(msg: "Something went wrong!");
    }
  }

  void handleResend() async {
    try {
      await AuthService.resendEmail(widget.email);
      Fluttertoast.showToast(msg: "Email sent");
    } catch (e) {
      Fluttertoast.showToast(msg: "Something went wrong!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserViewModel>(
        converter: (store) => UserViewModel.create(store),
        builder: (context, viewModel) {
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 48.0),
                    const Text("Check your mail",
                        style: TextStyle(
                            color: AppColors.darkNeutrals500,
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                            height: 1.23)),
                    const SizedBox(height: 8.0),
                    const Text(
                        "Please check your email for the verification code sent to your email",
                        style: TextStyle(
                            color: AppColors.darkNeutrals100,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            height: 1.5)),
                    const SizedBox(height: 48.0),
                    Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: codeController,
                              decoration: InputDecoration(
                                  hintText: 'Enter 6 digit code',
                                  hintStyle: const TextStyle(
                                      color: AppColors.darkNeutrals100,
                                      fontSize: 16.0,
                                      height: 1.5,
                                      fontWeight: FontWeight.w500),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1.0),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.darkNeutrals50,
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1.0))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Code is required";
                                } else if (!RegExp(r"^[0-9]{6}$")
                                    .hasMatch(value)) {
                                  return "Invalid code";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16.0),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => handleVerify(viewModel),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  elevation: 16,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                  shadowColor:
                                      const Color.fromRGBO(230, 126, 26, 0.15),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 32.0),
                                ),
                                child: isLoading
                                    ? const SizedBox(
                                        height: 24.0,
                                        width: 24.0,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.0,
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Colors.white), // Spinner color
                                        ),
                                      )
                                    : const Text("Verify",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          height: 1.5,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.light50,
                                        )),
                              ),
                            ),
                          ],
                        )),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: handleResend,
                        child: const Text(
                          'Resend email',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.primaryColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}
