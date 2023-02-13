import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/constant/viewport.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
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
                LayoutBuilder(
                  builder: (context, constraint) {
                    return Container(
                      margin:
                          EdgeInsets.only(top: viewport.getHeightscreen / 20),
                      child: Column(
                        children: [
                          Text("Said Lite",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Lato",
                                  fontSize: 35)),
                          Text("المحاسبي",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Lato",
                                  fontSize: 35))
                        ],
                      ),
                    );
                  },
                ),
                Center(child: LayoutBuilder(
                  builder: (context, constraint) {
                    return Container(
                        margin:
                            EdgeInsets.only(top: viewport.getHeightscreen / 12),
                        child: Text("صفحة تسجيل الدّخول",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato",
                                fontSize: 25)));
                  },
                )),
                Form(
                    child: Container(
                  width: viewport.getWidthscreen / 1.1,
                  height: viewport.getHeightscreen / 5,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                              hintText: "رقم الجوال",
                              hintStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                        TextFormField(
                          obscureText: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: "كلمةالمرور",
                            hintStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        )
                      ]),
                )),
                Container(
                  width: viewport.getWidthscreen / 1.1,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        Checkbox(
                          onChanged: (value) {
                            setState(() {
                              isRemember = value!;
                            });
                          },
                          value: isRemember,
                          activeColor: Coloring.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Text("تذكرني",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
                Container(
                  width: viewport.getWidthscreen / 1.1,
                  child: ElevatedButton(
                    onPressed: () {
                      //login
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        minimumSize: Size.fromHeight(50),
                        backgroundColor: Colors.blue),
                    child: Text("تسجيل الدّخول ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed("/forget_password");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text("نسيت كلمة المرور",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Lato",
                            fontSize: 15)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed("/register");
                    },
                    child: Text("ليس لديك حساب؟ اضغط هنا للتسجيل",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Lato",
                            fontSize: 15)),
                  ),
                ),
                Values.showLanguages(viewport.getWidthscreen / 2),
                InkWell(
                    onTap: () {
                      Values.getDialog(context, viewport.getWidthscreen / 1.1);
                    },
                    child: Values.speakWithSupport())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
