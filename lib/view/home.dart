import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/viewport.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String language = "اللّغة: العربيّة";
  List<String> langs =[
    "اللّغة: العربيّة",
    "اللّغة: الإنكليزيّة",
    "اللّغة: التركيّة",
    "اللّغة: الألمانيّة"
  ];
  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    return Scaffold(
      body: Container(
        color: Coloring.primary,
        width: viewport.getWidthscreen,
        height: viewport.getHeightscreen,
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                   Container(
                  width: constraint.maxWidth/2,
                     child : Image.asset("assets/images/saidlogo.png"),
                  ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 25),
                         width: constraint.maxWidth/2,
                        child: Column(
                          children: const [
                            Text("Said Lite",
                            style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontFamily: "Lato",fontSize: 35)
                            ),
                            Text("المحاسبي",
                        style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontFamily: "Lato",fontSize: 35)
                        )
                    ],
                  ),
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.values[5],
                    children: [
                      ElevatedButton(onPressed: (){
                        Get.toNamed("/register");
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromHeight(25),
                        minimumSize: Size(20, 50),
                        shape: 
                        RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: 
                          Colors.white
                        
                      ),
                       child: Text("تسجيل جديد",
                       style: TextStyle(color: Colors.blue[300] , fontWeight: FontWeight.bold , fontFamily: "Lato",fontSize: 15)
                      )),
                      ElevatedButton(onPressed: (){
                        Get.toNamed("/login"); 
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromHeight(25),
                        minimumSize: Size(20, 50),
                        shape: 
                        RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: 
                          Colors.white
                        
                      ),
                       child: Text("تسجيل الدّخول",
                       style: TextStyle(color: Colors.blue[300] , fontWeight: FontWeight.bold , fontFamily: "Lato",fontSize: 15)
                      ))
                    ],
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
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
                  InkWell(
                    onTap: () {
                      showDialog(context: context,
                       builder: (context) {
                         return AlertDialog(
                         backgroundColor: Colors.transparent,
                         elevation: 0,
                         content: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: viewport.getWidthscreen/1.1,
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
                              width: viewport.getWidthscreen/1.1,
                              
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
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("التّواصل مع الدعم",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white , fontWeight: FontWeight.bold , fontFamily: "Lato",fontSize: 20)
                          ),
                    ),
                  )
              ],
                  
                
              ); 
            },
             
          ),
        ),
      ),
    );
  }
}