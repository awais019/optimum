import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:optimum/app_colors.dart';

import 'package:optimum/models/app.dart';
import 'package:optimum/view_models/auth_view_model.dart';
import 'package:optimum/view_models/user_view_model.dart';
import 'package:optimum/services/auth.service.dart';

class DOB extends StatefulWidget {
  const DOB({super.key});

  @override
  State<DOB> createState() => _DOBState();
}

class _DOBState extends State<DOB> {
  int? selectedDay;
  int? selectedMonth;
  int? selectedYear;

  bool dayEntered = true;
  bool monthEntered = true;
  bool yearEntered = true;

  bool loading = false;

  void handleUpdate(
      UserViewModel userViewModel, AuthViewModel authViewModel) async {
    try {
      DateTime dob = DateTime(selectedYear!, selectedMonth!, selectedDay!);
      userViewModel.onUpdateDOB(dob);
      debugPrint(userViewModel.user.dob.toString());
      setState(() {
        loading = true;
      });
      Future.delayed(const Duration(milliseconds: 5000));
      Response res = await AuthService.updatePatientProfile(
          userViewModel.user, authViewModel.auth.authToken as String);
      setState(() {
        loading = false;
      });
      final Map<String, dynamic> data = json.decode(res.body);
      if (res.statusCode != 200) {
        debugPrint(data["message"]);
      } else {
        if (mounted) {
          Navigator.pushNamed(context, "/");
        }
      }
    } catch (e) {
      debugPrint('$e');
      Fluttertoast.showToast(msg: "Something went wrong!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserViewModel>(
        converter: (store) => UserViewModel.create(store),
        builder: (context, userViewModel) {
          return StoreConnector<AppState, AuthViewModel>(
              converter: (store) => AuthViewModel.create(store),
              builder: (context, authViewModel) {
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
                            text: TextSpan(
                                style: const TextStyle(
                                  color: AppColors.darkNeutrals500,
                                ),
                                children: [
                              const TextSpan(
                                  text: "2",
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
                                  text: userViewModel.user.role == "DOCTOR"
                                      ? "5"
                                      : "2",
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
                          if (userViewModel.user.role == "DOCTOR")
                            const SizedBox(width: 4.0),
                          if (userViewModel.user.role == "DOCTOR")
                            const Icon(Icons.circle,
                                color: AppColors.darkNeutrals500, size: 8.0),
                          if (userViewModel.user.role == "DOCTOR")
                            const SizedBox(width: 4.0),
                          if (userViewModel.user.role == "DOCTOR")
                            const Icon(Icons.circle,
                                color: AppColors.darkNeutrals500, size: 8.0),
                          if (userViewModel.user.role == "DOCTOR")
                            const SizedBox(width: 4.0),
                          if (userViewModel.user.role == "DOCTOR")
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
                                TextSpan(text: "How "),
                                TextSpan(
                                    text: "old ",
                                    style: TextStyle(
                                        color: AppColors.primaryColor)),
                                TextSpan(text: "are you?"),
                              ])),
                          const SizedBox(height: 8.0),
                          const Text("Most therapies depend on it",
                              style: TextStyle(
                                  color: AppColors.darkNeutrals100,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5)),
                          const SizedBox(height: 32.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 4.0, 16.0, 4.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: dayEntered
                                        ? AppColors.darkNeutrals50
                                        : Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<int>(
                                    value: selectedDay,
                                    hint: const Text("DD",
                                        style: TextStyle(
                                            color: AppColors.darkNeutrals100,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            height: 1.2)),
                                    items: List.generate(31, (index) {
                                      return DropdownMenuItem(
                                        value: index + 1,
                                        child: Text('${index + 1}'),
                                      );
                                    }),
                                    style: const TextStyle(
                                        color: AppColors.darkNeutrals100,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.2),
                                    onChanged: (newValue) {
                                      setState(() {
                                        dayEntered = true;
                                        selectedDay = newValue;
                                      });
                                    },
                                    icon: Container(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24.0),
                              Container(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 4.0, 16.0, 4.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: monthEntered
                                        ? AppColors.darkNeutrals50
                                        : Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<int>(
                                    value: selectedMonth,
                                    hint: const Text("MM",
                                        style: TextStyle(
                                            color: AppColors.darkNeutrals100,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            height: 1.2)),
                                    items: List.generate(12, (index) {
                                      return DropdownMenuItem(
                                        value: index + 1,
                                        child: Text('${index + 1}'),
                                      );
                                    }),
                                    style: const TextStyle(
                                        color: AppColors.darkNeutrals100,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.2),
                                    onChanged: (newValue) {
                                      setState(() {
                                        monthEntered = true;
                                        selectedMonth = newValue;
                                      });
                                    },
                                    icon: Container(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24.0),
                              Container(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 4.0, 16.0, 4.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: yearEntered
                                        ? AppColors.darkNeutrals50
                                        : Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<int>(
                                    value: selectedYear,
                                    hint: const Text("YYYY",
                                        style: TextStyle(
                                            color: AppColors.darkNeutrals100,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            height: 1.2)),
                                    items: List.generate(100, (index) {
                                      int year = DateTime.now().year - index;
                                      return DropdownMenuItem(
                                        value: year,
                                        child: Text('$year'),
                                      );
                                    }),
                                    style: const TextStyle(
                                        color: AppColors.darkNeutrals100,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.2),
                                    onChanged: (newValue) {
                                      setState(() {
                                        yearEntered = true;
                                        selectedYear = newValue;
                                      });
                                    },
                                    icon: Container(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (selectedDay == null) {
                                  setState(() {
                                    dayEntered = false;
                                  });
                                }
                                if (selectedMonth == null) {
                                  setState(() {
                                    monthEntered = false;
                                  });
                                }
                                if (selectedYear == null) {
                                  setState(() {
                                    yearEntered = false;
                                  });
                                }
                                if (dayEntered && monthEntered && yearEntered) {
                                  try {
                                    handleUpdate(userViewModel, authViewModel);
                                  } catch (e) {
                                    debugPrint('Error parsing date: $e');
                                  }
                                }
                              },
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
                              child: (userViewModel.user.role == "PATIENT" &&
                                      loading)
                                  ? const SizedBox(
                                      height: 24.0,
                                      width: 24.0,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.0,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white), // Spinner color
                                      ),
                                    )
                                  : const Text("Next",
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
        });
  }
}
