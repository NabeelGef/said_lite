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

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
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
                  top: Screen.getDeviceType(context) == 'tablet' ? 1.h : 10.dp,
                  bottom:
                      Screen.getDeviceType(context) == 'tablet' ? 1.h : 10.dp),
              width: viewport.getWidthscreen / 2,
              child: Column(
                children: [
                  Text(
                    "Said Lite",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: Values.fontFamily,
                        fontSize: Screen.getDeviceType(context) == 'tablet'
                            ? 20.w
                            : 20.dp),
                  ),
                  Text(
                    "المحاسبي",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: Values.fontFamily,
                        fontSize: Screen.getDeviceType(context) == 'tablet'
                            ? 15.w
                            : 20.dp),
                  )
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: viewport.getWidthscreen / 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed("/register");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      height: viewport.getHeightscreen / 15,
                      child: Text("تسجيل جديد",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue[300],
                              fontWeight: FontWeight.bold,
                              fontFamily: Values.fontFamily,
                              fontSize:
                                  Screen.getDeviceType(context) == 'tablet'
                                      ? 10.w
                                      : 20.dp)),
                    ),
                  ),
                ),
                SizedBox(
                  width: viewport.getWidthscreen / 10,
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {
                        Get.toNamed("/login");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        height: viewport.getHeightscreen / 15,
                        child: Text("تسجيل الدّخول",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blue[300],
                                fontWeight: FontWeight.bold,
                                fontFamily: Values.fontFamily,
                                fontSize:
                                    Screen.getDeviceType(context) == 'tablet'
                                        ? 10.w
                                        : 20.dp)),
                      )),
                ),
                SizedBox(
                  width: viewport.getWidthscreen / 10,
                ),
              ],
            ),
            Values.showLanguages(viewport.getWidthscreen / 2,
                viewport.getHeightscreen / 10, context),
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
