import 'package:flutter/material.dart';

class Screen {
  static String getDeviceType(BuildContext context) {
    final data = MediaQuery.of(context);
    print("Size : ${data.size.shortestSide}");
    return data.size.shortestSide < 400
        ? 'phone'
        : data.size.shortestSide < 500
            ? 'big phone'
            : data.size.shortestSide > 1250
                ? 'large tablet'
                : 'tablet';
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

  static double responsiveScreen(
      BuildContext context,
      double tablet,
      double iosphone,
      double bigphone,
      double smallphone,
      double large_tablet) {
    var screen = Screen.getDeviceType(context);
    if (screen == 'tablet') {
      print("This Is Tablet");
      return tablet;
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      print("This Is IOS");
      return iosphone;
    } else if (screen == 'large tablet') {
      print("This Is large Tablet");

      return large_tablet;
    } else if (screen == 'big phone') {
      print("This Is Big phone");

      return bigphone;
    } else {
      print("This Is small phone");

      return smallphone;
    }
  }
}
