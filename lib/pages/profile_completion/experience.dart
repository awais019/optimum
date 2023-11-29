import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:optimum/app_colors.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final _formKey = GlobalKey<FormState>();
  File _file = File('');

  TextEditingController experienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: RichText(
                text: const TextSpan(
                    style: TextStyle(
                      color: AppColors.darkNeutrals500,
                    ),
                    children: [
                  TextSpan(
                      text: "2",
                      style: TextStyle(
                        fontSize: 20.0,
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                      )),
                  TextSpan(
                      text: "/",
                      style: TextStyle(
                        fontSize: 16.0,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      )),
                  TextSpan(
                      text: "5",
                      style: TextStyle(
                        color: AppColors.darkNeutrals100,
                        fontSize: 16.0,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                      ))
                ]))),
        centerTitle: true,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.circle,
                  color: AppColors.darkNeutrals500, size: 8.0),
              const SizedBox(width: 4.0),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 16.0,
                    height: 16.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.darkNeutrals500,
                        width: 2.0,
                      ),
                    ),
                  ),
                  Container(
                    width: 8.0,
                    height: 8.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.darkNeutrals500,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 4.0),
              const Icon(Icons.circle,
                  color: AppColors.darkNeutrals500, size: 8.0),
              const SizedBox(width: 4.0),
              const Icon(Icons.circle,
                  color: AppColors.darkNeutrals500, size: 8.0),
              const SizedBox(width: 4.0),
              const Icon(Icons.circle,
                  color: AppColors.darkNeutrals500, size: 8.0),
              const SizedBox(width: 16.0)
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 24.0),
        child: Theme(
          data: ThemeData(
            unselectedWidgetColor: AppColors.darkNeutrals100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48.0),
              RichText(
                  text: const TextSpan(
                      style: TextStyle(
                        color: AppColors.darkNeutrals500,
                        fontSize: 26.0,
                        fontWeight: FontWeight.w700,
                        height: 1.23,
                      ),
                      children: [
                    TextSpan(text: "Experience and "),
                    TextSpan(
                        text: "Verification Proof",
                        style: TextStyle(color: AppColors.primaryColor)),
                  ])),
              const SizedBox(height: 8.0),
              const Text(
                  "Please provide your experience and degree or certificate to verify your specialization",
                  style: TextStyle(
                      color: AppColors.darkNeutrals100,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      height: 1.5)),
              const SizedBox(height: 32.0),
              Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: experienceController,
                          decoration: InputDecoration(
                              hintText: 'Years of experience',
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
                                    color: AppColors.darkNeutrals50,
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 1.0))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Experience is required";
                            } else if (int.tryParse(value) == null) {
                              return "Experience must be a number";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shadowColor: const Color(0x261b0614),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['jpg', 'pdf', 'doc'],
                              );
                              if (result != null) {
                                setState(() {
                                  _file = File(result.files.single.path!);
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/icons/upload.png"),
                                  const SizedBox(width: 8.0),
                                  const Text("Certification",
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16.0,
                                        height: 1.5,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                            )),
                        const SizedBox(height: 24.0),
                        if (_file.path.isNotEmpty)
                          Row(
                            children: [
                              Image.asset("assets/icons/upload.png"),
                              const SizedBox(width: 8.0),
                              Text(_file.path.split('/').last,
                                  style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 16.0,
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ),
                        if (_file.path.isEmpty)
                          const Text("No file choosen",
                              style: TextStyle(
                                color: AppColors.darkNeutrals500,
                                fontSize: 14.0,
                                height: 1.42,
                                fontWeight: FontWeight.w500,
                              )),
                      ])),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
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
                  child: const Text("Next",
                      style: TextStyle(
                        fontSize: 16.0,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.light50,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
