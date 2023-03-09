import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/scalesize.dart';
import 'package:said_lite/controller/invoice_controller.dart';
import 'package:said_lite/locale/locale_controller.dart';
import 'package:said_lite/view/list_buying_invoice.dart';
import 'package:said_lite/view/list_sales_invoice.dart';
import 'package:said_lite/view/sales_return.dart';

import '../model/invoice.dart';
import '../model/invoice_item.dart';
import '../model/item.dart';
import '../view/add_product.dart';
import '../view/home.dart';
import '../view/profile.dart';
import '../view/statistics.dart';
import '../view/support.dart';
import '../view/verified.dart';
import 'data_grid.dart';
import 'viewport.dart';

class Values extends GetxController {
  RxString saudi = "assets/images/saudi.png".obs;
  static String fontFamily = "Arabic";
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
  static Invoice invoice = Invoice(
      date: DateTime.now(),
      total: 500.0,
      vat: 100.0,
      net: 200.0,
      invoiceItems: [
        InvoiceItem(
            item: Item(
                name: "ميراندا",
                purchasePrice: 200,
                salePrice: 500,
                vatRate: 0.15),
            total: 1150,
            quantity: 2,
            vat: 150),
        InvoiceItem(
            item: Item(
                name: "طحين",
                purchasePrice: 200,
                salePrice: 1500,
                vatRate: 0.15),
            total: 1725,
            quantity: 1,
            vat: 225),
        InvoiceItem(
            item: Item(
                name: "لبن",
                purchasePrice: 200,
                salePrice: 1000,
                vatRate: 0.15),
            total: 3450,
            quantity: 3,
            vat: 450)
      ]);

  static RxString language = "العربيّة".obs;
  static List<String> langs = [
    "العربيّة",
    "English",
  ];
  static String getStringterm() {
    String s = " ";
    for (int i = 0; i < 120; i++) {
      s += ' نص نص ';
    }
    return s;
  }

  static String getStringtermEnglish() {
    String s = " ";
    for (int i = 0; i < 120; i++) {
      s += 'word word';
    }
    return s;
  }

