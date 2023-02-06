import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
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
                  Container(
                    width: constraint.maxWidth / 2,
                    child: Image.asset("assets/images/saidlogo.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 25),
                    width: constraint.maxWidth / 2,
                    child: Column(
                      children: const [
                        Text("Said Lite",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato",
                                fontSize: 35)),
                        Text("المحاسبي",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato",
                                fontSize: 35))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.values[5],
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Get.toNamed("/register");
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromHeight(25),
                              minimumSize: Size(20, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.white),
                          child: Text("تسجيل جديد",
                              style: TextStyle(
                                  color: Colors.blue[300],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Lato",
                                  fontSize: 15))),
                      ElevatedButton(
                          onPressed: () {
                            Get.toNamed("/login");
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromHeight(25),
                              minimumSize: Size(20, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.white),
                          child: Text("تسجيل الدّخول",
                              style: TextStyle(
                                  color: Colors.blue[300],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Lato",
                                  fontSize: 15)))
                    ],
                  ),
                  Values.showLanguages(viewport.getWidthscreen / 2),
                  InkWell(
                      onTap: () {
                        Values.getDialog(
                            context, viewport.getWidthscreen / 1.1);
                      },
                      child: Values.speakWithSupport())
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
