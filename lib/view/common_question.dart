import 'package:flutter/material.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/viewport.dart';

class CommonQuestion extends StatefulWidget {
  const CommonQuestion({super.key});

  @override
  State<CommonQuestion> createState() => _CommonQuestionState();
}

class _CommonQuestionState extends State<CommonQuestion> {
  bool question1 = false,
      question2 = false,
      question3 = false,
      question4 = false;
  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    return Scaffold(
        body: Container(
            width: viewport.getWidthscreen,
            height: viewport.getHeightscreen,
            decoration: BoxDecoration(
                color: Coloring.primary,
                image: const DecorationImage(
                    image: AssetImage("assets/images/background2.png"),
                    fit: BoxFit.fitWidth)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: viewport.getHeightscreen / 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close,
                                size: 35, color: Colors.white)),
                        Text(":الاسئلة الشائعة",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ExpansionTile(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        trailing: SizedBox(),
                        onExpansionChanged: (value) {
                          setState(() {
                            question1 = value;
                          });
                        },
                        leading: !question1
                            ? const Icon(
                                Icons.add,
                                size: 25,
                                color: Colors.white,
                              )
                            : const Icon(Icons.remove,
                                size: 25, color: Colors.white),
                        title: const Text("ماهو تطبيق said lite؟",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold)),
                        children: const [
                          Text("برنامج محاسبي  مبسط لإدارة الحسابات",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  SizedBox(
                    height: viewport.getHeightscreen / 20,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ExpansionTile(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        trailing: SizedBox(),
                        onExpansionChanged: (value) {
                          setState(() {
                            question2 = value;
                          });
                        },
                        leading: !question2
                            ? const Icon(
                                Icons.add,
                                size: 25,
                                color: Colors.white,
                              )
                            : const Icon(Icons.remove,
                                size: 25, color: Colors.white),
                        title: const Text("ماهي خدمات هذا التطبيق؟",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold)),
                        children: const [
                          Text("برنامج محاسبي  مبسط لإدارة الحسابات",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  SizedBox(
                    height: viewport.getHeightscreen / 20,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ExpansionTile(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        trailing: SizedBox(),
                        onExpansionChanged: (value) {
                          setState(() {
                            question3 = value;
                          });
                        },
                        leading: !question3
                            ? const Icon(
                                Icons.add,
                                size: 25,
                                color: Colors.white,
                              )
                            : const Icon(Icons.remove,
                                size: 25, color: Colors.white),
                        title: const Text("هل بياناتي آمنة؟",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold)),
                        children: const [
                          Text("برنامج محاسبي  مبسط لإدارة الحسابات",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  SizedBox(
                    height: viewport.getHeightscreen / 20,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ExpansionTile(
                        onExpansionChanged: (value) {
                          setState(() {
                            question4 = value;
                          });
                        },
                        backgroundColor: Colors.white.withOpacity(0.5),
                        trailing: SizedBox(),
                        leading: !question4
                            ? const Icon(
                                Icons.add,
                                size: 25,
                                color: Colors.white,
                              )
                            : const Icon(Icons.remove,
                                size: 25, color: Colors.white),
                        title: const Text("هل يمكنني استرداد المبلغ المدفوع؟",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold)),
                        children: const [
                          Text("برنامج محاسبي  مبسط لإدارة الحسابات",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  SizedBox(height: viewport.getHeightscreen / 10),
                  Container(
                    alignment: Alignment.centerRight,
                    margin:
                        EdgeInsets.only(right: viewport.getWidthscreen / 10),
                    child: const Text(":البيانات الإلزامية من العميل",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Image.asset("assets/images/point.png"),
                            const Text("الاسم",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Image.asset("assets/images/point.png"),
                            const Text("الايميل",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Image.asset("assets/images/point.png"),
                            const Text("رقم الجوال",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Image.asset("assets/images/point.png"),
                            const Text("المدينة",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Image.asset("assets/images/point.png"),
                            const Text("النشاط",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
