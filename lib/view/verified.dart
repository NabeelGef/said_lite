import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/viewport.dart';
import 'package:said_lite/view/register.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class Verified extends StatefulWidget {
  String numberPhone;
   Verified({super.key , required this.numberPhone});

  @override
  State<Verified> createState() => _VerifiedState();
}

class _VerifiedState extends State<Verified> {
  CountdownController _countdownController = CountdownController(autoStart: false);
  Color colorCheck = Colors.white;
  bool canClick = true;
  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    return Scaffold(
      backgroundColor: Coloring.primary,
      body: Center(
        child: Container(
          height: viewport.getHeightscreen/1.5,
          child: Column(
            children: [
              Text("كود التّحقق" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontFamily: "Lato",fontSize: 35)),
              Text("تم إرسال رقم التّحقق ",style:TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontFamily: "Lato",fontSize: 25)),
              Text("${widget.numberPhone}   إلى الرقم ",style:TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontFamily: "Lato",fontSize: 15)),         
              Container(
              margin: EdgeInsets.only(top: 20),
              child: OtpTextField(
                numberOfFields: 4,
                enabledBorderColor: Colors.white,
                focusedBorderColor: Colors.white,
                cursorColor: Colors.white,
                borderWidth: 2,
                fieldWidth: 50,
                filled: true, 
                showFieldAsBox: true,
                borderRadius: BorderRadius.circular(15),
                borderColor: Colors.white,
                onCodeChanged: (value) {
                  print(value);
                },
                
              )),Container(
              margin: EdgeInsets.only(top: viewport.getHeightscreen/15),
              width: viewport.getWidthscreen/1.2,
              child: ElevatedButton(
                onPressed: () {
                    Get.toNamed("/buildInfo");
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: Colors.blue
                ),
                child: Text("التّالي ", style: TextStyle(color: Colors.white , fontSize: 20,
                    fontFamily: "Lato" , fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: viewport.getHeightscreen/25),
              width: viewport.getWidthscreen/1.2,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Countdown(
                  controller: _countdownController,
                  onFinished: (){
                    setState(() {
                      _countdownController.restart();
                      _countdownController.pause();
                      canClick = true;
                      colorCheck = Colors.white;
                    });
                  },
                  interval: Duration(milliseconds: 50),
                  seconds: 59, build: (context, double time) {
                  return Text("(00:${time.toInt().toString()})",style: TextStyle(color: Colors.white , fontSize: 15,
                    fontFamily: "Lato" , fontWeight: FontWeight.bold));
                }),
                Container(
                  child: InkWell(
                    onTap: () {
                      if(canClick)
                    {
                      setState(() {
                        _countdownController.start();
                        colorCheck = Colors.grey;
                        canClick = false;
                      });
                    }
                    },
                    child: Text("إرسال رمز التّحقق مرّة أخرى ",style: TextStyle(color: colorCheck , fontSize: 20,
                    fontFamily: "Lato" , decoration: TextDecoration.underline)),
                  ),
                )
              ]),

            ),
            Container(
                  margin: EdgeInsets.only(top: viewport.getHeightscreen/20),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                        return AlertDialog(
                          content: Text("هل تريد تغيير رقم الجوال بالفعل؟",style: TextStyle(color: Colors.blue[700] , fontSize: 20,
                    fontFamily: "Lato",fontWeight: FontWeight.bold)
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    actionsAlignment: MainAxisAlignment.spaceAround,
                    actions: [
                      TextButton(onPressed: (){
                        // no 
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                        shape: MaterialStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(15),
                             
                        ))
                      ),
                       child: Text("لا",style: TextStyle(color: Colors.white , fontSize: 15,
                    fontFamily: "Lato" ,fontWeight: FontWeight.bold))),
                      TextButton(onPressed: (){
                         //yes
                         Get.off(Register(isChecked: true));
                      },
                       style: ButtonStyle(
                        elevation: MaterialStatePropertyAll(5),
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                        shape: MaterialStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(15),
                             
                        ))
                      ),
                       child: Text("نعم",style: TextStyle(color: Colors.blue , fontSize: 15,
                    fontFamily: "Lato" ,fontWeight: FontWeight.bold))),
                    
                    ],
                        );
                        },
                      );
                    },
                    child: Text("تغيير رقم الجوّال ",style: TextStyle(color: Colors.white , fontSize: 20,
                    fontFamily: "Lato" , decoration: TextDecoration.underline)),
                  ),
            )
            ],
          ),
        ),
      ),
    );
  }
}