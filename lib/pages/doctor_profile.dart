import 'package:flutter/material.dart';
import 'package:optimum/app_colors.dart';
import 'package:optimum/managers/doctor.manager.dart';
import 'package:optimum/models/doctor.model.dart';

class DoctorProfile extends StatelessWidget {
  final String doctorId;

  const DoctorProfile({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light50,
      appBar: AppBar(
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: FutureBuilder(
            future: doctorManager.getDoctor(doctorId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var doctor = snapshot.data as DoctorProfileModel;
                return ListView(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/icons/star.png"),
                            const SizedBox(width: 2.0),
                            const Text("4.9",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: AppColors.darkNeutrals500,
                                  height: 1.5,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        Container(
                          width: 96,
                          height: 96,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: const Border.fromBorderSide(
                                  BorderSide(color: Colors.white, width: 4.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  offset: const Offset(0, 5),
                                  blurRadius: 15.0,
                                )
                              ]),
                          child: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://source.unsplash.com/random/?doctor")),
                        ),
                        const SizedBox(width: 68.0),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    Text(
                      "Dr. ${doctor.name}",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        height: 1.25,
                        color: AppColors.darkNeutrals500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32.0),
                    const Text(
                      "Info",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                        color: AppColors.darkNeutrals500,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Patients",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    color: AppColors.darkNeutrals500),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "200+",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                    color: AppColors.primaryColor),
                              )
                            ]),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Experience",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                  color: AppColors.darkNeutrals500),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              "${doctor.experience} years",
                              style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                  color: AppColors.primaryColor),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Charges",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                  color: AppColors.darkNeutrals500),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              "${doctor.charges[0].charges.toString()} pkr",
                              style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                  color: AppColors.primaryColor),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32.0),
                    const Text(
                      "Bio",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                        color: AppColors.darkNeutrals500,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Text(
                      "Experienced physiotherapist with over ${doctor.experience} years of experience, specialized in back pain, neck pain, shoulder pain, and sports injuries. He is also certified in dry needling and acupuncture.",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        color: AppColors.darkNeutrals100,
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    const Text(
                      "Location",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                        color: AppColors.darkNeutrals500,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Text(
                      "${doctor.clinicName} - ${doctor.address} - ${doctor.city} - ${doctor.state}",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        color: AppColors.darkNeutrals100,
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        fixedSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Make appointment",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                            color: Colors.white,
                          )),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}
