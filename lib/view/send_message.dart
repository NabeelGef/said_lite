import 'package:flutter/material.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/constant/viewport.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({super.key});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: viewport.getWidthscreen,
              height: viewport.getHeightscreen / 3,
              decoration: BoxDecoration(
                  color: Coloring.primary,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                        top: viewport.getHeightscreen / 20,
                        left: viewport.getWidthscreen / 10),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          size: 35,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin:
                        EdgeInsets.only(right: viewport.getWidthscreen / 10),
                    child: Image.asset("assets/images/hello.PNG"),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin:
                        EdgeInsets.only(right: viewport.getWidthscreen / 10),
                    child: Text("...مرحباً",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin:
                        EdgeInsets.only(right: viewport.getWidthscreen / 10),
                    child: Text("كيف يمكننا مساعدتك؟",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Container(
              height: viewport.getHeightscreen / 1.8,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                          top: viewport.getHeightscreen / 20,
                          right: viewport.getWidthscreen / 10),
                      child: Text("الاسم",
                          style: TextStyle(
                              color: Coloring.primary,
                              fontSize: 20,
                              fontFamily: Values.fontFamily,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: viewport.getWidthscreen / 1.2,
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[400],
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                          top: viewport.getHeightscreen / 20,
                          right: viewport.getWidthscreen / 10),
                      child: Text("البريد الالكتروني",
                          style: TextStyle(
                              color: Coloring.primary,
                              fontSize: 20,
                              fontFamily: Values.fontFamily,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: viewport.getWidthscreen / 1.2,
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[400],
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                          top: viewport.getHeightscreen / 20,
                          right: viewport.getWidthscreen / 10),
                      child: Text("الرسالة",
                          style: TextStyle(
                              color: Coloring.primary,
                              fontSize: 20,
                              fontFamily: Values.fontFamily,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: viewport.getWidthscreen / 1.2,
                      child: TextFormField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[400],
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Values.DialogCompleteMessage(viewport, context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          width: viewport.getWidthscreen / 1.1,
                          height: viewport.getHeightscreen / 15,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text("إرسال",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: Values.fontFamily,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
