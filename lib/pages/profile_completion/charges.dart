import 'package:flutter/material.dart';
import 'package:optimum/app_colors.dart';

class Charges extends StatefulWidget {
  const Charges({super.key});

  @override
  State<Charges> createState() => _ChargesState();
}

class _ChargesState extends State<Charges> {
  final _formKey = GlobalKey<FormState>();

  final physicalCharges = TextEditingController();
  final virtualCharges = TextEditingController();

  bool physicalToggle = true;
  bool virtualToggle = false;

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
                      text: "4",
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
                  TextSpan(text: "Your "),
                  TextSpan(
                      text: "Charges",
                      style: TextStyle(color: AppColors.primaryColor)),
                ])),
            const SizedBox(height: 8.0),
            const Text(
                "Set your pricing for the therapy appointment services you give to your patients",
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                physicalToggle = !physicalToggle;
                              });
                            },
                            icon: physicalToggle
                                ? const Icon(
                                    Icons.toggle_on,
                                    color: AppColors.primaryColor,
                                    size: 40.0,
                                  )
                                : const Icon(
                                    Icons.toggle_off,
                                    color: AppColors.darkNeutrals50,
                                    size: 40.0,
                                  ),
                          ),
                          const SizedBox(width: 4.0),
                          const Text("Physical",
                              style: TextStyle(
                                  color: AppColors.darkNeutrals500,
                                  fontSize: 16.0,
                                  height: 1.5,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      TextFormField(
                        controller: physicalCharges,
                        enabled: physicalToggle,
                        decoration: InputDecoration(
                            hintText: 'Physical Charges',
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
                            disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.darkNeutrals50, width: 1.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Physical Charges is required";
                          } else if (double.tryParse(value) == null ||
                              double.tryParse(value)! <= 0) {
                            return "Physical Charges must be a positive number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                virtualToggle = !virtualToggle;
                              });
                            },
                            icon: virtualToggle
                                ? const Icon(
                                    Icons.toggle_on,
                                    color: AppColors.primaryColor,
                                    size: 40.0,
                                  )
                                : const Icon(
                                    Icons.toggle_off,
                                    color: AppColors.darkNeutrals50,
                                    size: 40.0,
                                  ),
                          ),
                          const SizedBox(width: 4.0),
                          const Text("Virtual",
                              style: TextStyle(
                                  color: AppColors.darkNeutrals500,
                                  fontSize: 16.0,
                                  height: 1.5,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      TextFormField(
                        controller: virtualCharges,
                        enabled: virtualToggle,
                        decoration: InputDecoration(
                            hintText: 'Virtual charges',
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
                            disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.darkNeutrals50, width: 1.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Virtual Charges is required";
                          } else if (double.tryParse(value) == null ||
                              double.tryParse(value)! <= 0) {
                            return "Virtual Charges must be a positive number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                    ])),
            const SizedBox(height: 32.0),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(230, 126, 26, 0.15),
                    blurRadius: 16.0,
                    offset: Offset(0, 8.0),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
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
