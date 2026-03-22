import 'package:bmi_calculator/constants/bmi_calculator_ui.dart';
import 'package:bmi_calculator/constants/result_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver2_fixed/image_gallery_saver2_fixed.dart';
import 'package:permission_handler/permission_handler.dart';

class ResultScreen extends StatefulWidget {
  final int age;
  final int weight;
  final double height;

  const ResultScreen({
    super.key,
    required this.age,
    required this.weight,
    required this.height,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  double? heightInMeters;
  double? bmi;
  int? wholePart;
  int? decimalpart;
  String? category;

  ScreenshotController screenshotController = ScreenshotController();

  Future<void> _requestPermission() async {
    await Permission.storage.request();
    await Permission.photos.request();
  }

  Future<void> _saveScreenshot() async {
    await _requestPermission();

    // Image Bytes
    final imageBytes = await screenshotController.capture();
    if (imageBytes == null) return;

    // Save to Gallery
    final result = await ImageGallerySaver.saveImage(
      imageBytes,
      quality: 100,
      name: "bodify_${DateTime.now().microsecondsSinceEpoch}",
    );

    if (!mounted) return;

    if (result['isSuccess'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("✅ Result saved to your gallery.")),
      );
    }
  }

  void _caluclateBMI() {
    heightInMeters = widget.height / 100;
    bmi = widget.weight / (heightInMeters! * heightInMeters!);
    wholePart = bmi!.floor();
    decimalpart = ((bmi! - wholePart!) * 100).round();
  }

  void _calculateCategory() {
    if (bmi! < 18.5) {
      category = "Underweight";
    } else if (bmi! >= 18.5 && bmi! <= 24.9) {
      category = "Healthy";
    } else if (bmi! >= 25 && bmi! <= 29.9) {
      category = "Overweight";
    } else {
      category = "Obesity";
    }
  }

  @override
  void initState() {
    super.initState();
    _caluclateBMI();
    _calculateCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        backgroundColor: BmiCalculatorUi.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 9.0, right: 9.0),
          child: Center(
            child: Column(
              spacing: 40,
              children: [
                SizedBox(height: 50),

                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, size: 26),
                    ),

                    // Expanded is a widget that tells its child -> Take up all the remaining available space
                    Expanded(
                      child: Center(
                        child: Text(
                          "BMI Calculator".toUpperCase(),
                          style: BmiCalculatorUi.heading,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 48,
                    ), // 👈 same width as IconButton to balance
                  ],
                ),

                Text("Body Mass Index", style: ResultScreenUi.subHeading),

                Container(
                  width: double.infinity,
                  decoration: BmiCalculatorUi.cardDecoration,
                  padding: ResultScreenUi.cardPadding,
                  margin: ResultScreenUi.cardMargin,
                  child: Column(
                    spacing: 18,
                    children: [
                      Text("BMI Results", style: ResultScreenUi.bmiResults),

                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: wholePart.toString(),
                              style: ResultScreenUi.bmiValueBefore,
                            ),
                            TextSpan(
                              text: ".${decimalpart.toString()}",
                              style: ResultScreenUi.bmiValueAfter,
                            ),
                          ],
                        ),
                      ),

                      Text(
                        category.toString().toUpperCase(),
                        style: ResultScreenUi.bmiCategory,
                      ),

                      Column(
                        spacing: 2.4,
                        children: [
                          Text(
                            "Underweight: BMI less than 18.5",
                            style: ResultScreenUi.bmiInfo,
                          ),
                          Text(
                            "Normal weight: BMI 18.5 to 24.9",
                            style: ResultScreenUi.bmiInfo,
                          ),
                          Text(
                            "Overweight: BMI 25 to 29.9",
                            style: ResultScreenUi.bmiInfo,
                          ),
                          Text(
                            "Obesity: 30 to 40",
                            style: ResultScreenUi.bmiInfo,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Save the results
                Padding(
                  padding: BmiCalculatorUi.buttonPadding,
                  child: SizedBox(
                    width: double.infinity,
                    height: 75,
                    child: ElevatedButton(
                      onPressed: () async {
                        _saveScreenshot();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(108, 99, 255, 1),
                      ),
                      child: Text(
                        "Save the results",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight(400),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
