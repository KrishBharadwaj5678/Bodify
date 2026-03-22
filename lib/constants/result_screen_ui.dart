import 'package:flutter/material.dart';

class ResultScreenUi {
  static TextStyle subHeading = TextStyle(
    color: Color.fromRGBO(8, 24, 84, 1),
    fontSize: 29,
  );

  static EdgeInsets cardPadding = EdgeInsets.only(
    left: 24,
    right: 24,
    top: 50,
    bottom: 29,
  );

  static EdgeInsets cardMargin = EdgeInsets.only(left: 13, right: 13);

  static TextStyle bmiResults = TextStyle(
    color: Color.fromRGBO(8, 24, 84, 1),
    fontSize: 32,
  );

  static TextStyle bmiValueBefore = TextStyle(
    color: Color.fromRGBO(108, 99, 255, 1),
    fontSize: 135,
    fontWeight: FontWeight(550),
    height: 1,
    letterSpacing: -4,
  );

  static TextStyle bmiValueAfter = TextStyle(
    color: Color.fromRGBO(108, 99, 255, 1),
    fontSize: 58,
    fontWeight: FontWeight(550),
    height: 1,
  );

  static TextStyle bmiCategory = TextStyle(
    color: Color.fromRGBO(8, 24, 84, 1),
    fontSize: 27,
    fontWeight: FontWeight(500),
    height: 0,
  );

  static TextStyle bmiInfo = TextStyle(
    color: Color.fromRGBO(8, 24, 84, 1),
    fontSize: 17,
    fontWeight: FontWeight(500),
  );
}
