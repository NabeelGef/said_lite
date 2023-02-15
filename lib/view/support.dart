import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';

import '../constant/viewport.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);

    return Scaffold(
      backgroundColor: Coloring.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: viewport.getWidthscreen,
              height: viewport.getHeightscreen / 8,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Center(
                  child: Text("الدعم الفنّي",
                      style: TextStyle(
                          color: Coloring.primary,
                          fontSize: 25,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.bold))),
            ),
            SizedBox(
              height: viewport.getHeightscreen / 7,
            ),
            Container(
              width: viewport.getWidthscreen,
              height: viewport.getHeightscreen / 1.1,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: viewport.getHeightscreen / 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/chat");
                    },
                    child: Container(
                      width: viewport.getWidthscreen / 1.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2, color: Coloring.primary),
                          borderRadius: BorderRadius.circular(15)),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListTile(
                          leading: Image.asset("assets/images/chat.png"),
                          title: Text("المحادثة المباشرة",
                              style: TextStyle(
                                  color: Coloring.primary,
                                  fontSize: 20,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: viewport.getHeightscreen / 50,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/send_message");
                    },
                    child: Container(
                      width: viewport.getWidthscreen / 1.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2, color: Coloring.primary),
                          borderRadius: BorderRadius.circular(15)),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListTile(
                          leading: Image.asset("assets/images/message.png"),
                          title: Text("اترك رسالتك",
                              style: TextStyle(
                                  color: Coloring.primary,
                                  fontSize: 20,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: viewport.getHeightscreen / 50,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/common_question");
                    },
                    child: Container(
                      width: viewport.getWidthscreen / 1.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2, color: Coloring.primary),
                          borderRadius: BorderRadius.circular(15)),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListTile(
                          leading: Image.asset("assets/images/question.png"),
                          title: Text("الأسئلة الشائعة",
                              style: TextStyle(
                                  color: Coloring.primary,
                                  fontSize: 20,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: viewport.getHeightscreen / 50,
                  ),
                  Container(
                    width: viewport.getWidthscreen / 1.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2, color: Coloring.primary),
                        borderRadius: BorderRadius.circular(15)),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        leading: Image.asset("assets/images/whatsapp.png"),
                        title: Text("تواصل معنا واتساب",
                            style: TextStyle(
                                color: Coloring.primary,
                                fontSize: 20,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(
                        right: viewport.getWidthscreen / 5,
                        top: viewport.getHeightscreen / 30),
                    child: Text(":تابعنا على قنوات التواصل التالية",
                        style: TextStyle(
                            color: Coloring.primary,
                            fontSize: 15,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/instgram.png"),
                        Image.asset("assets/images/twitter.png"),
                        Image.asset("assets/images/instgram.png"),
                        Image.asset("assets/images/linkedin.png")
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
