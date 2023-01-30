import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/view/register.dart';

import '../constant/viewport.dart';

class Term extends StatefulWidget {
  const Term({super.key});

  @override
  State<Term> createState() => _TermState();
}

class _TermState extends State<Term> {
  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    
    return Container(
      width: viewport.getWidthscreen,
      height: viewport.getHeightscreen,
      color: Coloring.primary,
      child: Center(
        child: Container(
          width: viewport.getWidthscreen/1.2,
          height: viewport.getHeightscreen/1.3,
          child: Stack(
            children: [
              Card(
                 color: Colors.white,
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                 ),
                 child: Scrollbar(
                  thickness: 10,
                  radius: Radius.circular(25),
                  scrollbarOrientation: ScrollbarOrientation.left,
                   child: SingleChildScrollView(
                     child: Column(
                      children: [
                        LayoutBuilder(
                          builder: (context,constraint) {
                            return Container(
                              width: constraint.maxWidth/1.4,
                              height: constraint.maxWidth/4,
                              alignment: Alignment.centerRight,
                              child: Directionality(
                                textDirection: TextDirection.rtl, 
                                child: Text("الشّروط والأحكام", style: TextStyle(color: Colors.blue[800],
                                fontFamily: "Lato",fontSize: 20,fontWeight: FontWeight.bold),)),
                            );
                          }
                        ),
                        LayoutBuilder(
                          builder: (context,constraint) {
                            return Container(
                              width: constraint.maxWidth/1.1,
                              alignment: Alignment.centerRight,
                              child: Directionality(
                                textDirection: TextDirection.rtl, 
                                child: Text(Values.getStringterm(), style: TextStyle(color: Colors.blue[800],
                                fontFamily: "Lato",fontSize: 15,fontWeight: FontWeight.bold),)),
                            );
                          }
                        )
                      ],
                     ),
                   ),
                 ),
              ),
              LayoutBuilder(
                builder: (context,constraint) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    color: Colors.white
                    ),
                    margin: EdgeInsets.only(top: constraint.maxHeight/1.2,left: constraint.maxWidth/70 ),
                    width: constraint.maxWidth/1.13,
                    height: constraint.maxHeight/4,
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         LayoutBuilder(
                           builder: (context , constraint) {
                             return Container(
                               margin: EdgeInsets.only(bottom: 20),
                               height: constraint.maxHeight/1.9,
                               width: 120,
                               child: ElevatedButton(
                                  onPressed: () {
                                    Get.off(Register(isChecked: false));
                                       },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                backgroundColor: Colors.white,
                elevation: 5
              ),
              child: const Text("إلغاء  ", style: TextStyle(color: Colors.blue , fontSize: 15,
                  fontFamily: "Lato" , fontWeight: FontWeight.bold))),
                             );
                           }
                         ),
                         LayoutBuilder(
                           builder: (context,constraint) {
                             return Container(
                              margin: EdgeInsets.only(bottom: 20),
                              width: 120,
                              height: constraint.maxHeight/2,
                               child: ElevatedButton(
                                
                                  onPressed: () {
                                    Get.off(Register(isChecked: true));
                                       },
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                backgroundColor: Colors.blue
              ),

              
              child: Text("الموافقة  ", 
              style: TextStyle(
                color: Colors.white , 
                fontSize: 15,
                fontFamily: "Lato" , 
                fontWeight: FontWeight.bold))),
                             );
                           }
                         ),
                      ],
                    ),
                  );
                }
              )
            ],
          ),
        ),
      )
    );
  }
  
}