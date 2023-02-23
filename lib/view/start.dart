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
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/saidlogo.png",
                    width: viewport.getWidthscreen / 2,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.dp, bottom: 10.h),
                    width: constraint.maxWidth / 2,
                    child: Column(
                      children: [
                        Text(
                          "Said Lite",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: Values.fontFamily,
                              fontSize: 20.dp),
                        ),
                        Text(
                          "المحاسبي",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: Values.fontFamily,
                              fontSize: 20.dp),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.values[5],
                    children: [
                      InkWell(
                          onTap: () {
                            Get.toNamed("/register");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            width: viewport.getWidthscreen / 3,
                            height: viewport.getHeightscreen / 20,
                            child: Text("تسجيل جديد",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.blue[300],
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Values.fontFamily,
                                    fontSize: 20.dp)),
                          )),
                      InkWell(
                          onTap: () {
                            Get.toNamed("/login");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            width: viewport.getWidthscreen / 3,
                            height: viewport.getHeightscreen / 20,
                            child: Text("تسجيل الدّخول",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.blue[300],
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Values.fontFamily,
                                    fontSize: 20.dp)),
                          ))
                    ],
                  ),
                  Values.showLanguages(viewport.getWidthscreen / 2,
                      viewport.getHeightscreen / 10, context),
                  InkWell(
                      onTap: () {
                        Values.getDialog(
                            context, viewport.getWidthscreen / 1.1);
                      },
                      child: Values.speakWithSupport(context))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
