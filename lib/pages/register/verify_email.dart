import 'package:flutter/material.dart';
import 'package:optimum/app_colors.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController codeController = TextEditingController();

  void handleSubmit() {}

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        return "Code is required";
                      } else if (!RegExp(r"^[0-9]{6}$").hasMatch(value)) {
                        return "Invalid code";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: handleSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        elevation: 16,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        shadowColor: const Color.fromRGBO(230, 126, 26, 0.15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 32.0),
                      ),
                      child: const Text("Verify",
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
              onPressed: () {
                // resend email
              },
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
  }
}