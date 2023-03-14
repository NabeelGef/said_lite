import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/viewport.dart';
import 'package:said_lite/view/register.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../constant/values.dart';

class Verified extends StatefulWidget {
  String numberPhone;
  Verified({super.key, required this.numberPhone});

  @override
  State<Verified> createState() => _VerifiedState();
}

class _VerifiedState extends State<Verified> {
  CountdownController _countdownController =
      CountdownController(autoStart: false);
  Color colorCheck = Colors.white;
  bool canClick = true;
  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    return Scaffold(
      backgroundColor: Coloring.primary,
      body: Center(
        child: Container(
          height: viewport.getHeightscreen / 1.1,
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text("كود التّحقق".tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: Values.fontFamily,
                      fontSize: Screen.responsiveScreen(
                          context, 15.w, 10.w, 10.w, 5.w, 20.w))),
              Text("تم إرسال رقم التّحقق".tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: Values.fontFamily,
                      fontSize: Screen.responsiveScreen(
                          context, 10.w, 8.w, 8.w, 5.w, 15.w))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("إلى الرقم".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: Values.fontFamily,
                          fontSize: Screen.responsiveScreen(
                              context, 10.w, 5.w, 5.w, 5.w, 10.w))),
                  Text("${widget.numberPhone}".tr,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: Values.fontFamily,
                          fontSize: Screen.responsiveScreen(
                              context, 10.w, 5.w, 5.w, 5.w, 10.w)))
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: OtpTextField(
                    numberOfFields: 4,
                    enabledBorderColor: Colors.white,
                    focusedBorderColor: Colors.white,
                    cursorColor: Colors.white,
                    borderWidth: 2,
                    textStyle: TextStyle(
                        fontSize: Screen.responsiveScreen(
                            context, 10.w, 10.w, 8.w, 8.w, 20.w)),
                    fieldWidth: Screen.responsiveScreen(
                        context, 30.w, 20.w, 20.w, 15.w, 40.w),
                    filled: true,
                    showFieldAsBox: true,
                    borderRadius: BorderRadius.circular(25),
                    borderColor: Colors.white,
                    onCodeChanged: (value) {
                      print(value);
                    },
                  )),
              Container(
                margin: EdgeInsets.only(top: viewport.getHeightscreen / 15),
                width: viewport.getWidthscreen / 1.2,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/buildInfo");
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minimumSize: Size.fromHeight(50),
                      backgroundColor: Colors.blue),
                  child: Text("التّالي".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Screen.responsiveScreen(
                              context, 15.w, 10.w, 10.w, 5.w, 15.w),
                          fontFamily: Values.fontFamily,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: viewport.getHeightscreen / 25),
                width: viewport.getWidthscreen / 1.1,
                alignment: Alignment.center,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Countdown(
                          controller: _countdownController,
                          onFinished: () {
                            setState(() {
                              _countdownController.restart();
                              _countdownController.pause();
                              canClick = true;
                              colorCheck = Colors.white;
                            });
                          },
                          interval: Duration(milliseconds: 50),
                          seconds: 59,
                          build: (context, double time) {
                            return Text("(00:${time.toInt().toString()})",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Screen.responsiveScreen(
                                        context, 10.w, 5.w, 6.w, 5.w, 12.w),
                                    fontFamily: Values.fontFamily,
                                    fontWeight: FontWeight.bold));
                          }),
                      Container(
                        child: InkWell(
                          onTap: () {
                            if (canClick) {
                              setState(() {
                                _countdownController.start();
                                colorCheck = Colors.grey;
                                canClick = false;
                              });
                            }
                          },
                          child: Text("إرسال رمز التّحقق مرّة أخرى".tr,
                              style: TextStyle(
                                  color: colorCheck,
                                  fontSize: Screen.responsiveScreen(
                                      context, 10.w, 5.w, 6.w, 5.w, 12.w),
                                  fontFamily: Values.fontFamily,
                                  decoration: TextDecoration.underline)),
                        ),
                      )
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(top: viewport.getHeightscreen / 10),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("هل تريد تغيير رقم الجوال بالفعل؟".tr,
                              style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: Screen.responsiveScreen(
                                      context, 15.w, 5.w, 10.w, 5.w, 15.w),
                                  fontFamily: Values.fontFamily,
                                  fontWeight: FontWeight.bold)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          actionsAlignment: MainAxisAlignment.spaceAround,
                          actions: [
                            MaterialButton(
                                onPressed: () {
                                  // no
                                  Navigator.pop(context);
                                },
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text("لا".tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Screen.responsiveScreen(
                                            context,
                                            10.w,
                                            6.w,
                                            10.w,
                                            5.w,
                                            12.w),
                                        fontFamily: Values.fontFamily,
                                        fontWeight: FontWeight.bold))),
                            MaterialButton(
                                onPressed: () {
                                  // no
                                  Navigator.pop(context);
                                },
                                color: Colors.white,
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text("نعم".tr,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: Screen.responsiveScreen(
                                            context,
                                            10.w,
                                            6.w,
                                            10.w,
                                            5.w,
                                            12.w),
                                        fontFamily: Values.fontFamily,
                                        fontWeight: FontWeight.bold))),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("تغيير رقم الجوّال".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Screen.responsiveScreen(
                              context, 15.w, 10.w, 10.w, 5.w, 15.w),
                          fontFamily: Values.fontFamily,
                          decoration: TextDecoration.underline)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
