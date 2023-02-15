import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/constant/viewport.dart';
import 'package:said_lite/view/payment_page.dart';

import '../constant/colors.dart';
import 'complete_pay.dart';

class AddCard extends StatefulWidget {
  String content;
  int price;
  bool isCommon;
  AddCard(
      {super.key,
      required this.content,
      required this.price,
      required this.isCommon});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  bool isRemember = false;
  Values values = Get.find();
  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    return Scaffold(
      backgroundColor: Coloring.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              const Text("صفحة الدّفع",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 100,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 30, left: 30),
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close,
                                    color: Coloring.primary, size: 30),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(top: 30, right: 30),
                              child: const Text("إضافة بطاقة",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 25,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 30),
                          child: const Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text("تقبل",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Image.asset("assets/images/mda.png"),
                              Image.asset("assets/images/visa.png"),
                              Image.asset("assets/images/mastercard.png")
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 30, top: 15),
                          child: const Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text("رقم البطاقة: ",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontFamily: "Lato",
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
                              hintText: "أدخل رقم البطاقة ",
                              hintStyle:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                              hintTextDirection: TextDirection.rtl,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          textDirection: TextDirection.rtl,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: const Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text("تاريخ انتهاء الصلاحية:",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 15,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.bold))),
                                ),
                                Container(
                                  width: viewport.getWidthscreen / 3,
                                  child: TextFormField(
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.blue[100],
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      hintText: "MM/YY",
                                      hintStyle: TextStyle(
                                        color: Colors.blue,
                                      ),
                                      hintTextDirection: TextDirection.rtl,
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(
                                    top: 15,
                                  ),
                                  child: const Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text("CVV",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 15,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.bold))),
                                ),
                                Container(
                                  width: viewport.getWidthscreen / 3,
                                  child: TextFormField(
                                    textAlignVertical: TextAlignVertical.bottom,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.blue[100],
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      hintText: "رمز الامان",
                                      hintStyle: TextStyle(
                                        color: Colors.blue,
                                      ),
                                      hintTextDirection: TextDirection.rtl,
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textDirection: TextDirection.rtl,
                          children: [
                            Expanded(
                              child: Text("تذكّر هذه البطافة",
                                  style: TextStyle(
                                      color: Coloring.primary,
                                      fontSize: 15,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold)),
                            ),
                            Spacer(),
                            Expanded(
                              child: FlutterSwitch(
                                onToggle: (value) {
                                  setState(() {
                                    isRemember = value;
                                  });
                                },
                                value: isRemember,
                                height: 20,
                                width: 40,
                                toggleSize: 15,
                                borderRadius: 20,
                                inactiveToggleColor: Coloring.primary,
                                activeToggleColor: Coloring.primary,
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: viewport.getWidthscreen / 3.5,
                          decoration: BoxDecoration(
                              border: Border.all(color: Coloring.primary)
                              // borderRadius: BorderRadius.circular(10),
                              ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, elevation: 0),
                            onPressed: (() {
                              values.typeBunch.value = widget.content;
                              values.price.value = widget.price;
                              Get.to(CompletePayment(
                                  typeBunch: widget.content == "الباقة اليومية"
                                      ? "اليومي"
                                      : widget.content == "الباقة الشّهريّة"
                                          ? "الشّهريّ"
                                          : "السنوي",
                                  price: widget.price));
                              ;
                            }),
                            child: const Text(
                              "إضافة البطاقة",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
