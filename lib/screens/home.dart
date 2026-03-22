import 'package:bmi_calculator/constants/bmi_calculator_ui.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slider_bar/slider_bar.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int age = 38;
  int weight = 78;
  double height = 175;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BmiCalculatorUi.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            spacing: 25,
            children: [
              SizedBox(height: 55),

              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: BmiCalculatorUi.dialogShape,
                          backgroundColor: Colors.white,
                          title: Text(
                            "Exit App",
                            style: BmiCalculatorUi.dialogHeading,
                          ),
                          content: Text(
                            "Are you sure you want to exit?",
                            style: BmiCalculatorUi.dialogSubHeading,
                          ),
                          actions: [
                            TextButton(
                              style: BmiCalculatorUi.dialogNoButton,
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "No",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            TextButton(
                              style: BmiCalculatorUi.dialogYesButton,
                              onPressed: () => SystemNavigator.pop(),
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(width: 6),
                          ],
                        ),
                      );
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

                  SizedBox(width: 48), // 👈 same width as IconButton to balance
                ],
              ),

              // Age & Weight
              Row(
                spacing: 10,
                children: [
                  // Age
                  Container(
                    padding: BmiCalculatorUi.cardPadding,
                    margin: BmiCalculatorUi.cardMargin,
                    decoration: BmiCalculatorUi.cardDecoration,
                    child: Column(
                      children: [
                        Text("Age", style: BmiCalculatorUi.cardLabel),
                        Text(age.toString(), style: BmiCalculatorUi.cardValue),
                        Row(
                          spacing: 38,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  age > 1 ? age-- : 1;
                                });
                              },
                              icon: Icon(Icons.remove),
                              iconSize: 29,
                              padding: EdgeInsets.all(10),
                              color: Colors.white,
                              style: BmiCalculatorUi.buttonStyle,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  age >= 1 ? age++ : 1;
                                });
                              },
                              icon: Icon(Icons.add),
                              iconSize: 29,
                              padding: EdgeInsets.all(10),
                              color: Colors.white,
                              style: BmiCalculatorUi.buttonStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Weight
                  Container(
                    padding: BmiCalculatorUi.cardPadding,
                    margin: BmiCalculatorUi.cardMargin,
                    decoration: BmiCalculatorUi.cardDecoration,
                    child: Column(
                      children: [
                        Text("Weight (KG)", style: BmiCalculatorUi.cardLabel),
                        Text(
                          weight.toString(),
                          style: BmiCalculatorUi.cardValue,
                        ),
                        Row(
                          spacing: 38,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  weight > 1 ? weight-- : 1;
                                });
                              },
                              icon: Icon(Icons.remove),
                              iconSize: 29,
                              padding: EdgeInsets.all(10),
                              color: Colors.white,
                              style: BmiCalculatorUi.buttonStyle,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  weight >= 1 ? weight++ : 1;
                                });
                              },
                              icon: Icon(Icons.add),
                              iconSize: 29,
                              padding: EdgeInsets.all(10),
                              color: Colors.white,
                              style: BmiCalculatorUi.buttonStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Height
              Container(
                decoration: BmiCalculatorUi.cardDecoration,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    Text("Height (CM)", style: BmiCalculatorUi.cardLabel),
                    Text(
                      height.toStringAsFixed(0),
                      style: BmiCalculatorUi.cardValue,
                    ),
                    SizedBox(height: 7),
                    SliderBar(
                      config: SliderConfig(
                        min: 50,
                        max: 300,
                        initialValue: height,
                        direction: SliderDirection
                            .horizontal, // or SliderDirection.vertical
                        labelFormat: (value) => value.toInt().toString(),
                        trackConfig: TrackConfig(
                          activeColor: Color.fromRGBO(204, 204, 204, 1),
                          inactiveColor: Colors.grey.shade300,
                          height: 5.8,
                          radius: 4,
                        ),
                        thumbConfig: ThumbConfig(
                          color: Color.fromRGBO(108, 99, 255, 1),
                          width: 30,
                          height: 30,
                          shape: BoxShape.circle, // or BoxShape.rectangle
                          radius: 12, // for rectangle shape
                          elevation: 2,
                          shadowColor: Colors.black26,
                        ),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue;
                        });
                      },
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("50 cm", style: TextStyle(fontSize: 16)),
                        Text("300 cm", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),

              // Gender
              Container(
                decoration: BmiCalculatorUi.cardDecoration,
                padding: EdgeInsets.all(24),
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    Text("Gender", style: BmiCalculatorUi.cardLabel),
                    SizedBox(height: 15),
                    Row(
                      spacing: 15,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Male", style: BmiCalculatorUi.radioLabel),

                        // Switch
                        LiteRollingSwitch(
                          value: isSwitched,
                          textOn: '',
                          textOff: '',
                          colorOn: Color.fromRGBO(108, 99, 255, 1),
                          colorOff: Color.fromRGBO(108, 99, 255, 1),
                          iconOn: Icons.female,
                          iconOff: Icons.male,
                          textSize: 16.0,
                          onTap: () {},
                          onDoubleTap: () {},
                          onSwipe: () {},
                          onChanged: (bool state) {
                            setState(() {
                              isSwitched = state;
                            });
                          },
                        ),
                        Text("Female", style: BmiCalculatorUi.radioLabel),
                      ],
                    ),
                  ],
                ),
              ),

              // Button
              Padding(
                padding: BmiCalculatorUi.buttonPadding,
                child: SizedBox(
                  width: double.infinity,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            age: age,
                            weight: weight,
                            height: height,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(108, 99, 255, 1),
                    ),
                    child: Text(
                      "Calculate BMI",
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
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
