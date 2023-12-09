import 'package:flutter/material.dart';
import 'package:optimum/app_colors.dart';

class DoctorSearch extends StatefulWidget {
  const DoctorSearch({super.key});

  @override
  State<DoctorSearch> createState() => _DoctorSearchState();
}

class _DoctorSearchState extends State<DoctorSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                            hintText: "Search phyiotherapist",
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
                          onPressed: () {},
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
          )
        ],
      ),
    );
  }
}
