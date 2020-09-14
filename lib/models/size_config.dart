import 'package:flutter/material.dart';

class SizeConfig {
  static double screenHeight;
  static double screenWidth;
  static MediaQueryData _mediaQueryData;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
  }
}

double getScreenHeightProportion(int height) {
  double screenHeight = SizeConfig.screenHeight;
  return (height / 812) * screenHeight;
}

double getScreenWidthProportion(int width) {
  double screenWidth = SizeConfig.screenWidth;
  return (width / 400) * screenWidth;
}
