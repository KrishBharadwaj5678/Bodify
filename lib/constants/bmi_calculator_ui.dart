import 'package:flutter/material.dart';

class BmiCalculatorUi {
  static Color backgroundColor = Color.fromRGBO(244, 243, 255, 1);

  static TextStyle heading = TextStyle(
    color: Color.fromRGBO(8, 24, 84, 1),
    fontSize: 23,
  );

  // Dialog Section
  static RoundedRectangleBorder dialogShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  );

  static TextStyle dialogHeading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static TextStyle dialogSubHeading = TextStyle(
    fontSize: 16,
    color: Colors.black54,
  );

  static ButtonStyle dialogNoButton = TextButton.styleFrom(
    backgroundColor: Colors.grey.shade200,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  );

  static ButtonStyle dialogYesButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.red.shade400,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  );

  // Card Section
  static EdgeInsets cardPadding = EdgeInsets.only(
    left: 22,
    right: 22,
    top: 18,
    bottom: 18,
  );

  static EdgeInsets cardMargin = EdgeInsets.only(left: 15);

  static BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(12)),
  );

  static TextStyle cardLabel = TextStyle(
    fontSize: 21,
    color: Color.fromRGBO(47, 46, 65, 1),
    fontWeight: FontWeight(450),
  );

  static TextStyle cardValue = TextStyle(
    fontSize: 59,
    color: Color.fromRGBO(108, 99, 255, 1),
    fontWeight: FontWeight(700),
    height: 1.3,
  );

  // Radio Section
  static TextStyle radioLabel = TextStyle(
    fontSize: 20,
    color: Color.fromRGBO(47, 46, 65, 1),
    fontWeight: FontWeight(450),
  );

  // Button Section
  static EdgeInsets buttonPadding = EdgeInsets.only(
    left: 15,
    right: 15,
    top: 5,
  );

  static ButtonStyle buttonStyle = IconButton.styleFrom(
    backgroundColor: Color.fromRGBO(8, 24, 84, 1),
  );
}
