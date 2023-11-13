import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:optimum/app_colors.dart';

import 'package:optimum/models/user.dart';
import 'package:optimum/view_models/UserViewModel.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

enum GENDER { male, female }

extension GenderExtension on GENDER {
  String get value {
    switch (this) {
      case GENDER.male:
        return 'Male';
      case GENDER.female:
        return 'Female';
      default:
        return 'Unknown';
    }
  }
}

class _GenderState extends State<Gender> {
  GENDER? _selectedGender = GENDER.male;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserViewModel>(
        converter: (store) => UserViewModel.create(store),
        builder: (context, viewModel) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              // leading: IconButton(
              //   padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   icon: const Icon(
              //     Icons.navigate_before,
              //     color: AppColors.darkNeutrals500,
              //     size: 24.0,
              //   ),
              // ),
              title: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                            color: AppColors.darkNeutrals500,
                          ),
                          children: [
                        const TextSpan(
                            text: "1",
                            style: TextStyle(
                              fontSize: 20.0,
                              height: 1.2,
                              fontWeight: FontWeight.w600,
                            )),
                        const TextSpan(
                            text: "/",
                            style: TextStyle(
                              fontSize: 16.0,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                            )),
                        TextSpan(
                            text: viewModel.user.role == "DOCTOR" ? "5" : "2",
                            style: const TextStyle(
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
                    if (viewModel.user.role == "DOCTOR")
                      const SizedBox(width: 4.0),
                    if (viewModel.user.role == "DOCTOR")
                      const Icon(Icons.circle,
                          color: AppColors.darkNeutrals500, size: 8.0),
                    if (viewModel.user.role == "DOCTOR")
                      const SizedBox(width: 4.0),
                    if (viewModel.user.role == "DOCTOR")
                      const Icon(Icons.circle,
                          color: AppColors.darkNeutrals500, size: 8.0),
                    if (viewModel.user.role == "DOCTOR")
                      const SizedBox(width: 4.0),
                    if (viewModel.user.role == "DOCTOR")
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
                          TextSpan(text: "What's your "),
                          TextSpan(
                              text: "Gender",
                              style: TextStyle(color: AppColors.primaryColor)),
                          TextSpan(text: "?"),
                        ])),
                    const SizedBox(height: 8.0),
                    const Text(
                        "To give you a better treatment & experience we need to know your gender",
                        style: TextStyle(
                            color: AppColors.darkNeutrals100,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            height: 1.5)),
                    const SizedBox(height: 32.0),
                    Row(children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0,
                                  color: _selectedGender == GENDER.male
                                      ? AppColors.primaryColor
                                      : AppColors.darkNeutrals50),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: ListTile(
                            horizontalTitleGap: 0.0,
                            title: Text('Male',
                                style: TextStyle(
                                    color: _selectedGender == GENDER.male
                                        ? AppColors.primaryColor
                                        : AppColors.darkNeutrals100,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5)),
                            leading: Radio<GENDER>(
                              value: GENDER.male,
                              groupValue: _selectedGender,
                              onChanged: (GENDER? value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                              activeColor: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24.0),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0,
                                  color: _selectedGender == GENDER.female
                                      ? AppColors.primaryColor
                                      : AppColors.darkNeutrals50),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: ListTile(
                            horizontalTitleGap: 0.0,
                            title: Text('Female',
                                style: TextStyle(
                                    color: _selectedGender == GENDER.female
                                        ? AppColors.primaryColor
                                        : AppColors.darkNeutrals100,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5)),
                            leading: Radio<GENDER>(
                              value: GENDER.female,
                              groupValue: _selectedGender,
                              onChanged: (GENDER? value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                              activeColor: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ]),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.onUpdateUserGender(_selectedGender!.value);
                          Navigator.pushNamed(context, "/dob");
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
        });
  }
}
