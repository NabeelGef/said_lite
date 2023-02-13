import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:said_lite/constant/viewport.dart';

import '../constant/colors.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    Screen viewport = Screen(context);
    return Scaffold(
      body: Container(
        width: viewport.getWidthscreen,
        height: viewport.getHeightscreen,
        decoration: BoxDecoration(
            color: Colors.blue[200],
            image: const DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: viewport.getHeightscreen / 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      Container(
                        height: viewport.getHeightscreen / 20,
                        margin: const EdgeInsets.only(right: 15),
                        child: const Text("ميني سوبر ماركت",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        height: viewport.getHeightscreen / 30,
                        margin: const EdgeInsets.only(right: 15),
                        child: const Text("...كاشير احمد, مرحبا بك",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        height: 20,
                        margin: const EdgeInsets.only(right: 15),
                        child: Text(
                          formatDate(DateTime.now(), [
                            '  ',
                            HH,
                            ':',
                            nn,
                            am,
                            ',',
                            yyyy,
                            '/',
                            mm,
                            '/',
                            D,
                          ]),
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: viewport.getHeightscreen / 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  height: viewport.getHeightscreen / 10,
                  width: viewport.getWidthscreen / 1.1,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text("إجمالي الإيرادات",
                              style: TextStyle(
                                  color: Coloring.primary,
                                  fontSize: 15,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      VerticalDivider(
                        thickness: 3,
                      ),
                      Expanded(
                        child: Center(
                          child: Text("23,523",
                              style: TextStyle(
                                  color: Coloring.primary,
                                  fontSize: 15,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  height: viewport.getHeightscreen / 10,
                  width: viewport.getWidthscreen / 1.1,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text("إجمالي المصروفات",
                              style: TextStyle(
                                  color: Coloring.primary,
                                  fontSize: 15,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      VerticalDivider(
                        thickness: 3,
                      ),
                      Expanded(
                        child: Center(
                          child: Text("23,523",
                              style: TextStyle(
                                  color: Coloring.primary,
                                  fontSize: 15,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      left: viewport.getWidthscreen / 10,
                      top: viewport.getHeightscreen / 100),
                  child: Row(
                    children: const [
                      Icon(Icons.print),
                      Text("طباعة",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                SizedBox(height: viewport.getHeightscreen / 100),
                Container(
                  margin: EdgeInsets.only(top: viewport.getHeightscreen / 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  height: viewport.getHeightscreen / 10,
                  width: viewport.getWidthscreen / 1.1,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text("إجمالي الضريبة",
                              style: TextStyle(
                                  color: Coloring.primary,
                                  fontSize: 15,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      VerticalDivider(
                        thickness: 3,
                      ),
                      Expanded(
                        child: Center(
                          child: Text("23,523",
                              style: TextStyle(
                                  color: Coloring.primary,
                                  fontSize: 15,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      left: viewport.getWidthscreen / 10,
                      top: viewport.getHeightscreen / 100),
                  child: Row(
                    children: const [
                      Icon(Icons.print),
                      Text("طباعة",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
