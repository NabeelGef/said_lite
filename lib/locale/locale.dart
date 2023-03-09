import 'package:get/get.dart';

import '../constant/values.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "Said Lite": "سائد لايت",
          "Accountable": "المحاسبي",
          "Login": "تسجيل الدّخول",
          "Register": "تسجيل جديد",
          "contact with support": "التّواصل مع الدعم",
          "cancle": "إلغاء",
          "please Enter The phone number": "فضلاً قم بإدخال رقم الجوال",
          "Use A Number Phone To Continue Register":
              "استخدم رقم الجوال لإكمال التّسجيل",
          "I Have read": "لقد قرأت",
          "The terms and conditions": "الشّروط والأحكام",
          "Next": "التّالي",
          "${Values.getStringtermEnglish()}": "${Values.getStringterm()}",
          "Terms and Conditions": "الشّروط والأحكام",
          "Accept": "الموافقة"
        },
        "en": {
          "سائد لايت": "Said Lite",
          "المحاسبي": "Accountable",
          "تسجيل جديد": "Register",
          "تسجيل الدّخول": "Login",
          "التّواصل مع الدعم": "contact with support",
          "إلغاء": "cancle",
          "فضلاً قم بإدخال رقم الجوال": "please Enter The phone number",
          "استخدم رقم الجوال لإكمال التّسجيل":
              "Use A Number Phone To Continue Register",
          "لقد قرأت": "I Have read",
          "الشّروط والأحكام": "The terms and conditions",
          "التّالي": "Next",
          "${Values.getStringterm()}": "${Values.getStringtermEnglish()}",
          "الشّروط والأحكام": "Terms and Conditions",
          "الموافقة": "Accept"
        }
      };
}
