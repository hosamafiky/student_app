import 'package:flutter/material.dart';

class SizeConfig {
  static double getProportionalWidth(context, double width) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return (width / 375) * deviceWidth;
  }

  static double getProportionalHeight(context, double height) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return (height / 812) * deviceHeight;
  }
}
