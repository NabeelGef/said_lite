import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/constant/viewport.dart';

class BuildingInfo extends StatefulWidget {
  const BuildingInfo({super.key});

  @override
  State<BuildingInfo> createState() => _BuildingInfoState();
}

class _BuildingInfoState extends State<BuildingInfo> {
  Values values = Get.find<Values>();
  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    return Scaffold(
      body: Container(
        width: viewport.getWidthscreen,
        height: viewport.getHeightscreen,
        decoration: const BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover)),
        child: Container(
          margin: EdgeInsets.only(top: viewport.getHeightscreen / 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  alignment: Alignment.centerRight,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text("معلومات المنشأة:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(right: 10),
                                child: Text("اسم المنشأة:",
                                    style: TextStyle(
                                        color: Coloring.primary,
                                        fontSize: 15,
                                        fontFamily: Values.fontFamily,
                                        fontWeight: FontWeight.bold)),
                              )),
                          SizedBox(
                            height: viewport.getHeightscreen / 20,
                            width: viewport.getWidthscreen / 1.2,
                            child: Material(
                              color: Colors.transparent,
                              elevation: 20,
                              child: TextFormField(
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.all(10),
                                child: Text("رقم السّجل التّجاريّ:",
                                    style: TextStyle(
                                        color: Coloring.primary,
                                        fontSize: 15,
                                        fontFamily: Values.fontFamily,
                                        fontWeight: FontWeight.bold)),
                              )),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              Expanded(
                                  flex: 2,
                                  child: InkWell(
                                    onTap: () {
                                      Values.getDialogFile(
                                          context,
                                          viewport.getWidthscreen / 1.1,
                                          viewport.getHeightscreen / 3);
                                    },
                                    child: DottedBorder(
                                        borderType: BorderType.RRect,
                                        radius: Radius.circular(20),
                                        color: Colors.green,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Text(
                                                  "إرفاق السّجل التّجاري\n  بامتداد " +
                                                      "PNG أو PDF",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 15,
                                                      fontFamily:
                                                          Values.fontFamily,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Icon(
                                              Icons.attach_file,
                                              color: Colors.green,
                                              size: 25,
                                            ),
                                          ],
                                        )),
                                  )),
                              SizedBox(width: 10),
                              Expanded(
                                  child: Container(
                                height: viewport.getHeightscreen / 20,
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 20,
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Colors.white))),
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.all(10),
                                child: Text("الرقم الضّريبيّ:",
                                    style: TextStyle(
                                        color: Coloring.primary,
                                        fontSize: 15,
                                        fontFamily: Values.fontFamily,
                                        fontWeight: FontWeight.bold)),
                              )),
                          Row(
                            children: [
                              const SizedBox(width: 5),
                              Expanded(
                                  flex: 2,
                                  child: InkWell(
                                    onTap: () {
                                      Values.getDialogFile(
                                          context,
                                          viewport.getWidthscreen / 1.1,
                                          viewport.getHeightscreen / 3);
                                    },
                                    child: DottedBorder(
                                        borderType: BorderType.RRect,
                                        radius: Radius.circular(20),
                                        color: Colors.green,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Text(
                                                  "إرفاق الشّهادة الضريبيّة\n  بامتداد " +
                                                      "PNG أو PDF",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 15,
                                                      fontFamily:
                                                          Values.fontFamily,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Icon(
                                              Icons.attach_file,
                                              color: Colors.green,
                                              size: 25,
                                            ),
                                          ],
                                        )),
                                  )),
                              SizedBox(width: 5),
                              Expanded(
                                  child: SizedBox(
                                height: viewport.getHeightscreen / 20,
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 20,
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Colors.white))),
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.all(10),
                                child: Text("هويّة المالك أو المفوّض:",
                                    style: TextStyle(
                                        color: Coloring.primary,
                                        fontSize: 15,
                                        fontFamily: Values.fontFamily,
                                        fontWeight: FontWeight.bold)),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {
                                    Values.getDialogFile(
                                        context,
                                        viewport.getWidthscreen / 1.1,
                                        viewport.getHeightscreen / 3);
                                  },
                                  child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(20),
                                      color: Colors.green,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(
                                                "إرفاق الهويّة \n  بامتداد " +
                                                    "PNG أو PDF",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 15,
                                                    fontFamily:
                                                        Values.fontFamily,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Icon(
                                            Icons.attach_file,
                                            color: Colors.green,
                                            size: 25,
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  height: viewport.getHeightscreen / 20,
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 20,
                                    child: TextFormField(
                                      style: TextStyle(fontSize: 20),
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.white))),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.all(10),
                                child: Text("البريد الالكترونيّ:",
                                    style: TextStyle(
                                        color: Coloring.primary,
                                        fontSize: 15,
                                        fontFamily: Values.fontFamily,
                                        fontWeight: FontWeight.bold)),
                              )),
                          SizedBox(
                            height: viewport.getHeightscreen / 20,
                            width: viewport.getWidthscreen / 1.2,
                            child: Material(
                              color: Colors.transparent,
                              elevation: 20,
                              child: TextFormField(
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.all(10),
                                child: Text("رقم الجوّال :",
                                    style: TextStyle(
                                        color: Coloring.primary,
                                        fontSize: 15,
                                        fontFamily: Values.fontFamily,
                                        fontWeight: FontWeight.bold)),
                              )),
                          Container(
                            height: viewport.getHeightscreen / 20,
                            width: viewport.getWidthscreen / 1.2,
                            child: Material(
                              color: Colors.transparent,
                              elevation: 20,
                              child: TextFormField(
                                readOnly: true,
                                initialValue: values.code.value +
                                    values.numberPhone.value,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey,
                                    filled: true,
                                    enabled: false,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.all(10),
                                child: Text("المدينة: ",
                                    style: TextStyle(
                                        color: Coloring.primary,
                                        fontSize: 15,
                                        fontFamily: Values.fontFamily,
                                        fontWeight: FontWeight.bold)),
                              )),
                          SizedBox(
                            height: viewport.getHeightscreen / 20,
                            width: viewport.getWidthscreen / 1.2,
                            child: Material(
                              color: Colors.transparent,
                              elevation: 20,
                              child: TextFormField(
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.all(10),
                                child: Text("الحيّ:",
                                    style: TextStyle(
                                        color: Coloring.primary,
                                        fontSize: 15,
                                        fontFamily: Values.fontFamily,
                                        fontWeight: FontWeight.bold)),
                              )),
                          SizedBox(
                            height: viewport.getHeightscreen / 20,
                            width: viewport.getWidthscreen / 1.2,
                            child: Material(
                              color: Colors.transparent,
                              elevation: 20,
                              child: TextFormField(
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed("/bunches");
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              minimumSize: Size.fromHeight(50),
                              backgroundColor: Colors.blue),
                          child: Text("حفظ ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: Values.fontFamily,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: viewport.getHeightscreen / 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
