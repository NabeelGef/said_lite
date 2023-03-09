import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/scalesize.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/constant/viewport.dart';
import 'package:said_lite/locale/locale_controller.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  LocalController localController = Get.find();
  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    return Scaffold(
      body: Container(
        color: Coloring.primary,
        width: viewport.getWidthscreen,
        height: viewport.getHeightscreen,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: viewport.getWidthscreen / 2,
              child: Image.asset(
                "assets/images/saidlogo.png",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: Screen.responsiveScreen(
                      context, 1.h, 10.dp, 10.dp, 10.dp, 2.h),
                  bottom: Screen.responsiveScreen(
                      context, 1.h, 10.dp, 10.dp, 10.dp, 2.h)),
              width: viewport.getWidthscreen / 2,
              child: Column(
                children: [
                  Text("Said Lite".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: Values.fontFamily,
                          fontSize: Screen.responsiveScreen(
                              context, 20.w, 10.w, 10.w, 20.dp, 25.w))),
                  Text(
                    "المحاسبي".tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: Values.fontFamily,
                        fontSize: Screen.responsiveScreen(
                            context, 15.w, 8.w, 8.w, 20.dp, 20.w)),
                  )
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: viewport.getWidthscreen / 20,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed("/register");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              Screen.responsiveScreen(
                                  context, 50, 20, 20, 20, 50)),
                          color: Colors.white),
                      height: viewport.getHeightscreen / 15,
                      child: Text("تسجيل جديد".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue[300],
                              fontWeight: FontWeight.bold,
                              fontFamily: Values.fontFamily,
                              fontSize: Screen.responsiveScreen(
                                  context, 10.w, 20.dp, 20.dp, 20.dp, 15.w))),
                    ),
                  ),
                ),
                SizedBox(
                  width: viewport.getWidthscreen / 20,
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {
                        Get.toNamed("/login");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Screen.responsiveScreen(
                                    context, 50, 20, 20, 20, 50)),
                            color: Colors.white),
                        height: viewport.getHeightscreen / 15,
                        child: Text("تسجيل الدّخول".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blue[300],
                                fontWeight: FontWeight.bold,
                                fontFamily: Values.fontFamily,
                                fontSize: Screen.responsiveScreen(
                                    context, 10.w, 20.dp, 20.dp, 20.dp, 15.w))),
                      )),
                ),
                SizedBox(
                  width: viewport.getWidthscreen / 20,
                ),
              ],
            ),
            Values.showLanguages(viewport.getWidthscreen / 2,
                viewport.getHeightscreen / 10, context, localController),
            InkWell(
                onTap: () {
                  Values.getDialog(context, viewport.getWidthscreen / 1.1);
                },
                child: Values.speakWithSupport(context))
          ],
        )),
      ),
    );
  }
}
