import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/view/bunches.dart';
import 'package:said_lite/view/complete_pay.dart';
import 'package:said_lite/view/forget_password.dart';
import 'package:said_lite/view/home.dart';
import 'package:said_lite/view/register.dart';
import 'package:said_lite/view/terms.dart';
import 'package:said_lite/view/verified.dart';

import 'view/building_info.dart';
import 'view/login.dart';

void main() {
  Values values = Get.put(Values(), permanent: true);
  runApp(DevicePreview(
    builder: (context) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page: () => const Home()),
          GetPage(name: "/register", page: () => Register(isChecked: false)),
          GetPage(name: "/term", page: () => const Term()),
          GetPage(name: "/verified", page: () => Verified(numberPhone: "")),
          GetPage(name: "/login", page: () => const Login()),
          GetPage(name: "/forget_password", page: () => const ForgetPassword()),
          GetPage(name: "/buildInfo", page: () => const BuildingInfo()),
          GetPage(name: "/bunches", page: () => const Bunches()),
        ],
      );
    },
  ));
}
