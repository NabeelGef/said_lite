import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:said_lite/view/home.dart';
import 'package:said_lite/view/register.dart';
import 'package:said_lite/view/terms.dart';
import 'package:said_lite/view/verified.dart';

import 'view/login.dart';

void main() {
  runApp(
    DevicePreview(builder: (context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=> const Home()),
        GetPage(name: "/register", page: () =>  Register(isChecked: false)),
        GetPage(name: "/term", page: () => const Term()),
        GetPage(name: "/verified", page: () =>  Verified(numberPhone: "")),
        GetPage(name: "/login", page: ()=>const Login())
      ],
  );  
    },)
    
  );
}
