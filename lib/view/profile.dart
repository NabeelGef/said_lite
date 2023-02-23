import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/values.dart';

import '../constant/colors.dart';
import '../constant/viewport.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              child: Center(
                  child: Text("صفحة المنشأة",
                      style: TextStyle(
                          color: Coloring.primary,
                          fontSize: 25,
                          fontFamily: Values.fontFamily,
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
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListTile(
                      trailing: InkWell(
                          onTap: () {
                            Get.toNamed("/buildInfo");
                          },
                          child: Icon(Icons.arrow_forward_ios)),
                      leading: Image.asset("assets/images/store.png"),
                      title: Text("معلومات المنشأة",
                          style: TextStyle(
                              color: Coloring.primary,
                              fontSize: 20,
                              fontFamily: Values.fontFamily,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                    color: Colors.blue,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListTile(
                      trailing: InkWell(
                          onTap: () {
                            Get.toNamed("/subscribe_management");
                          },
                          child: Icon(Icons.arrow_forward_ios)),
                      leading: Image.asset("assets/images/subscribe.png"),
                      title: Text("إدارة الاشتراك",
                          style: TextStyle(
                              color: Coloring.primary,
                              fontSize: 20,
                              fontFamily: Values.fontFamily,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                    color: Colors.blue,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListTile(
                      trailing: InkWell(
                          onTap: () {
                            Get.toNamed("/about");
                          },
                          child: Icon(Icons.arrow_forward_ios)),
                      leading: Image.asset("assets/images/info.png"),
                      title: Text("حول البرنامج",
                          style: TextStyle(
                              color: Coloring.primary,
                              fontSize: 20,
                              fontFamily: Values.fontFamily,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: viewport.getHeightscreen / 20,
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
                            fontFamily: Values.fontFamily,
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
