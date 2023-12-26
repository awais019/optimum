import 'package:flutter/material.dart';
import 'package:optimum/app_colors.dart';
import 'package:optimum/managers/doctor.manager.dart';
import 'package:optimum/models/doctor.model.dart';
import 'package:optimum/pages/doctor_profile.dart';

class DoctorSearch extends StatefulWidget {
  const DoctorSearch({super.key});

  @override
  State<DoctorSearch> createState() => _DoctorSearchState();
}

class _DoctorSearchState extends State<DoctorSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text(
          "Find Therapists",
          style: TextStyle(
            color: AppColors.darkNeutrals500,
            fontSize: 20.0,
            height: 1.25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.05),
                          offset: Offset(0, 5),
                          blurRadius: 25.0)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Form(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        Image.asset("assets/icons/search.png"),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Search physiotherapist",
                              hintStyle: TextStyle(
                                color: AppColors.darkNeutrals100,
                                fontSize: 16.0,
                                height: 1.5,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/doctor/filters");
                            },
                            icon: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Image.asset(
                                  "assets/icons/filters.png",
                                  height: 40.0,
                                  width: 40.0,
                                )))
                      ])),
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            FutureBuilder(
                future: doctorManager.getDoctors(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var doctors = snapshot.data as List<Doctor>;
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: doctors.length,
                        itemBuilder: ((context, index) {
                          return DoctorCard(doctor: doctors[index]);
                        }));
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DoctorProfile(doctorId: doctor.id)));
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              offset: Offset(0, 5),
              blurRadius: 25.0,
            )
          ],
        ),
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
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
                const SizedBox(height: 24.0),
                Text(
                  "Dr. ${doctor.name}",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    height: 1.33,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  "${doctor.clinicName} - ${doctor.address} - ${doctor.city} - ${doctor.state}",
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: AppColors.darkNeutrals100,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Physiotherapist Specialized in orthopedics and sports injuries with ${doctor.experience} years of experience",
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: AppColors.darkNeutrals100,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
