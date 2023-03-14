import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
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
                    child: Text("معلومات المنشأة:".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Screen.responsiveScreen(
                                context, 15.w, 7.w, 10.w, 5.w, 20.w),
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
                                child: Text("اسم المنشأة:".tr,
                                    style: TextStyle(
                                        color: Coloring.primary,
                                        fontSize: Screen.responsiveScreen(
                                            context, 10.w, 7.w, 7.w, 5.w, 20.w),
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
                                style: TextStyle(
                                    fontSize: Screen.responsiveScreen(
                                        context, 12.w, 7.w, 10.w, 5.w, 20.w)),
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
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.all(10),
                            child: Text("رقم السّجل التّجاريّ:".tr,
                                style: TextStyle(
                                    color: Coloring.primary,
                                    fontSize: Screen.responsiveScreen(
                                        context, 10.w, 7.w, 7.w, 5.w, 20.w),
                                    fontFamily: Values.fontFamily,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: Screen.responsiveScreen(
                                      context, 10.w, 3.w, 10.w, 5.w, 20.w)),
                              Expanded(
                                  child: Container(
                                height: viewport.getHeightscreen / 20,
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 20,
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontSize: Screen.responsiveScreen(
                                        context,
                                        10.w,
                                        7.w,
                                        7.w,
                                        5.w,
                                        20.w,
                                      ),
                                    ),
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
                              SizedBox(
                                  width: Screen.responsiveScreen(
                                      context, 7.w, 3.w, 5.w, 5.w, 20.w)),
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
                                        strokeWidth: 5,
                                        borderType: BorderType.RRect,
                                        radius: Radius.circular(20),
                                        color: Colors.green,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                                "إرفاق السّجل التّجاري\nبامتداد" +
                                                    "PNG أو PDF".tr,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize:
                                                        Screen.responsiveScreen(
                                                            context,
                                                            8.w,
                                                            4.w,
                                                            5.w,
                                                            4.w,
                                                            20.w),
                                                    fontFamily:
                                                        Values.fontFamily,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Icon(
                                              Icons.attach_file,
                                              color: Colors.green,
                                              size: Screen.responsiveScreen(
                                                  context,
                                                  15.w,
                                                  10.w,
                                                  9.w,
                                                  7.w,
                                                  20.w),
                                            ),
                                          ],
                                        )),
                                  )),
                              SizedBox(
                                  width: Screen.responsiveScreen(
                                      context, 7.w, 5.w, 2.w, 2.w, 20.w)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.all(10),
                            child: Text("الرقم الضّريبيّ:".tr,
                                style: TextStyle(
                                    color: Coloring.primary,
                                    fontSize: Screen.responsiveScreen(
                                        context, 10.w, 7.w, 7.w, 5.w, 20.w),
                                    fontFamily: Values.fontFamily,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: Screen.responsiveScreen(
                                      context, 7.w, 3.w, 3.w, 5.w, 20.w)),
                              Expanded(
                                  child: SizedBox(
                                height: viewport.getHeightscreen / 20,
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 20,
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontSize: Screen.responsiveScreen(
                                        context,
                                        10.w,
                                        7.w,
                                        7.w,
                                        5.w,
                                        20.w,
                                      ),
                                    ),
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
                              SizedBox(
                                  width: Screen.responsiveScreen(
                                      context, 10.w, 3.w, 2.w, 5.w, 20.w)),
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
                                        strokeWidth: 5,
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
                                                  "إرفاق الشّهادة الضريبيّة\nبامتداد" +
                                                      "PNG أو PDF".tr,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: Screen
                                                          .responsiveScreen(
                                                              context,
                                                              8.w,
                                                              4.w,
                                                              5.w,
                                                              4.w,
                                                              20.w),
                                                      fontFamily:
                                                          Values.fontFamily,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Icon(
                                              Icons.attach_file,
                                              color: Colors.green,
                                              size: Screen.responsiveScreen(
                                                  context,
                                                  15.w,
                                                  10.w,
                                                  9.w,
                                                  7.w,
                                                  20.w),
                                            ),
                                          ],
                                        )),
                                  )),
                              SizedBox(
                                  width: Screen.responsiveScreen(
                                      context, 10.w, 3.w, 1.w, 2.w, 20.w)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.all(10),
                            child: Text("هويّة المالك أو المفوّض:".tr,
                                style: TextStyle(
                                    color: Coloring.primary,
                                    fontSize: Screen.responsiveScreen(
                                        context, 10.w, 7.w, 7.w, 5.w, 20.w),
                                    fontFamily: Values.fontFamily,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: Screen.responsiveScreen(
                                    context, 10.w, 3.w, 5.w, 5.w, 20.w),
                              ),
                              Expanded(
                                child: Container(
                                  height: viewport.getHeightscreen / 20,
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 20,
                                    child: TextFormField(
                                      style: TextStyle(
                                        fontSize: Screen.responsiveScreen(
                                          context,
                                          10.w,
                                          7.w,
                                          7.w,
                                          7.w,
                                          20.w,
                                        ),
                                      ),
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
                              ),
                              SizedBox(
                                width: Screen.responsiveScreen(
                                    context, 10.w, 3.w, 5.w, 5.w, 20.w),
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
                                      strokeWidth: 5,
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(20),
                                      color: Colors.green,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                              "إرفاق الهويّة \n  بامتداد " +
                                                  "PNG أو PDF".tr,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize:
                                                      Screen.responsiveScreen(
                                                          context,
                                                          8.w,
                                                          4.w,
                                                          5.w,
                                                          4.w,
                                                          20.w),
                                                  fontFamily: Values.fontFamily,
                                                  fontWeight: FontWeight.bold)),
                                          Icon(
                                            Icons.attach_file,
                                            color: Colors.green,
                                            size: Screen.responsiveScreen(
                                                context,
                                                15.w,
                                                10.w,
                                                9.w,
                                                7.w,
                                                20.w),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: Screen.responsiveScreen(
                                    context, 10.w, 5.w, 2.w, 2.w, 20.w),
                              ),
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
                                child: Text("البريد الالكترونيّ:".tr,
                                    style: TextStyle(
                                        color: Coloring.primary,
                                        fontSize: Screen.responsiveScreen(
                                          context,
                                          10.w,
                                          7.w,
                                          7.w,
                                          5.w,
                                          20.w,
                                        ),
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
                                style: TextStyle(
                                  fontSize: Screen.responsiveScreen(
                                    context,
                                    10.w,
                                    7.w,
                                    7.w,
                                    5.w,
                                    20.w,
                                  ),
                                ),
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
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.all(10),
                            child: Text("رقم الجوّال :".tr,
                                style: TextStyle(
                                    color: Coloring.primary,
                                    fontSize: Screen.responsiveScreen(
                                      context,
                                      10.w,
                                      7.w,
                                      7.w,
                                      5.w,
                                      20.w,
                                    ),
                                    fontFamily: Values.fontFamily,
                                    fontWeight: FontWeight.bold)),
                          ),
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
                                style: TextStyle(
                                  fontSize: Screen.responsiveScreen(
                                    context,
                                    10.w,
                                    7.w,
                                    7.w,
                                    5.w,
                                    20.w,
                                  ),
                                ),
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
                                child: Text("المدينة: ".tr,
                                    style: TextStyle(
                                        color: Coloring.primary,
                                        fontSize: Screen.responsiveScreen(
                                          context,
                                          10.w,
                                          7.w,
                                          7.w,
                                          5.w,
                                          20.w,
                                        ),
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
                                style: TextStyle(
                                  fontSize: Screen.responsiveScreen(
                                    context,
                                    10.w,
                                    7.w,
                                    7.w,
                                    5.w,
                                    20.w,
                                  ),
                                ),
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
                                child: Text("الحيّ:".tr,
                                    style: TextStyle(
                                        color: Coloring.primary,
                                        fontSize: Screen.responsiveScreen(
                                          context,
                                          10.w,
                                          7.w,
                                          7.w,
                                          5.w,
                                          20.w,
                                        ),
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
                                style: TextStyle(
                                    fontSize: Screen.responsiveScreen(
                                  context,
                                  10.w,
                                  7.w,
                                  7.w,
                                  5.w,
                                  20.w,
                                )),
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
                          child: Text("حفظ".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Screen.responsiveScreen(
                                    context,
                                    10.w,
                                    7.w,
                                    7.w,
                                    5.w,
                                    20.w,
                                  ),
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
