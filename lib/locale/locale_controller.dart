import 'dart:ui';

import 'package:get/get.dart';

class LocalController extends GetxController {
  RxBool lang = true.obs;
  RxBool get getLang => this.lang;

  void changeLanguage(String code) {
    Locale locale = Locale(code);
    Get.updateLocale(locale);
    print("LocalCode : ${locale.languageCode}");
    if (locale.languageCode == "ar") {
      lang.value = true;
    } else {
      lang.value = false;
    }
  }
}
