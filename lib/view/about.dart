import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:said_lite/constant/viewport.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  top: viewport.getHeightscreen / 10,
                  left: viewport.getWidthscreen / 10),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: viewport.getHeightscreen / 5),
              alignment: Alignment.center,
              child: const Text(
                  "تم إصدار هذا البرنامج\nمن فريق سائد لتقنية المعلومات",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
