import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/constant/viewport.dart';

import '../constant/fabbar.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    Screen viewport = Screen(context);
    Values values = Get.find();

    return SafeArea(
      child: Container(
          width: viewport.getWidthscreen,
          height: viewport.getHeightscreen,
          decoration: BoxDecoration(
              color: Colors.blue[200],
              image: const DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
              child: Column(children: [
            Container(
              margin: EdgeInsets.only(left: 30, top: 30),
              alignment: Alignment.centerLeft,
              child: InkWell(
                  onTap: () {
                    values.setNamePage = "Home";
                  },
                  child:
                      const Icon(Icons.close, size: 35, color: Colors.white)),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                child: Text("ميني سوبر ماركت",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: Values.fontFamily,
                        fontWeight: FontWeight.bold))),
            Container(
              alignment: Alignment.center,
              width: viewport.getWidthscreen / 1.2,
              height: viewport.getHeightscreen / 3,
              child: _buildQrView(viewport, context),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 20, top: 20),
              child: Text("بيانات المنتج",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: Values.fontFamily,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              alignment: Alignment.center,
              height: viewport.getHeightscreen / 3,
              width: viewport.getWidthscreen / 1.1,
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      child: Container(
                        width: viewport.getWidthscreen / 1.2,
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(3),
                              isDense: true,
                              hintText: "باركود المنتج",
                              hintTextDirection: TextDirection.rtl,
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(25)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(25)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: viewport.getWidthscreen / 1.2,
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(3),
                              isDense: true,
                              hintText: "اسم المنتج",
                              hintTextDirection: TextDirection.rtl,
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(25)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(25)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: viewport.getWidthscreen,
                        child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(":سعر الشراء",
                                style: TextStyle(
                                    color: Coloring.primary,
                                    fontSize: 20,
                                    fontFamily: Values.fontFamily,
                                    fontWeight: FontWeight.bold)),
                            Container(
                              width: viewport.getWidthscreen / 5,
                              height: viewport.getHeightscreen / 10,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25))),
                              ),
                            ),
                            Text(":سعر البيع",
                                style: TextStyle(
                                    color: Coloring.primary,
                                    fontSize: 20,
                                    fontFamily: Values.fontFamily,
                                    fontWeight: FontWeight.bold)),
                            Container(
                              width: viewport.getWidthscreen / 5,
                              height: viewport.getHeightscreen / 10,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2, color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2, color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 2,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text("تضمين الضريبة",
                                style: TextStyle(
                                    color: Colors.blue[400],
                                    fontSize: 15,
                                    fontFamily: Values.fontFamily,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(left: 15),
                            child: FlutterSwitch(
                              onToggle: (value) {
                                setState(() {
                                  isRemember = value;
                                });
                              },
                              value: isRemember,
                              height: 20,
                              width: 40,
                              toggleSize: 15,
                              borderRadius: 20,
                              inactiveToggleColor: Coloring.primary,
                              activeToggleColor: Coloring.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        width: viewport.getWidthscreen / 2.5,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              backgroundColor: Colors.blue,
                              elevation: 0),
                          onPressed: (() {
                            Values.completeAddProductDialog(
                                context,
                                viewport.getWidthscreen / 1.5,
                                viewport.getHeightscreen / 20);
                          }),
                          child: Text("حفظ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: Values.fontFamily,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]))),
    );
  }

  Widget _buildQrView(Screen viewport, BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea =
        (viewport.getWidthscreen < 400 || viewport.getHeightscreen < 400)
            ? 150.0
            : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
