import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/view/register.dart';

import '../constant/viewport.dart';

class Term extends StatefulWidget {
  const Term({super.key});

  @override
  State<Term> createState() => _TermState();
}

class _TermState extends State<Term> {
  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);

    return Container(
        width: viewport.getWidthscreen,
        height: viewport.getHeightscreen,
        color: Coloring.primary,
        child: Center(
          child: Container(
            width: viewport.getWidthscreen / 1.2,
            height: viewport.getHeightscreen / 1.3,
            child: Stack(
              children: [
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Scrollbar(
                    thickness: 10,
                    radius: Radius.circular(25),
                    scrollbarOrientation: ScrollbarOrientation.left,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "الشّروط والأحكام".tr,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                color: Colors.blue[800],
                                fontFamily: Values.fontFamily,
                                fontSize: Screen.responsiveScreen(
                                    context, 15.w, 7.w, 7.w, 7.w, 20.w),
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: viewport.getWidthscreen / 1.1,
                            height: viewport.getHeightscreen / 1.1,
                            child: Text(
                              Values.getStringterm().tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blue[800],
                                  fontFamily: Values.fontFamily,
                                  fontSize: Screen.responsiveScreen(
                                      context, 10.w, 5.w, 7.w, 5.w, 15.w),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2.5,
                  left: 4,
                  width: viewport.getWidthscreen /
                      (Screen.responsiveScreen(
                          context, 1.215, 1.235, 1.225, 1.235, 1.210)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            Screen.responsiveScreen(
                                context, 7.w, 10.w, 7.w, 7.w, 7.w)),
                        color: Colors.white),
                    height: viewport.getHeightscreen / 7,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: viewport.getWidthscreen / 10,
                        ),
                        Expanded(
                          child: MaterialButton(
                            elevation: 15,
                            color: Colors.blue[400],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Screen.responsiveScreen(
                                      context, 20.w, 10.w, 7.w, 10.w, 15.w)),
                            ),
                            onPressed: () {
                              Get.off(Register(
                                isChecked: true,
                              ));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(),
                              margin: EdgeInsets.only(top: 10, bottom: 20),
                              height: viewport.getHeightscreen / 17,
                              width: viewport.getWidthscreen / 2,
                              child: Text("الموافقة".tr,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Screen.responsiveScreen(
                                          context, 12.w, 5.w, 6.w, 4.5.w, 15.w),
                                      fontFamily: Values.fontFamily,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: viewport.getWidthscreen / 10,
                        ),
                        Expanded(
                          child: MaterialButton(
                            elevation: 15,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Screen.responsiveScreen(
                                      context, 10.w, 10.w, 7.w, 10.w, 15.w)),
                            ),
                            onPressed: () {
                              Get.off(Register(isChecked: false));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(),
                              margin: EdgeInsets.only(top: 10, bottom: 20),
                              height: viewport.getHeightscreen / 17,
                              width: viewport.getWidthscreen / 2,
                              child: Text("إلغاء".tr,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: Screen.responsiveScreen(
                                          context, 12.w, 5.w, 6.w, 4.5.w, 15.w),
                                      fontFamily: Values.fontFamily,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: viewport.getWidthscreen / 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
