import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/constant/viewport.dart';
import 'package:said_lite/locale/locale_controller.dart';
import 'package:said_lite/view/verified.dart';

class Register extends StatefulWidget {
  bool isChecked;
  String? numberPhone;
  Register({super.key, required this.isChecked, this.numberPhone});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  Values values = Get.find();
  LocalController localcontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    return Scaffold(
      backgroundColor: Coloring.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: viewport.getWidthscreen,
                height: viewport.getHeightscreen / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("فضلاً قم بإدخال رقم الجوال".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Screen.responsiveScreen(
                                context, 12.w, 5.w, 5.w, 20.dp, 20.w),
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold)),
                    Text("استخدم رقم الجوال لإكمال التّسجيل".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Screen.responsiveScreen(
                                context, 8.w, 4.w, 5.w, 15.dp, 15.w),
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            Obx(
              () {
                return values.showCountries(
                    context,
                    viewport.getWidthscreen / 1.4,
                    _formState,
                    widget.numberPhone);
              },
            ),
            Container(
              alignment: Alignment.center,
              width: viewport.getWidthscreen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: localcontroller.getLang.isFalse
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                children: [
                  Text("لقد قرأت".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Screen.responsiveScreen(
                              context, 10.w, 4.w, 5.w, 15.dp, 15.w),
                          fontFamily: Values.fontFamily,
                          fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/term");
                    },
                    child: Text("الشّروط والأحكام".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Screen.responsiveScreen(
                                context, 10.w, 4.w, 5.w, 15.dp, 15.w),
                            fontFamily: Values.fontFamily,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: Screen.responsiveScreen(
                        context, 5.w, 2.dp, 2.dp, 2.dp, 5.w),
                  ),
                  Transform.scale(
                    scale: Screen.responsiveScreen(
                        context, 0.7.w, 1.5.dp, 1.5.dp, 1.5.dp, 1.w),
                    child: Checkbox(
                        shape: CircleBorder(),
                        side: BorderSide(color: Colors.white),
                        value: widget.isChecked,
                        onChanged: (value) {}),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: viewport.getHeightscreen / 10),
              width: viewport.getWidthscreen / 1.5,
              child: ElevatedButton(
                onPressed: () {
                  if (!widget.isChecked) {
                    Get.toNamed("/term");
                  } else {
                    if (values.CHECKNUMBERPHONE(_formState)) {
                      Get.to(Verified(
                          numberPhone:
                              values.code.value + values.numberPhone.value));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            Screen.responsiveScreen(
                                context, 50, 20, 20, 20, 50))),
                    minimumSize: Size.fromHeight(
                        Screen.responsiveScreen(context, 50, 50, 50, 50, 50)),
                    backgroundColor: Colors.white),
                child: Text("التّالي".tr,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: Screen.responsiveScreen(
                            context, 15.w, 10.w, 8.w, 8.w, 20.w),
                        fontFamily: Values.fontFamily,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            InkWell(
                onTap: () {
                  Values.getDialog(context, viewport.getWidthscreen / 1.1);
                },
                child: Values.speakWithSupport(context))
          ],
        ),
      ),
    );
  }
}
