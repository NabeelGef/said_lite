import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
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
                Container(
                  margin: EdgeInsets.only(top: viewport.getHeightscreen / 20),
                  child: Column(
                    children: [
                      Text("Said Lite".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: Values.fontFamily,
                              fontSize: Screen.responsiveScreen(
                                  context, 15.w, 10.w, 10.w, 30.dp, 25.w))),
                      Text("المحاسبي".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: Values.fontFamily,
                              fontSize: Screen.responsiveScreen(
                                  context, 15.w, 10.w, 10.w, 30.dp, 25.w)))
                    ],
                  ),
                ),
                Center(
                  child: Container(
                      margin:
                          EdgeInsets.only(top: viewport.getHeightscreen / 12),
                      child: Text("صفحة تسجيل الدّخول".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: Values.fontFamily,
                              fontSize: Screen.responsiveScreen(
                                  context, 15.w, 7.w, 10.w, 25.dp, 20.w)))),
                ),
                Form(
                    child: Container(
                  width: viewport.getWidthscreen / 1.1,
                  height: viewport.getHeightscreen / 4,
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
                              hintText: "رقم الجوال".tr,
                              hintStyle: TextStyle(
                                  fontSize: Screen.responsiveScreen(
                                      context, 15.w, 7.w, 8.w, 20.dp, 20.w),
                                  fontWeight: FontWeight.bold),
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
                            hintText: "كلمةالمرور".tr,
                            hintStyle: TextStyle(
                                fontSize: Screen.responsiveScreen(
                                    context, 15.w, 7.w, 8.w, 20.dp, 20.w),
                                fontWeight: FontWeight.bold),
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
                        Transform.scale(
                          scale:
                              Screen.responsiveScreen(context, 3, 3, 2, 1, 3),
                          child: Checkbox(
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
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("تذكرني".tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Screen.responsiveScreen(
                                    context, 10.w, 6.w, 7.w, 15.dp, 15.w)))
                      ],
                    ),
                  ),
                ),
                Container(
                  width: viewport.getWidthscreen / 1.1,
                  child: MaterialButton(
                    onPressed: () {
                      //login
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.blue,
                    child: Text("تسجيل الدّخول".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Screen.responsiveScreen(
                                context, 15.w, 7.w, 8.w, 20.dp, 18.w),
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed("/forget_password");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text("نسيت كلمة المرور".tr,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: Values.fontFamily,
                            fontSize: Screen.responsiveScreen(
                                context, 10.w, 5.w, 7.w, 15.dp, 15.w))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed("/register");
                    },
                    child: Text("ليس لديك حساب؟ اضغط هنا للتسجيل".tr,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: Values.fontFamily,
                            fontSize: Screen.responsiveScreen(
                                context, 10.w, 5.w, 5.w, 15.dp, 15.w))),
                  ),
                ),
                InkWell(
                    onTap: () {
                      Values.getDialog(context, viewport.getWidthscreen / 1.1);
                    },
                    child: Values.speakWithSupport(context))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