  static Widget speakWithSupport(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.dp),
      child: Text("التّواصل مع الدعم".tr,
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: Values.fontFamily,
              fontSize: Screen.responsiveScreen(
                  context, 10.w, 20.dp, 20.dp, 20.dp, 15.w))),
    );
  }

  static Widget showLanguages(double width, double Height, BuildContext context,
      LocalController locale) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.only(top: width / 10),
        width: width,
        height: Height,
        child: DropdownButtonFormField<String?>(
            isExpanded: true,
            dropdownColor: Colors.blue,
            isDense: true,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 3,
                    ))),
            value: language.value,
            onChanged: (value) {
              language.value = value!;
              if (value == "العربيّة") {
                locale.changeLanguage("ar");
              } else {
                locale.changeLanguage("en");
              }
            },
            icon: Icon(Icons.expand_more),
            iconSize: Screen.responsiveScreen(
                context, 20.w, 30.dp, 30.dp, 30.dp, 25.w),
            iconEnabledColor: Colors.white,
            items: langs.map((String value) {
              return DropdownMenuItem<String>(
                  alignment: Alignment.center,
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: Values.fontFamily,
                        fontSize: Screen.responsiveScreen(
                            context, 10.w, 20.dp, 20.dp, 20.dp, 15.w)),
                  ));
            }).toList()),
      ),
    );
  }

  String namePage = "Home";
  get getNamePage => this.namePage;

  set setNamePage(namePage) {
    this.namePage = namePage;
    update();
  }

  static RxBool invoiceselected = true.obs;

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

  void dialogDrawer(
    BuildContext context,
    double width,
  ) {
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
                  if (invoiceselected.value) ...[
                    Container(
                      width: width,
                      child: TextButton(
                        onPressed: (() {
                          setNamePage = "Home";
                          Navigator.pop(context);
                        }),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                        child: Text("الصفحة الرئيسية",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      width: width,
                      child: TextButton(
                        onPressed: (() {
                          setNamePage = "list_sales";
                          Navigator.pop(context);
                        }),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                        child: Text("قائمة المبيعات",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      width: width,
                      child: TextButton(
                        onPressed: (() {
                          setNamePage = "sales_return";
                          Navigator.pop(context);
                        }),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                        child: Text("مرتجع مبيع",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      width: width,
                      child: TextButton(
                        onPressed: (() {
                          setNamePage = "add_product";
                          Navigator.pop(context);
                        }),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                        child: Text("إضافة منتج",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ] else ...[
                    Container(
                      width: width,
                      child: TextButton(
                        onPressed: (() {
                          setNamePage = "Home";
                          Navigator.pop(context);
                        }),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                        child: Text("الصفحة الرئيسية",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      width: width,
                      child: TextButton(
                        onPressed: (() {
                          setNamePage = "list_buying";
                          Navigator.pop(context);
                        }),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                        child: Text("قائمة المشتريات",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      width: width,
                      child: TextButton(
                        onPressed: (() {
                          setNamePage = "add_product";
                          Navigator.pop(context);
                        }),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                        child: Text("إضافة منتج",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: fontFamily,
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

  List<Widget> getPages() {
    return [
      Profile(),
      Support(),
      Statistics(),
      getNamePage == "Home"
          ? Home()
          : getNamePage == "list_sales"
              ? SalesInvoice()
              : getNamePage == "add_product"
                  ? AddProduct()
                  : getNamePage == "list_buying"
                      ? BuyingInvoice()
                      : getNamePage == "sales_return"
                          ? SalesReturn()
                          : Container(child: Text("error"))
    ];
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
                    child: Text("تمت إضافة بيانات المنتج",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: fontFamily,
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
                              fontFamily: fontFamily,
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
      Invoice invoice,
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
                            child: Text(
                              "تعديل العنصر",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: fontFamily,
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
                                      fontFamily: fontFamily,
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
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintTextDirection: TextDirection.rtl,
                                  hintText: "اسم المنتج",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontFamily: fontFamily,
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
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintTextDirection: TextDirection.rtl,
                                  hintText: "سعر المنتج",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontFamily: fontFamily,
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
                                  child: Text("إلغاء",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: fontFamily,
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
                                  child: Text("حفظ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: fontFamily,
                                          fontWeight: FontWeight.bold)),
                                ),
                                onTap: () {
                                  if (_formeditable.currentState!.validate()) {
                                    _formeditable.currentState!.save();
                                    invoice.getInvoiceItems[index].getItem
                                        .setName = newname;
                                    invoice.getInvoiceItems[index].getItem
                                        .setSalePrice = double.parse(newprice);

                                    dataGrid.setList(invoice);
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
      Invoice invoice,
      DataGrid dataGrid,
      Screen viewport,
      double oldPrice,
      double oldtotal) {
    String newprice = "", newtotal = "";
    double quantities = invoice.getInvoiceItems[index].getQuantity.toDouble();
    TextEditingController _controlPrice =
        TextEditingController(text: oldPrice.toString());
    TextEditingController _controlwithoutTax =
        TextEditingController(text: (oldPrice * quantities).toString());
    TextEditingController _controlTax = TextEditingController(
      text: (double.parse(_controlwithoutTax.text) * 0.15).toString(),
    );
    TextEditingController _controltotal =
        TextEditingController(text: oldtotal.toString());
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
                    height: viewport.getHeightscreen / 2,
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
                              child: Text(
                                "تعديل السعر",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: fontFamily,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(" الإجمالي قبل الضريبة",
                                style: TextStyle(
                                    color: Coloring.primary,
                                    fontSize: 15,
                                    fontFamily: fontFamily,
                                    fontWeight: FontWeight.bold)),
                            Container(
                              width: viewport.getWidthscreen / 3,
                              child: TextFormField(
                                controller: _controlwithoutTax,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: fontFamily,
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                    fillColor: Colors.grey, filled: true),
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
                                              fontFamily: fontFamily,
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                        child: TextFormField(
                                          controller: _controltotal,
                                          onChanged: (value) {
                                            _controlPrice.text = value.isEmpty
                                                ? 0.0.toStringAsFixed(1)
                                                : (double.parse(value) /
                                                        (quantities * 1.15))
                                                    .toStringAsFixed(1);
                                            _controlwithoutTax.text =
                                                (quantities *
                                                        double.parse(
                                                            _controlPrice.text))
                                                    .toString();
                                            _controlTax.text = (0.15 *
                                                    double.parse(
                                                        _controlwithoutTax
                                                            .text))
                                                .toStringAsFixed(1);
                                          },
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              color: Coloring.primary,
                                              fontSize: 20,
                                              fontFamily: fontFamily,
                                              fontWeight: FontWeight.bold),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "يجب ملئ الحقل";
                                            }
                                            return null;
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
                                              fontFamily: fontFamily,
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                        child: TextFormField(
                                          controller: _controlTax,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: fontFamily,
                                              fontWeight: FontWeight.bold),
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
                                              fontFamily: fontFamily,
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                        child: TextFormField(
                                          controller: _controlPrice,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              color: Coloring.primary,
                                              fontSize: 20,
                                              fontFamily: fontFamily,
                                              fontWeight: FontWeight.bold),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "يجب ملئ الحقل";
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            _controlwithoutTax.text =
                                                value.isEmpty
                                                    ? 0.0.toString()
                                                    : (quantities *
                                                            double.parse(value))
                                                        .toStringAsFixed(1);
                                            _controlTax.text = (0.15 *
                                                    double.parse(
                                                        _controlwithoutTax
                                                            .text))
                                                .toStringAsFixed(1);
                                            _controltotal.text = (double.parse(
                                                        _controlTax.text) +
                                                    double.parse(
                                                        _controlwithoutTax
                                                            .text))
                                                .toStringAsFixed(1);
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
                            Text(" الكمية",
                                style: TextStyle(
                                    color: Coloring.primary,
                                    fontSize: 15,
                                    fontFamily: fontFamily,
                                    fontWeight: FontWeight.bold)),
                            Container(
                              width: viewport.getWidthscreen / 4,
                              height: viewport.getHeightscreen / 10,
                              color: Colors.grey,
                              child: CupertinoPicker(
                                  useMagnifier: true,
                                  scrollController: FixedExtentScrollController(
                                      initialItem: quantities.toInt() - 1),
                                  itemExtent: 35,
                                  onSelectedItemChanged: (value) {
                                    quantities = value.toDouble() + 1;
                                    _controlwithoutTax.text =
                                        (double.parse(_controlPrice.text) *
                                                quantities)
                                            .toStringAsFixed(1);
                                    _controlTax.text =
                                        (double.parse(_controlwithoutTax.text) *
                                                0.15)
                                            .toStringAsFixed(1);
                                    _controltotal.text =
                                        (double.parse(_controlwithoutTax.text) +
                                                double.parse(_controlTax.text))
                                            .toStringAsFixed(1);
                                  },
                                  children: [
                                    for (int i = 1; i < 1000; i++) ...[
                                      Text(i.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: Values.fontFamily,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      //Divider(thickness: 5),
                                    ]
                                  ]),
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
                                    child: Text("حفظ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: fontFamily,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  onTap: () {
                                    if (_formeditable2.currentState!
                                        .validate()) {
                                      _formeditable2.currentState!.save();
                                      invoice.getInvoiceItems[index].getItem
                                              .setSalePrice =
                                          double.parse(_controlPrice.text);
                                      invoice.getInvoiceItems[index].setTotal =
                                          double.parse(_controltotal.text);
                                      invoice.getInvoiceItems[index].setVat =
                                          double.parse(_controlTax.text);
                                      invoice.getInvoiceItems[index]
                                          .setQuantity = quantities.toInt();
                                      // YAMEN
                                      dataGrid.setList(invoice);
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
                                    child: Text("إلغاء",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: fontFamily,
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
                            borderRadius: BorderRadius.circular(
                                Screen.responsiveScreen(
                                    context, 50, 20, 20, 20, 50)),
                          ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("00966 55 444 3333",
                              style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: Screen.responsiveScreen(
                                      context, 10.w, 18.dp, 20.dp, 18.dp, 15.w),
                                  fontFamily: fontFamily,
                                  fontWeight: FontWeight.bold)),
                          Icon(
                            size: Screen.responsiveScreen(
                                context, 20.w, 25.dp, 30.dp, 25.dp, 25.w),
                            Icons.phone,
                            color: Colors.blue[700],
                          )
                        ],
                      )),
                ),
                SizedBox(
                    height: Screen.responsiveScreen(
                        context, 10.w, 5.w, 5.w, 5.w, 15.w)),
                Container(
                  width: width,
                  child: TextButton(
                      onPressed: (() {}),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.white),
                          shape: MaterialStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                Screen.responsiveScreen(
                                    context, 50, 20, 20, 20, 50)),
                          ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("00966 55 444 3333",
                              style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: Screen.responsiveScreen(
                                      context, 10.w, 18.dp, 20.dp, 18.dp, 15.w),
                                  fontFamily: fontFamily,
                                  fontWeight: FontWeight.bold)),
                          Image.asset(
                            "assets/images/whatsapp.png",
                            width: Screen.responsiveScreen(
                                context, 15.w, 25.dp, 30.dp, 20.dp, 20.w),
                            height: Screen.responsiveScreen(
                                context, 15.w, 25.dp, 30.dp, 20.dp, 20.w),
                            fit: BoxFit.fill,
                          )
                        ],
                      )),
                ),
                SizedBox(
                    height: Screen.responsiveScreen(
                        context, 10.w, 5.w, 5.w, 5.w, 15.w)),
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
                            borderRadius: BorderRadius.circular(
                                Screen.responsiveScreen(
                                    context, 50, 20, 20, 20, 50)),
                          ))),
                      child: Text("إلغاء".tr,
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: Screen.responsiveScreen(
                                  context, 10.w, 15.dp, 20.dp, 15.dp, 15.w),
                              fontFamily: fontFamily,
                              fontWeight: FontWeight.bold))),
                )
              ],
            ),
          );
        });
  }

// DropdownButtonHideUnderline(
  //   child: DropdownButton<String>(
  //       iconEnabledColor: Colors.black,
  //       value: saudi.value,
  //       items: countries.map((String value) {
  //         return DropdownMenuItem(
  //             value: value,
  //             child: Image.asset(
  //               value,
  //               height: 35,
  //             ));
  //       }).toList(),
  //       onChanged: (value) {
  //         EditCountry(value);
  //       }),
  // ),
  Widget showCountries(BuildContext context, double width,
      GlobalKey<FormState> _formState, String? numberPhone) {
    return Container(
      width: width,
      height: width / 5,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(
              Screen.responsiveScreen(context, 50, 20, 20, 20, 50))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Image.asset(
            "assets/images/saudi.png",
            fit: BoxFit.fill,
            width: Screen.responsiveScreen(
                context, 15.w, 25.dp, 25.dp, 25.dp, 20.w),
            height: Screen.responsiveScreen(
                context, 25.w, 50.dp, 50.dp, 50.dp, 50.w),
          )),
          Expanded(
            flex: 3,
            child: Form(
              key: _formState,
              child: TextFormField(
                initialValue: numberPhone,
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
                style: TextStyle(
                    fontSize: Screen.responsiveScreen(
                        context, 12.w, 25.dp, 25.dp, 20.dp, 15.w)),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: " 111 222 333",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,
                        fontSize: Screen.responsiveScreen(
                            context, 10.w, 6.w, 6.w, 20.dp, 15.w)),
                    prefixIcon: Container(
                      margin: EdgeInsets.only(
                          top: Screen.responsiveScreen(
                              context, 1.dp, 4.dp, 3.dp, 3.dp, 2.dp),
                          left: Screen.responsiveScreen(
                              context, 2.dp, 4.dp, 1.dp, 1.dp, 3.dp)),
                      child: Container(
                        margin: EdgeInsets.only(
                            top: Screen.responsiveScreen(
                                context, 0, 5.dp, 5.dp, 5.dp, 0)),
                        child: Text(
                          code.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: Screen.responsiveScreen(
                                  context, 10.w, 20.dp, 25.dp, 20.dp, 15.w),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    prefixStyle: TextStyle(
                        fontSize: Screen.responsiveScreen(
                            context, 10.w, 6.w, 5.w, 20.dp, 15),
                        fontWeight: FontWeight.bold)),
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

  static Widget DialogEdit(
      BuildContext context,
      Screen viewport,
      int rowIndex,
      GlobalKey<FormState> _formeditable,
      GlobalKey<FormState> _formeditable2,
      Invoice invoice,
      DataGrid dataGrid) {
    return Container(
        color: Colors.blue,
        child: IconButton(
          color: Colors.blue,
          onPressed: () {
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
                            width: viewport.getWidthscreen / 1.1,
                            height: viewport.getHeightscreen / 10,
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(":التعديل على",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: Values.fontFamily,
                                        fontWeight: FontWeight.bold)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: viewport.getWidthscreen / 6,
                                        decoration: BoxDecoration(
                                          color: Coloring.primary,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Text("العنصر",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontFamily: Values.fontFamily,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);

                                        Values.DialogElement(
                                            context,
                                            rowIndex,
                                            _formeditable,
                                            invoice,
                                            dataGrid,
                                            viewport);
                                      },
                                    ),
                                    InkWell(
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: viewport.getWidthscreen / 6,
                                        decoration: BoxDecoration(
                                          color: Coloring.primary,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Text("السعر",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontFamily: Values.fontFamily,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Values.DialogPrice(
                                            context,
                                            rowIndex,
                                            _formeditable2,
                                            invoice,
                                            dataGrid,
                                            viewport,
                                            invoice.getInvoiceItems[rowIndex]
                                                .getItem.getSalePrice,
                                            invoice.getInvoiceItems[rowIndex]
                                                .getTotal);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: viewport.getWidthscreen / 1.1,
                              height: viewport.getHeightscreen / 20,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15))),
                              child: Text("إلغاء",
                                  style: TextStyle(
                                      color: Coloring.primary,
                                      fontSize: 15,
                                      fontFamily: Values.fontFamily,
                                      fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          icon: Image.asset("assets/images/edit.png"),
        ));
  }

  static Widget DialogDelete(
      BuildContext context,
      Screen viewport,
      int rowIndex,
      GlobalKey<FormState> formeditable,
      GlobalKey<FormState> formeditable2,
      DataGrid dataGrid) {
    return Container(
      color: Colors.red,
      child: IconButton(
        color: Coloring.primary,
        icon: Image.asset("assets/images/delete.png"),
        onPressed: () {
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
                      width: viewport.getWidthscreen / 1.1,
                      height: viewport.getHeightscreen / 5,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("هل تريد حذف العنصر من الفاتورة",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: Values.fontFamily,
                                  fontWeight: FontWeight.bold)),
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
                                  child: Text("لا",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: Values.fontFamily,
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
                                  child: Text("نعم",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: Values.fontFamily,
                                          fontWeight: FontWeight.bold)),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  //invoice.getInvoiceItems.removeAt(rowIndex);
                                  //dataGrid.setList(invoice);
                                  //dataGrid.updateDataGridSource();
                                  dataGrid.deleteRow(rowIndex);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
          // dataGridRow.getCells().map((datacell) {
          //   if (datacell.columnName == 'element') {
          //     print("element===>${datacell.value[0]}");
          //   } else if (datacell.columnName ==
          //       'quantities') {
          //     print(
          //         "First quantities ===>${datacell.value[0]}");
          //   } else {
          //     print("Price===>${datacell.value[0]}");
          //   }
          // });
        },
      ),
    );
  }
}
