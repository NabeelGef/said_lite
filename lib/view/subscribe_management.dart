import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/constant/viewport.dart';

class SubscribeManagement extends StatefulWidget {
  const SubscribeManagement({super.key});

  @override
  State<SubscribeManagement> createState() => _SubscribeManagementState();
}

class _SubscribeManagementState extends State<SubscribeManagement> {
  @override
  Widget build(BuildContext context) {
    Values values = Get.find();
    Screen viewport = Screen(context);
    return Scaffold(
        backgroundColor: Coloring.primary,
        body: Center(
            child: SingleChildScrollView(
                child: Column(children: [
          Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.centerRight,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Coloring.primary,
                )),
          ),
          Text("صفحة \n إدارة الاشتراك",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: Values.fontFamily,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 100,
          ),
          Container(
              width: viewport.getWidthscreen,
              height: viewport.getHeightscreen,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.white),
              child: SingleChildScrollView(
                  child: Column(children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(top: 30, right: 30),
                  child: Text("الاشتراك الحالي",
                      style: TextStyle(
                          color: Coloring.primary,
                          fontSize: 25,
                          fontFamily: Values.fontFamily,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(top: 30, right: 30),
                  child: Text("${values.typeBunch.value}",
                      style: TextStyle(
                          color: Coloring.primary,
                          fontSize: 25,
                          fontFamily: Values.fontFamily,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(top: 30, right: 30),
                  child: Text(
                      "باقة سائد لايت المحاسبي \n " +
                          "${values.typeBunch.value == "الباقة اليومية" ? "اليومي" : values.typeBunch.value == "الباقة الشّهريّة" ? "الشّهريّ" : "السّنويّ"}",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          color: Coloring.primary,
                          fontSize: 20,
                          fontFamily: Values.fontFamily,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text("ر.س",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontFamily: Values.fontFamily,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(width: 10),
                      Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(values.price.value.toString(),
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 50,
                                  fontFamily: Values.fontFamily,
                                  fontWeight: FontWeight.bold)))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: viewport.getWidthscreen / 3,
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Coloring.primary)
                      // borderRadius: BorderRadius.circular(10),
                      ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, elevation: 0),
                    onPressed: (() {}),
                    child: Text(
                      "تغيير الاشتراك",
                      style: TextStyle(
                          color: Coloring.primary,
                          fontSize: 15,
                          fontFamily: Values.fontFamily,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ])))
        ]))));
  }
}
