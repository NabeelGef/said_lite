import 'package:flutter/material.dart';

class Screen {
  static String getDeviceType(BuildContext context) {
    final data = MediaQuery.of(context);
    print("Size : ${data.size.shortestSide}");
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  double widthscreen = 0.0;
  double get getWidthscreen => this.widthscreen;

  set setWidthscreen(double widthscreen) => this.widthscreen = widthscreen;
  double heightscreen = 0.0;
  double get getHeightscreen => this.heightscreen;

  set setHeightscreen(double heightscreen) => this.heightscreen = heightscreen;
  Screen(BuildContext context) {
    widthscreen = MediaQuery.of(context).size.width;
    heightscreen = MediaQuery.of(context).size.height;
  }
}
