import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';

import '../view/verified.dart';
import 'data_grid.dart';
import 'viewport.dart';

class Values extends GetxController {
  RxString saudi = "assets/images/saudi.png".obs;
  List<String> countries = [
    "assets/images/saudi.png",
    "assets/images/syria.png",
    "assets/images/germany.png",
    "assets/images/usa.png"
  ];
  RxString code = "+966 ".obs;
  RxString numberPhone = "".obs;
  RxString typeBunch = "".obs;
  RxInt price = 0.obs;
  static RxString language = "اللّغة: العربيّة".obs;
  static List<String> langs = [
    "اللّغة: العربيّة",
    "اللّغة: الإنكليزيّة",
    "اللّغة: التركيّة",
    "اللّغة: الألمانيّة"
  ];
  static String getStringterm() {
    String s = "- ";
    for (int i = 0; i < 120; i++) {
      s += ' نص نص ';
    }
    return s;
  }

  static Widget speakWithSupport() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text("التّواصل مع الدعم",
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "Lato",
              fontSize: 15)),
    );
  }

  static Widget showLanguages(double width) {
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
                    borderSide: BorderSide(color: Colors.white, width: 3))),
            value: language.value,
            onChanged: (value) {
              language.value = value!;
            },
            icon: Icon(Icons.expand_more),
            iconSize: 25,
            iconEnabledColor: Colors.white,
            items: langs.map((String value) {
              return DropdownMenuItem<String>(
                  alignment: Alignment.center,
                  value: value,
                  child: Text(value,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lato",
                          fontSize: 15)));
            }).toList()),
      ),
    );
  }

  static void getDialogFile(BuildContext context, double width, double height) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: (() {}),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.white),
                      ),
                      child: Text("فتح الكاميرا",
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold))),
                  Divider(
                    color: Colors.blue,
                    thickness: 2,
                  ),
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.white),
                      ),
                      child: Text("فتح مدير الملفات",
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold))),
                  Divider(
                    color: Colors.blue,
                    thickness: 2,
                  ),
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.white),
                      ),
                      child: Text("فتح ألبوم الصّور",
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold))),
                  Divider(
                    color: Colors.blue,
                    thickness: 2,
                  ),
                  TextButton(
                      onPressed: () {
                        //cancle
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.white),
                      ),
                      child: Text("إالغاء",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold)))
                ],
              ),
            ),
          );
        });
  }

  static void dialogDrawer(bool invoice, BuildContext context, double width) {
    showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          size: 50,
                          color: Coloring.primary,
                        ),
                      )),
                  if (invoice) ...[
                    Container(
                      width: width,
                      child: TextButton(
                        onPressed: (() {
                          Get.toNamed("/list_sales");
                        }),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                        child: const Text("قائمة المبيعات",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      width: width,
                      child: TextButton(
                        onPressed: (() {
                          Get.toNamed("/sales_return");
                        }),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                        child: const Text("مرتجع مبيع",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      width: width,
                      child: TextButton(
                        onPressed: (() {
                          Get.toNamed("/add_product");
                        }),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                        child: const Text("إضافة منتج",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ] else ...[
                    Container(
                      width: width,
                      child: TextButton(
                        onPressed: (() {
                          Get.toNamed("/list_buying");
                        }),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                        child: const Text("قائمة المشتريات",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      width: width,
                      child: TextButton(
                        onPressed: (() {
                          Get.toNamed("/add_product");
                        }),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                        child: const Text("إضافة منتج",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          );
        });
  }

  static void completeAddProductDialog(
      BuildContext context, double width, double height) {
    showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                        color: Coloring.primary,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15))),
                    child: const Text("تمت إضافة بيانات المنتج",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      height: height,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),
                      child: Text("حسناً",
                          style: TextStyle(
                              color: Coloring.primary,
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static void DialogElement(
      BuildContext context,
      int index,
      GlobalKey<FormState> _formeditable,
      List<Map<String, dynamic>> field,
      DataGrid dataGrid,
      Screen viewport) {
    String newname = "";
    String newprice = "";
    showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  content: Container(
                    alignment: Alignment.center,
                    height: viewport.getHeightscreen / 3,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Form(
                      key: _formeditable,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: 20),
                            child: const Text(
                              "تعديل العنصر",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: viewport.getWidthscreen / 2,
                            height: viewport.getHeightscreen / 20,
                            child: TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey,
                                  hintTextDirection: TextDirection.rtl,
                                  hintText: "باركود المنتج",
                                  hintStyle: TextStyle(
                                      color: Colors.blue[300],
                                      fontSize: 15,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            width: viewport.getWidthscreen / 2,
                            height: viewport.getHeightscreen / 20,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "يجب ملئ المنتج";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                newname = newValue!;
                              },
                              textDirection: TextDirection.rtl,
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintTextDirection: TextDirection.rtl,
                                  hintText: "اسم المنتج",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            width: viewport.getWidthscreen / 2,
                            height: viewport.getHeightscreen / 20,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "يجب ملئ المنتج";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                newprice = newValue!;
                              },
                              keyboardType: TextInputType.number,
                              textDirection: TextDirection.rtl,
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintTextDirection: TextDirection.rtl,
                                  hintText: "سعر المنتج",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: viewport.getWidthscreen / 6,
                                  decoration: BoxDecoration(
                                    color: Coloring.primary,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Text("إلغاء",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.bold)),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              InkWell(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: viewport.getWidthscreen / 6,
                                  decoration: BoxDecoration(
                                    color: Coloring.primary,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Text("حفظ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.bold)),
                                ),
                                onTap: () {
                                  if (_formeditable.currentState!.validate()) {
                                    _formeditable.currentState!.save();
                                    field[index]['element'][0]['name'] =
                                        newname;
                                    field[index]['price'][0]['price'] =
                                        newprice;

                                    dataGrid.setList(field);
                                    dataGrid.updateDataGridSource();
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )));
        });
  }

  static void DialogPrice(
    BuildContext context,
    int index,
    GlobalKey<FormState> _formeditable2,
    List<Map<String, dynamic>> field,
    DataGrid dataGrid,
    Screen viewport,
  ) {
    String newprice = "", newtotal = "";
    showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  content: Container(
                    alignment: Alignment.center,
                    height: viewport.getHeightscreen / 3,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Form(
                        key: _formeditable2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(right: 20),
                              child: const Text(
                                "تعديل السعر",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text("الإجمالي",
                                          style: TextStyle(
                                              color: Coloring.primary,
                                              fontSize: 15,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "يجب ملئ الحقل";
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            newtotal = newValue!;
                                          },
                                          decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text("الضريبة",
                                          style: TextStyle(
                                              color: Coloring.primary,
                                              fontSize: 15,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          readOnly: true,
                                          decoration: const InputDecoration(
                                              fillColor: Colors.grey,
                                              filled: true),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text("السعر",
                                          style: TextStyle(
                                              color: Coloring.primary,
                                              fontSize: 15,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "يجب ملئ الحقل";
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            newprice = newValue!;
                                          },
                                          decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: viewport.getWidthscreen / 6,
                                    decoration: BoxDecoration(
                                      color: Coloring.primary,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Text("حفظ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  onTap: () {
                                    if (_formeditable2.currentState!
                                        .validate()) {
                                      _formeditable2.currentState!.save();
                                      field[index]['price'][0]['price'] =
                                          newprice;
                                      field[index]['price'][0]['total'] =
                                          newtotal;

                                      dataGrid.setList(field);
                                      dataGrid.updateDataGridSource();
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                                InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: viewport.getWidthscreen / 6,
                                    decoration: BoxDecoration(
                                      color: Coloring.primary,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Text("إلغاء",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            )
                          ],
                        )),
                  )));
        });
  }

  static void getDialog(BuildContext context, double width) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: width,
                  child: TextButton(
                      onPressed: (() {}),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.white),
                          shape: MaterialStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("00966 55 444 3333",
                              style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: 15,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold)),
                          Text("مكالمة",
                              style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: 15,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.phone,
                            color: Colors.blue[700],
                          )
                        ],
                      )),
                ),
                Container(
                  width: width,
                  child: TextButton(
                      onPressed: () {
                        //cancle
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.white),
                          shape: MaterialStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ))),
                      child: Text("إالغاء",
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold))),
                )
              ],
            ),
          );
        });
  }

  Widget showCountries(double width, GlobalKey<FormState> _formState) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  iconEnabledColor: Colors.black,
                  icon: Icon(Icons.expand_more),
                  value: saudi.value,
                  items: countries.map((String value) {
                    return DropdownMenuItem(
                        value: value,
                        child: Image.asset(
                          value,
                          height: 35,
                        ));
                  }).toList(),
                  onChanged: (value) {
                    EditCountry(value);
                  }),
            ),
          ),
          Expanded(
            flex: 3,
            child: Form(
              key: _formState,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "يجب ملئ الحقل ";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  saveNumber(newValue);
                },
                keyboardType: TextInputType.phone,
                cursorColor: Colors.black,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: " 111 222 333",
                    prefixIcon: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        code.value,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    prefixStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
      ),
    );
  }

  void EditCountry(String? value) {
    saudi.value = value!;
    if (value == countries[0]) {
      code.value = "+966 ";
    } else if (value == countries[1]) {
      code.value = "+963 ";
    } else if (value == countries[2]) {
      code.value = "+49 ";
    } else {
      code.value = "+1 ";
    }
  }

  bool CHECKNUMBERPHONE(GlobalKey<FormState> _formState) {
    if (_formState.currentState!.validate()) {
      _formState.currentState!.save();
      return true;
    }
    return false;
  }

  void saveNumber(String? newValue) {
    numberPhone.value = newValue!;
  }

  static void DialogCompleteMessage(Screen viewport, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              content: Container(
                color: Colors.white,
                height: viewport.getHeightscreen / 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "تم استلام رسالتك\nوسنقوم بالرد عليك في أقرب فرصة",
                      style: TextStyle(
                          color: Coloring.primary,
                          fontSize: 15,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: viewport.getWidthscreen / 1.1,
                          height: viewport.getHeightscreen / 20,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Text("حسنا",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
