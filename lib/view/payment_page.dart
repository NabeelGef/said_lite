import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/viewport.dart';
import 'package:said_lite/view/add_card.dart';
import 'package:said_lite/view/bunches.dart';
import 'package:said_lite/view/complete_pay.dart';

import '../constant/edge.dart';
import '../constant/lable.dart';
import '../constant/values.dart';

class PaymentPage extends StatefulWidget {
  String content;
  int price;
  bool isCommon;
  PaymentPage(
      {super.key,
      required this.content,
      required this.price,
      required this.isCommon});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isAddingCard = false;

  @override
  Widget build(BuildContext context) {
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
                      Get.offNamed("/bunches");
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Coloring.primary,
                    )),
              ),
              Text("صفحة الدّفع",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: Values.fontFamily,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: viewport.getHeightscreen / 20,
              ),
              Container(
                  width: viewport.getWidthscreen,
                  height: viewport.getHeightscreen,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        widget.isCommon
                            ? Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(top: 20),
                                alignment: Alignment.centerLeft,
                                child: Label(
                                  triangleHeight: 15,
                                  edge: Edge.RIGHT,
                                  child: Container(
                                    color: Colors.blue,
                                    width: viewport.getWidthscreen / 3,
                                    child: Text("الباقة الشّائعة",
                                        style: TextStyle(
                                            color: Coloring.primary,
                                            fontSize: 15,
                                            fontFamily: Values.fontFamily,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              )
                            : Container(),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20),
                          child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(widget.content,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 25,
                                      fontFamily: Values.fontFamily,
                                      fontWeight: FontWeight.bold))),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 15),
                          child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text("باقة سائد لايت المحاسبي \n الشهري",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontFamily: Values.fontFamily,
                                      fontWeight: FontWeight.bold))),
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
                                  child: Text(widget.price.toString(),
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 50,
                                          fontFamily: Values.fontFamily,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 35),
                          child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                  "تحدد الباقة تلقائياً عند نهاية الاشتراك",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontFamily: Values.fontFamily,
                                      fontWeight: FontWeight.bold))),
                        ),
                        Container(
                          width: viewport.getWidthscreen / 1.1,
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.bottom,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontSize: 15, color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.blue[100],
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(25)),
                                hintText: "كود الاشتراك",
                                hintStyle:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                                hintTextDirection: TextDirection.rtl,
                                contentPadding: EdgeInsets.all(10),
                                prefixIcon: Container(
                                  alignment: Alignment.center,
                                  width: viewport.getWidthscreen / 5,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right:
                                              BorderSide(color: Colors.grey))),
                                  child: Text("تطبيق",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Coloring.primary,
                                      )),
                                )),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(top: 15, right: 35),
                          child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text("الدفع عبر:",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontFamily: Values.fontFamily,
                                      fontWeight: FontWeight.bold))),
                        ),
                        Container(
                          width: viewport.getWidthscreen / 1.1,
                          child: TextFormField(
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.bottom,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontSize: 15, color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.blue[100],
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(25)),
                                hintText: "اختر طريقة الدفع",
                                hintStyle: TextStyle(
                                  color: Colors.blue,
                                ),
                                hintTextDirection: TextDirection.rtl,
                                contentPadding: EdgeInsets.all(10),
                                prefixIcon: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Coloring.primary,
                                    size: 25,
                                  ),
                                )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: viewport.getWidthscreen / 2,
                          decoration: BoxDecoration(
                              border: Border.all(color: Coloring.primary)
                              // borderRadius: BorderRadius.circular(10),
                              ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, elevation: 0),
                            onPressed: (() {
                              Get.to(AddCard(
                                  content: widget.content,
                                  price: widget.price,
                                  isCommon: widget.isCommon));
                            }),
                            child: Text("إتمام الدفع",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontFamily: Values.fontFamily,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ))
            ]),
          ),
        ));
  }
}
