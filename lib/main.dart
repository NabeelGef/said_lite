import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/view/add_product.dart';
import 'package:said_lite/view/bunches.dart';
import 'package:said_lite/view/complete_pay.dart';
import 'package:said_lite/view/forget_password.dart';
import 'package:said_lite/view/home.dart';
import 'package:said_lite/view/list_buying_invoice.dart';
import 'package:said_lite/view/list_sales_invoice.dart';
import 'package:said_lite/view/sales_return.dart';
import 'package:said_lite/view/start.dart';
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
          GetPage(name: "/", page: () => const Start()),
          GetPage(name: "/register", page: () => Register(isChecked: false)),
          GetPage(name: "/term", page: () => const Term()),
          GetPage(name: "/verified", page: () => Verified(numberPhone: "")),
          GetPage(name: "/login", page: () => const Login()),
          GetPage(name: "/forget_password", page: () => const ForgetPassword()),
          GetPage(name: "/buildInfo", page: () => const BuildingInfo()),
          GetPage(name: "/bunches", page: () => const Bunches()),
          GetPage(name: "/home", page: () => const Home()),
          GetPage(name: "/list_sales", page: () => const SalesInvoice()),
          GetPage(name: "/list_buying", page: () => const BuyingInvoice()),
          GetPage(name: "/sales_return", page: () => const SalesReturn()),
          GetPage(name: "/add_product", page: () => const AddProduct())
        ],
      );
    },
  ));
}
