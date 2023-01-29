import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/viewport.dart';
import 'package:said_lite/view/verified.dart';

class Register extends StatefulWidget {
  bool isChecked;
  Register({super.key , required this.isChecked});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String saudi = "assets/images/saudi.png";
  String language = "اللّغة: العربيّة";
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  List<String> langs =[
    "اللّغة: العربيّة",
    "اللّغة: الإنكليزيّة",
    "اللّغة: التركيّة",
    "اللّغة: الألمانيّة"
  ];
  List<String> countries = [
    "assets/images/saudi.png",
    "assets/images/syria.png",
    "assets/images/germany.png",
    "assets/images/usa.png"
  ];
  String code = "+966 ";
  String numberPhone = "";
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
            Container(
              width: viewport.getWidthscreen/1.4,
              decoration: BoxDecoration(
                      color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)
                    ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: viewport.getWidthscreen/6,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        iconEnabledColor: Colors.black,
                        
                        icon: Icon(Icons.expand_more),
                        value: saudi,
                         items: countries.map(
                          (String value) {
                               return DropdownMenuItem(
                                value: value ,
                                child: Image.asset(value , height: 35,));
                          } ).toList(),
                         onChanged:(value) {
                           setState(() {
                           saudi = value!;
                           if(value==countries[0])
                            {
                              code = "+966 ";
                            }else if (value==countries[1]){
                              code = "+963 ";
                            }else if (value==countries[2]){
                              code = "+49 ";
                            }else {
                              code = "+1 ";
                            }
                           });
                         }),
                    ),
                  ),
                  
                  Container(
                    width: viewport.getWidthscreen/2,
                    child: Form(
                      key: _formState,
                      child: TextFormField(
                        validator: (value) {
                          if(value!.isEmpty){
                            return "يجب ملئ الحقل ";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          numberPhone = newValue!;
                        },
                        keyboardType: TextInputType.phone, 
                        cursorColor: Colors.black,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                        border: InputBorder.none,
                          hintText: " 111 222 333",
                          prefixIcon: LayoutBuilder(
                            builder: (context, constraint) {
                              return  Container(
                              width: constraint.maxWidth/4,
                              alignment: Alignment.centerLeft,
                              child: Text(code ,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                            ); 
                            },
                            
                          ),
                          prefixStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
                    CHECKNUMBERPHONE();
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
            Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        margin: EdgeInsets.only(top: viewport.getHeightscreen/7),
                        width: viewport.getWidthscreen/2,
                        child: DropdownButtonFormField<String?>(
                          dropdownColor: Colors.blue,
                          isDense: true,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white , width: 3)
                            ) 
                          ),
                          value: language,
                          onChanged: (value) {
                            setState(() {
                              language = value!;
                            });
                          },
                          icon: Icon(Icons.expand_more),
                          iconSize: 25,
                          iconEnabledColor: Colors.white,
                          items: langs.map(
                            (String value) {
                              return DropdownMenuItem<String>(
                                alignment: Alignment.center,
                                value: value,
                                child:Text(value,style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontFamily: "Lato",fontSize: 15)
                        )
                                );
                            }).toList()
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("التّواصل مع الدعم",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white , fontWeight: FontWeight.bold , fontFamily: "Lato",fontSize: 20)
                          ),
                    )
          ],
        ),
      ),
    );
  }
  
   void CHECKNUMBERPHONE() {
     if(_formState.currentState!.validate()){
         _formState.currentState!.save();
       Get.to(Verified(numberPhone: code+numberPhone));
     }
  }
}