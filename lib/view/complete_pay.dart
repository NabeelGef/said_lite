import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/viewport.dart';

class CompletePayment extends StatefulWidget {
  String typeBunch;
  int price;
  CompletePayment({super.key, required this.typeBunch, required this.price});

  @override
  State<CompletePayment> createState() => _CompletePaymentState();
}

class _CompletePaymentState extends State<CompletePayment> {
  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    return Scaffold(
      backgroundColor: Coloring.primary,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(50),
            alignment: Alignment.centerLeft,
            child: Icon(Icons.close, size: 35, color: Colors.white),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text("صفحة الدّفع",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Image.asset("assets/images/successpayment.png"),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10),
            child: const Text("شكراً لك",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text("تمت عملية الدفع بنجاح",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            height: viewport.getHeightscreen / 2.4,
            child: Card(
              margin: EdgeInsets.only(top: 20, right: 20, left: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: Colors.blue)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                    child: Text("تفاصيل الطلب",
                        style: TextStyle(
                            color: Coloring.primary,
                            fontSize: 15,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                      width: viewport.getWidthscreen / 1.2,
                      child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: Colors.blue)),
                          trailing: Container(
                            margin: EdgeInsets.all(5),
                            width: viewport.getWidthscreen / 7,
                            decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          title: Text("باقة سائد لايت " + widget.typeBunch,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: Coloring.primary,
                                  fontSize: 15,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold)),
                          subtitle: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text("${widget.price}",
                                  style: TextStyle(
                                      color: Coloring.primary,
                                      fontSize: 15,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold)),
                              Text("ر.س",
                                  style: TextStyle(
                                      color: Coloring.primary,
                                      fontSize: 15,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold))
                            ],
                          ))),
                  Text(
                    "تجدد الباقة بتاريخ " +
                        formatDate(
                            widget.typeBunch == "اليومي"
                                ? DateTime.now().add(Duration(days: 1))
                                : widget.typeBunch == "الشّهريّ"
                                    ? DateTime.now().add(Duration(days: 30))
                                    : DateTime.now().add(Duration(days: 365)),
                            [
                              yyyy,
                              '/',
                              mm,
                              '/',
                              dd,
                              '  ',
                              am,
                              '    ',
                              HH,
                              ':',
                              nn,
                            ]),
                    style: TextStyle(
                        color: Coloring.primary,
                        fontSize: 15,
                        fontFamily: "Lato",
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 25),
                    child: Text(
                      "إجمالي الدّفع :",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          color: Coloring.primary,
                          fontSize: 15,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 25),
                        child: Text(
                          "استخدام كود الخصم :",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Coloring.primary,
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "0     ر.س",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Coloring.primary,
                            fontSize: 15,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 25),
                        child: Text(
                          "المجموع النهائي :",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Coloring.primary,
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "${widget.price}     ر.س",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Coloring.primary,
                            fontSize: 15,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Coloring.primary),
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {},
                      child: Text(
                        "الانتقال إلى الصفحة الرئيسية",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Coloring.primary,
                            fontSize: 15,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
