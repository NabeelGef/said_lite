import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/viewport.dart';

import '../constant/values.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Values values = Get.find<Values>();
    Screen viewport = Screen(context);
    return Scaffold(
      body: Container(
         width: viewport.getWidthscreen,
         height: viewport.getHeightscreen,
         color: Coloring.primary,
         child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                      margin: EdgeInsets.only(top: viewport.getHeightscreen/20),
                      child: Column(
                        children: [
                             Text("Said Lite",
                                  style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontFamily: "Lato",fontSize: 35)
                                  ),
                                  Text("المحاسبي",
                              style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontFamily: "Lato",fontSize: 35)
                              )
                        ],
                      ),
                     ),
                     Center(
                      child: Container(
                      margin: EdgeInsets.only(top: viewport.getHeightscreen/12),
                        child : Text("استعادة كلمة المرور:",style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontFamily: "Lato",fontSize: 25))
                     )
                     ),
                    Obx(
                      () {
                      return values.showCountries(viewport.getWidthscreen/1.4,_formState);  
                      },
                      ),
          Container(
            margin: EdgeInsets.only(top: viewport.getHeightscreen/20),
                width: viewport.getWidthscreen/1.1,
                child: ElevatedButton(
                  onPressed: () {
                   //send a new number phone
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: Colors.blue
                  ),
                  child: Text("إرسال ", style: TextStyle(color: Colors.white , fontSize: 15,
                      fontFamily: "Lato" , fontWeight: FontWeight.bold)),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text("الرجوع إلى صفحة تسجيل الدّخول",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white , fontWeight: FontWeight.bold , fontFamily: "Lato",fontSize: 15)
                          ),
                      ),
              ),
                    Values.showLanguages(viewport.getWidthscreen/2),
            
                  InkWell(
                    onTap: () {
                      Values.getDialog(context,viewport.getWidthscreen/1.1);
                    },
                    child: Values.speakWithSupport()
                  )
         ]),
      ),
    )));
  }
}