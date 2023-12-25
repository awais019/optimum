import 'package:flutter/material.dart';
import 'package:optimum/app_colors.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final _formKey = GlobalKey<FormState>();

  RangeValues _experienceRangeValues = const RangeValues(1.0, 30);
  RangeValues _ratingRangeValues = const RangeValues(1.0, 5.0);

  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();

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
          "Filters",
          style: TextStyle(
            fontSize: 20.0,
            height: 1.25,
            color: AppColors.darkNeutrals500,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Form(
          key: _formKey,
          child: ListView(children: [
            const Text(
              "Years of experience",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: AppColors.darkNeutrals500,
                height: 1.33,
              ),
            ),
            const SizedBox(height: 24.0),
            Column(
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppColors.primaryColor,
                    inactiveTrackColor: AppColors.primaryColor50,
                    rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
                    trackHeight: 8.0,
                    rangeThumbShape: const RoundRangeSliderThumbShape(
                        enabledThumbRadius: 10.0),
                    thumbColor: AppColors.primaryColor,
                    overlayColor: AppColors.primaryColor50,
                    tickMarkShape: const RoundSliderTickMarkShape(),
                    activeTickMarkColor: AppColors.primaryColor,
                    inactiveTickMarkColor: AppColors.primaryColor50,
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 0),
                    valueIndicatorShape:
                        const PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: AppColors.primaryColor,
                    valueIndicatorTextStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: RangeSlider(
                    values: _experienceRangeValues,
                    min: 1.0,
                    max: 30.0,
                    divisions: 29,
                    labels: RangeLabels(
                      _experienceRangeValues.start.round().toString(),
                      _experienceRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _experienceRangeValues = values;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 8.0),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "1",
                        style: TextStyle(
                          fontSize: 12.0,
                          height: 1.33,
                          color: AppColors.darkNeutrals100,
                        ),
                      ),
                      Text(
                        "5",
                        style: TextStyle(
                          fontSize: 12.0,
                          height: 1.33,
                          color: AppColors.darkNeutrals100,
                        ),
                      ),
                      Text(
                        "10",
                        style: TextStyle(
                          fontSize: 12.0,
                          height: 1.33,
                          color: AppColors.darkNeutrals100,
                        ),
                      ),
                      Text(
                        "15",
                        style: TextStyle(
                          fontSize: 12.0,
                          height: 1.33,
                          color: AppColors.darkNeutrals100,
                        ),
                      ),
                      Text(
                        "20",
                        style: TextStyle(
                          fontSize: 12.0,
                          height: 1.33,
                          color: AppColors.darkNeutrals100,
                        ),
                      ),
                      Text(
                        "25",
                        style: TextStyle(
                          fontSize: 12.0,
                          height: 1.33,
                          color: AppColors.darkNeutrals100,
                        ),
                      ),
                      Text(
                        "30",
                        style: TextStyle(
                          fontSize: 12.0,
                          height: 1.33,
                          color: AppColors.darkNeutrals100,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 24.0),
            const Text(
              "Price Range",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: AppColors.darkNeutrals500,
                height: 1.33,
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: minPriceController,
                    decoration: InputDecoration(
                        hintText: '0.00',
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
                      if (value != null &&
                          value.isNotEmpty &&
                          (int.tryParse(value) == null)) {
                        return "Must be numeric";
                      } else if (value != null &&
                          value.isNotEmpty &&
                          int.parse(value) < 0) {
                        return "Must be positive";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 12.0),
                const Text("to",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkNeutrals500,
                      height: 1.5,
                    )),
                const SizedBox(width: 12.0),
                Expanded(
                  child: TextFormField(
                    controller: maxPriceController,
                    decoration: InputDecoration(
                        hintText: '0.00',
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
                      if (value != null &&
                          value.isNotEmpty &&
                          int.tryParse(value) == null) {
                        debugPrint('value $value');
                        return "Must be numeric";
                      } else if (value != null &&
                          value.isNotEmpty &&
                          int.parse(value) < 0) {
                        return "Must be positive";
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 24.0),
            const Text(
              "Ratings",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: AppColors.darkNeutrals500,
                height: 1.33,
              ),
            ),
            const SizedBox(height: 24.0),
            Column(
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppColors.primaryColor,
                    inactiveTrackColor: AppColors.primaryColor50,
                    rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
                    trackHeight: 8.0,
                    rangeThumbShape: const RoundRangeSliderThumbShape(
                        enabledThumbRadius: 10.0),
                    thumbColor: AppColors.primaryColor,
                    overlayColor: AppColors.primaryColor50,
                    tickMarkShape: const RoundSliderTickMarkShape(),
                    activeTickMarkColor: AppColors.primaryColor,
                    inactiveTickMarkColor: AppColors.primaryColor50,
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 0),
                    valueIndicatorShape:
                        const PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: AppColors.primaryColor,
                    valueIndicatorTextStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: RangeSlider(
                    values: _ratingRangeValues,
                    min: 1.0,
                    max: 5.0,
                    divisions: 4,
                    labels: RangeLabels(
                      _ratingRangeValues.start.round().toString(),
                      _ratingRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _ratingRangeValues = values;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 8.0),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "1",
                        style: TextStyle(
                          fontSize: 12.0,
                          height: 1.33,
                          color: AppColors.darkNeutrals100,
                        ),
                      ),
                      Text(
                        "2",
                        style: TextStyle(
                          fontSize: 12.0,
                          height: 1.33,
                          color: AppColors.darkNeutrals100,
                        ),
                      ),
                      Text(
                        "3",
                        style: TextStyle(
                          fontSize: 12.0,
                          height: 1.33,
                          color: AppColors.darkNeutrals100,
                        ),
                      ),
                      Text(
                        "4",
                        style: TextStyle(
                          fontSize: 12.0,
                          height: 1.33,
                          color: AppColors.darkNeutrals100,
                        ),
                      ),
                      Text(
                        "5",
                        style: TextStyle(
                          fontSize: 12.0,
                          height: 1.33,
                          color: AppColors.darkNeutrals100,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 32.0),
            Row(children: [
              TextButton(
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 18.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: AppColors.primaryColor50,
                    ),
                    child: const Text(
                      "Reset All",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        height: 1.42,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )),
              const SizedBox(width: 16.0),
              TextButton(
                  onPressed: () {
                    _formKey.currentState!.validate();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 18.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: AppColors.primaryColor,
                    ),
                    child: const Text(
                      "Apply Filters",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        height: 1.42,
                        color: AppColors.light50,
                      ),
                    ),
                  )),
            ])
          ]),
        ),
      ),
    );
  }
}
