import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/edge.dart';
import 'package:said_lite/constant/lable.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/view/payment_page.dart';
import 'package:said_lite/constant/viewport.dart';

class Bunches extends StatefulWidget {
  const Bunches({super.key});

  @override
  State<Bunches> createState() => _BunchesState();
}

class _BunchesState extends State<Bunches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coloring.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              heightFactor: 3,
              child: Text("اختر الباقة المناسبة",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: Values.fontFamily,
                      fontWeight: FontWeight.bold)),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          backgroundColor: Colors.transparent,
                          content: makeBunches("الباقة اليومية", 2, false));
                    });
              },
              child: Center(
                  child: makeBunches(
                "الباقة اليومية",
                2,
                false,
              )),
            ),
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            backgroundColor: Colors.transparent,
                            content: makeBunches("الباقة الشّهريّة", 50, true));
                      });
                },
                child:
                    Center(child: makeBunches("الباقة الشّهريّة", 50, true))),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          backgroundColor: Colors.transparent,
                          content: makeBunches("الباقة السنويّة", 500, false));
                    });
              },
              child: Center(
                  child: makeBunches(
                "الباقة السنويّة",
                500,
                false,
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeBunches(String content, int price, bool isCommon) {
    Screen viewport = Screen(context);
    return Container(
      width: viewport.getWidthscreen / 1.5,
      height: viewport.getHeightscreen / 2.3,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            isCommon
                ? Container(
                    padding: EdgeInsets.only(top: 10),
                    width: double.infinity,
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
              margin: EdgeInsets.only(top: viewport.getWidthscreen / 20),
              child: Text(content,
                  style: TextStyle(
                      color: Coloring.primary,
                      fontSize: 20,
                      fontFamily: Values.fontFamily,
                      fontWeight: FontWeight.bold)),
            ),
            Divider(
                endIndent: 20,
                indent: 20,
                thickness: 3,
                color: Coloring.primary),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ر.س",
                    style: TextStyle(
                        color: Coloring.primary,
                        fontSize: 20,
                        fontFamily: Values.fontFamily,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 10,
                ),
                Text(price.toString(),
                    style: TextStyle(
                        color: Coloring.primary,
                        fontSize: 50,
                        fontFamily: Values.fontFamily,
                        fontWeight: FontWeight.bold))
              ],
            ),
            Text("تجدد الباقة تلقائياً",
                style: TextStyle(
                    color: Coloring.primary,
                    fontSize: 15,
                    fontFamily: Values.fontFamily,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold)),
            Text("عند نهاية الاشتراك ",
                style: TextStyle(
                    color: Coloring.primary,
                    fontSize: 15,
                    fontFamily: Values.fontFamily,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Get.to(PaymentPage(
                      content: content, price: price, isCommon: isCommon));
                },
                child: Text("اشتراك",
                    style: TextStyle(
                        color: Coloring.primary,
                        fontSize: 15,
                        fontFamily: Values.fontFamily,
                        fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}
