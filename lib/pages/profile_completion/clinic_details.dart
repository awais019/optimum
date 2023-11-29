import 'package:flutter/material.dart';
import 'package:optimum/app_colors.dart';

class ClinicDetails extends StatelessWidget {
  ClinicDetails({super.key});

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();

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
                      text: "3",
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
              const SizedBox(width: 16.0)
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 24.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
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
                  TextSpan(
                      text: "Clinic ",
                      style: TextStyle(color: AppColors.primaryColor)),
                  TextSpan(text: "Details"),
                ])),
            const SizedBox(height: 8.0),
            const Text(
                "Fill your clinic details with city & zip code. So  patients can find you easier.",
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
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: 'Clinic Name',
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
                            return "Clinic name is required";
                          } else if (value.length < 5) {
                            return "Clinic name must be at least 5 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                            hintText: 'Address',
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
                            return "Address is required";
                          } else if (value.length < 5) {
                            return "Address must be at least 5 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: cityController,
                              decoration: InputDecoration(
                                  hintText: 'Clinic Name',
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
                                  return "City is required";
                                } else if (value.length < 5) {
                                  return "City must be at least 5 characters";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 24.0),
                          Expanded(
                            child: TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  hintText: 'State',
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
                                  return "State is required";
                                } else if (value.length < 5) {
                                  return "State must be at least 5 characters";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24.0),
                      TextFormField(
                        controller: zipCodeController,
                        decoration: InputDecoration(
                            hintText: 'Zip code',
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
                            return "Zip code is required";
                          } else if (int.tryParse(value) == null) {
                            return "Zip code must be a number";
                          }
                          return null;
                        },
                      ),
                    ])),
            const SizedBox(height: 32.0),
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
    );
  }
}
