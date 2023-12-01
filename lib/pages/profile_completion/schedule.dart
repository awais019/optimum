import 'package:flutter/material.dart';
import 'package:optimum/app_colors.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final _formKey = GlobalKey<FormState>();

  final physicalCharges = TextEditingController();
  final virtualCharges = TextEditingController();

  int slotDuration = 15;

  List<WorkingHours> workingHours = [
    WorkingHours(
      day: "Monday",
      isWorking: false,
      startTime: "08:00",
      endTime: "17:00",
    ),
    WorkingHours(
      day: "Tuesday",
      isWorking: false,
      startTime: "08:00",
      endTime: "17:00",
    ),
    WorkingHours(
      day: "Wednesday",
      isWorking: false,
      startTime: "08:00",
      endTime: "17:00",
    ),
    WorkingHours(
      day: "Thursday",
      isWorking: false,
      startTime: "08:00",
      endTime: "17:00",
    ),
    WorkingHours(
      day: "Friday",
      isWorking: false,
      startTime: "08:00",
      endTime: "17:00",
    ),
    WorkingHours(
      day: "Saturday",
      isWorking: false,
      startTime: "08:00",
      endTime: "17:00",
    ),
    WorkingHours(
      day: "Sunday",
      isWorking: false,
      startTime: "08:00",
      endTime: "17:00",
    ),
  ];

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
                      text: "5",
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
              const SizedBox(width: 16.0)
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 24.0),
            RichText(
                text: const TextSpan(
                    style: TextStyle(
                      color: AppColors.darkNeutrals500,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w700,
                      height: 1.23,
                    ),
                    children: [
                  TextSpan(text: "Set your "),
                  TextSpan(
                      text: "Availability",
                      style: TextStyle(color: AppColors.primaryColor)),
                ])),
            const SizedBox(height: 8.0),
            const Text(
                "Set your available working hours for the services you offered",
                style: TextStyle(
                    color: AppColors.darkNeutrals100,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    height: 1.5)),
            const SizedBox(height: 32.0),
            const Text(
              "Slot Duration",
              style: TextStyle(
                  fontSize: 18.0, fontWeight: FontWeight.w600, height: 1.5),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      slotDuration = 15;
                    });
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0)),
                    backgroundColor: slotDuration == 15
                        ? MaterialStateProperty.all<Color>(
                            AppColors.darkNeutrals500)
                        : MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: slotDuration == 15
                          ? const BorderSide(
                              color: AppColors.darkNeutrals500, width: 1.0)
                          : const BorderSide(
                              color: AppColors.darkNeutrals50, width: 1.0),
                    )),
                  ),
                  child: Text(
                    "15 mins",
                    style: TextStyle(
                      color: slotDuration == 15
                          ? Colors.white
                          : AppColors.darkNeutrals100,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      slotDuration = 30;
                    });
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0)),
                    backgroundColor: slotDuration == 30
                        ? MaterialStateProperty.all<Color>(
                            AppColors.darkNeutrals500)
                        : MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: slotDuration == 30
                          ? const BorderSide(
                              color: AppColors.darkNeutrals500, width: 1.0)
                          : const BorderSide(
                              color: AppColors.darkNeutrals50, width: 1.0),
                    )),
                  ),
                  child: Text(
                    "30 mins",
                    style: TextStyle(
                      color: slotDuration == 30
                          ? Colors.white
                          : AppColors.darkNeutrals100,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      slotDuration = 45;
                    });
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        slotDuration == 45
                            ? AppColors.darkNeutrals500
                            : Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            side: slotDuration == 45
                                ? const BorderSide(
                                    color: AppColors.darkNeutrals500,
                                    width: 1.0)
                                : const BorderSide(
                                    color: AppColors.darkNeutrals50,
                                    width: 1.0))),
                  ),
                  child: Text(
                    "45 mins",
                    style: TextStyle(
                      color: slotDuration == 45
                          ? Colors.white
                          : AppColors.darkNeutrals100,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            const SizedBox(
              width: double.infinity,
              height: 1.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: AppColors.darkNeutrals50),
              ),
            ),
            const SizedBox(height: 24.0),
            const Text(
              "Working Hours",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                height: 1.33,
              ),
            ),
            const SizedBox(height: 24.0),
            for (WorkingHours workingHour in workingHours)
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            workingHour.isWorking = !workingHour.isWorking;
                          });
                        },
                        icon: workingHour.isWorking
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
                      Text(
                        workingHour.day,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  if (workingHour.isWorking)
                    Row(children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: AppColors.darkNeutrals50, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: AppColors.darkNeutrals50, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: AppColors.darkNeutrals50, width: 1.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 16.0),
                            hintText: "Start Time",
                            hintStyle: const TextStyle(
                              color: AppColors.darkNeutrals100,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                            ),
                          ),
                          value: workingHour.startTime,
                          onChanged: (String? newValue) {
                            setState(() {
                              workingHour.startTime = newValue!;
                            });
                          },
                          items: <String>[
                            '08:00',
                            '09:00',
                            '10:00',
                            '11:00',
                            '12:00',
                            '13:00',
                            '14:00',
                            '15:00',
                            '16:00',
                            '17:00',
                            '18:00',
                            '19:00',
                            '20:00',
                            '21:00',
                            '22:00',
                            '23:00',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  color: AppColors.darkNeutrals500,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                ),
                              ),
                            );
                          }).toList(),
                          icon: Image.asset("assets/icons/arrow_down.png"),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: AppColors.darkNeutrals50, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: AppColors.darkNeutrals50, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: AppColors.darkNeutrals50, width: 1.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 16.0),
                            hintText: "Start Time",
                            hintStyle: const TextStyle(
                              color: AppColors.darkNeutrals100,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                            ),
                          ),
                          value: workingHour.endTime,
                          onChanged: (String? newValue) {
                            setState(() {
                              workingHour.endTime = newValue!;
                            });
                          },
                          items: <String>[
                            '08:00',
                            '09:00',
                            '10:00',
                            '11:00',
                            '12:00',
                            '13:00',
                            '14:00',
                            '15:00',
                            '16:00',
                            '17:00',
                            '18:00',
                            '19:00',
                            '20:00',
                            '21:00',
                            '22:00',
                            '23:00',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  color: AppColors.darkNeutrals500,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                ),
                              ),
                            );
                          }).toList(),
                          icon: Image.asset("assets/icons/arrow_down.png"),
                        ),
                      ),
                    ]),
                ],
              ),
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
                child: const Text("Save & continue",
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

class WorkingHours {
  String day;
  bool isWorking;
  String startTime;
  String endTime;

  WorkingHours({
    required this.day,
    required this.isWorking,
    required this.startTime,
    required this.endTime,
  });
}
