import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/view/about.dart';
import 'package:said_lite/view/add_product.dart';
import 'package:said_lite/view/bunches.dart';
import 'package:said_lite/view/chat.dart';
import 'package:said_lite/view/common_question.dart';
import 'package:said_lite/view/complete_pay.dart';
import 'package:said_lite/view/forget_password.dart';
import 'package:said_lite/view/home.dart';
import 'package:said_lite/view/list_buying_invoice.dart';
import 'package:said_lite/view/list_sales_invoice.dart';
import 'package:said_lite/view/sales_return.dart';
import 'package:said_lite/view/send_message.dart';
import 'package:said_lite/view/start.dart';
import 'package:said_lite/view/register.dart';
import 'package:said_lite/view/subscribe_management.dart';
import 'package:said_lite/view/terms.dart';
import 'package:said_lite/view/verified.dart';
import 'view/building_info.dart';
import 'view/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Values values = Get.put(Values(), permanent: true);
  runApp(FlutterSizer(builder: (context, orientation, devicetype) {
    return DevicePreview(
      builder: (context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: (context, child) {
            ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),
              maxWidth: 1200,
              minWidth: 450,
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.resize(450, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
                ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
            );
            return DevicePreview.appBuilder(context, child);
          },
          initialRoute: "/",
          getPages: [
            GetPage(name: "/", page: () => const Start()),
            GetPage(name: "/register", page: () => Register(isChecked: false)),
            GetPage(name: "/term", page: () => const Term()),
            GetPage(name: "/verified", page: () => Verified(numberPhone: "")),
            GetPage(name: "/login", page: () => const Login()),
            GetPage(
                name: "/forget_password", page: () => const ForgetPassword()),
            GetPage(name: "/buildInfo", page: () => const BuildingInfo()),
            GetPage(name: "/bunches", page: () => const Bunches()),
            GetPage(name: "/home", page: () => const Home()),
            GetPage(name: "/list_sales", page: () => const SalesInvoice()),
            GetPage(name: "/list_buying", page: () => const BuyingInvoice()),
            GetPage(name: "/sales_return", page: () => const SalesReturn()),
            GetPage(name: "/add_product", page: () => const AddProduct()),
            GetPage(name: "/send_message", page: () => const SendMessage()),
            GetPage(
                name: "/common_question", page: () => const CommonQuestion()),
            GetPage(name: "/about", page: () => const About()),
            GetPage(
              name: "/subscribe_management",
              page: () => const SubscribeManagement(),
            ),
            GetPage(name: "/chat", page: () => const Chat())
          ],
        );
      },
    );
  }));
}
