import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/constant/viewport.dart';
import 'package:said_lite/view/verified.dart';

class Register extends StatefulWidget {
  bool isChecked;
  Register({super.key , required this.isChecked});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  Values values = Get.find();
  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    return Scaffold(
      backgroundColor: Coloring.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: viewport.getWidthscreen,
                height: viewport.getHeightscreen/3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("فضلاً قم بإدخال رقم الجوال ",style: TextStyle(color: Colors.white , fontSize: 25,
                    fontFamily: "Lato" , fontWeight: FontWeight.bold)),
                    Text("استخدم رقم الجوال لإكمال التّسجيل",style: TextStyle(color: Colors.white , fontSize: 15,
                    fontFamily: "Lato" , fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            Obx(
              () {
              return values.showCountries(viewport.getWidthscreen/1.4,_formState);  
              },
            ),
            Container(
              width: viewport.getWidthscreen/1.4,
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      shape: CircleBorder(),
                      side: BorderSide(
                        color: Colors.white),
                      value: widget.isChecked,
      
                     onChanged: (value) {
                      
                    }),
                  ),
                  Text("لقد قرأت",style: TextStyle(color: Colors.white , fontSize: 15,
                    fontFamily: "Lato" , fontWeight: FontWeight.bold)),
                  Text("الشّروط والأحكام",style: TextStyle(color: Colors.white , fontSize: 15,
                    fontFamily: "Lato" ,decoration: TextDecoration.underline, fontWeight: FontWeight.bold)),
                  
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: viewport.getHeightscreen/10),
              width: viewport.getWidthscreen/1.5,
              child: ElevatedButton(
                onPressed: () {
                  if(!widget.isChecked)
                  {
                    Get.toNamed("/term");
                  }else{
                   if(values.CHECKNUMBERPHONE(_formState)){
                    Get.to(Verified(numberPhone:values.code.value+values.numberPhone.value));
                   }
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: Colors.white
                ),
                child: Text("التّالي ", style: TextStyle(color: Colors.blue , fontSize: 15,
                    fontFamily: "Lato" , fontWeight: FontWeight.bold)),
              ),
            ),
            Values.showLanguages(viewport.getWidthscreen/2),
            InkWell(
                    onTap: () {
                      Values.getDialog(context,viewport.getWidthscreen/1.1);
                    },
                    child: Values.speakWithSupport()
                  )
          ],
        ),
      ),
    );
  }
  
   
}