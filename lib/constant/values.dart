
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/verified.dart';

class Values extends GetxController{
   RxString saudi = "assets/images/saudi.png".obs;
   List<String> countries = [
    "assets/images/saudi.png",
    "assets/images/syria.png",
    "assets/images/germany.png",
    "assets/images/usa.png"
  ];
   RxString code = "+966 ".obs;
   RxString numberPhone = "".obs;
  
  static RxString language = "اللّغة: العربيّة".obs;
  static List<String> langs =[
    "اللّغة: العربيّة",
    "اللّغة: الإنكليزيّة",
    "اللّغة: التركيّة",
    "اللّغة: الألمانيّة"
  ];
  static String getStringterm(){
     String s = "- ";
     for(int i = 0 ;i < 120 ; i++){
      s+=' نص نص ';
     }
     return s;
  }
  static Widget speakWithSupport(){
    return Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("التّواصل مع الدعم",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white , fontWeight: FontWeight.bold , fontFamily: "Lato",fontSize: 15)
                          ),
                    );
  }

  static Widget showLanguages(double width){
      
      return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: width,
                      child: DropdownButtonFormField<String?>(
                        dropdownColor: Colors.blue,
                        isDense: true,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white , width: 3)
                          ) 
                        ),
                        value: language.value,
                        onChanged: (value) {
                          language.value = value!;
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
                  );
  }
  static void getDialog(BuildContext context , double width){
     showDialog(context: context,
                       builder: (context) {
                         return AlertDialog(
                         backgroundColor: Colors.transparent,
                         elevation: 0,
                         content: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: width,
                              child: TextButton(onPressed: (() {
                                
                              }),
                              style: ButtonStyle(
                                
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                        shape: MaterialStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(15),
                               
                        ))
                      ),
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children: [
                                  Text("00966 55 444 3333",style: TextStyle(color: Colors.blue[700] , fontSize: 15,
                                  fontFamily: "Lato" ,fontWeight: FontWeight.bold)),
                                    Text("مكالمة",style: TextStyle(color: Colors.blue[700] , fontSize: 15,
                                  fontFamily: "Lato" ,fontWeight: FontWeight.bold)),
                                  Icon(Icons.phone,color: Colors.blue[700],)
                                ],
                               )
                               ),
                            ),
                             Container(
                              width: width,
                              
                               child: TextButton(onPressed: (){
                                 //cancle
                                 Navigator.pop(context);
                               },
                               style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                        shape: MaterialStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(15),
                               
                        ))
                      ),
                                child: Text("إالغاء",style: TextStyle(color: Colors.blue[700] , fontSize: 15,
                                  fontFamily: "Lato" ,fontWeight: FontWeight.bold))),
                             )
                          ],
                         ),
                         );
                       });
                    }
   Widget showCountries(double width , GlobalKey<FormState> _formState){
          return Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)
                    ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        iconEnabledColor: Colors.black,
                        
                        icon: Icon(Icons.expand_more),
                        value: saudi.value,
                         items: countries.map(
                          (String value) {
                               return DropdownMenuItem(
                                value: value ,
                                child: Image.asset(value , height: 35,));
                          } ).toList(),
                         onChanged:(value) {
                           saudi.value = value!;
                           if(value==countries[0])
                            {
                              code.value = "+966 ";
                            }else if (value==countries[1]){
                              code.value = "+963 ";
                            }else if (value==countries[2]){
                              code.value = "+49 ";
                            }else {
                              code.value = "+1 ";
                            }
                         }),
                    ),
                  ),
                  Expanded(
                    flex: 3,
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
                          numberPhone.value = newValue!;
                        },
                        keyboardType: TextInputType.phone, 
                        cursorColor: Colors.black,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                        border: InputBorder.none,
                          hintText: " 111 222 333",
                          prefixIcon: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(code.value ,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                            ),
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
            );
    }
    bool CHECKNUMBERPHONE(GlobalKey<FormState>_formState) {
     if(_formState.currentState!.validate()){
         _formState.currentState!.save();
         return true;
       }
     return false;
  }
  }