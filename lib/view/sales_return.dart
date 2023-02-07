import 'dart:developer';

import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../constant/colors.dart';
import '../constant/fabbar.dart';
import '../constant/values.dart';
import '../constant/viewport.dart';

class SalesReturn extends StatefulWidget {
  const SalesReturn({super.key});

  @override
  State<SalesReturn> createState() => _SalesReturnState();
}

class _SalesReturnState extends State<SalesReturn>
    with TickerProviderStateMixin {
  Barcode? result;
  bool invoiceselected = true;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  TabController? tabController, tabControllerinvoice;
  int selectedpage = 3;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    // if (Platform.isAndroid) {
    //   controller!.pauseCamera();
    // }
    controller!.pauseCamera();
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabControllerinvoice = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    List<Map<String, dynamic>> field = [
      {
        'element': [
          {'name': 'ميراندا', 'type': 'حبّة', 'number': '5'}
        ],
        'price': [
          {'price': '3.74', 'Tax': '1.26', 'total': '5'}
        ]
      },
      {
        'element': [
          {'name': 'ميراندا', 'type': 'حبّة', 'number': '5'}
        ],
        'price': [
          {'price': '3.74', 'Tax': '1.26', 'total': '5'}
        ]
      },
      {
        'element': [
          {'name': 'مشروب', 'type': 'حبّة', 'number': '2.50'}
        ],
        'price': [
          {'price': '3.74', 'Tax': '1.26', 'total': '5'}
        ]
      },
      {
        'element': [
          {'name': 'طحين', 'type': 'كيلو', 'number': '5'}
        ],
        'price': [
          {'price': '3.74', 'Tax': '1.26', 'total': '5'}
        ]
      }
    ];
    List<Widget> pages = [
      Container(child: Text("Store")),
      Container(child: Text("support")),
      Container(child: Text("chart")),
      SingleChildScrollView(
          child: Column(children: [
        Container(
          margin: const EdgeInsets.all(15),
          width: viewport.getWidthscreen / 1.1,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 3),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TabBar(
              unselectedLabelColor: Colors.grey[800],
              indicator: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(15)),
              controller: tabController,
              onTap: (value) {
                setState(() {
                  if (value == 0) {
                    invoiceselected = true;
                  } else {
                    invoiceselected = false;
                  }
                });
              },
              tabs: [
                Tab(
                  child: Text("فاتورة مبيعات",
                      style: TextStyle(
                          color: Coloring.primary,
                          fontSize: 15,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.bold)),
                ),
                Tab(
                  child: Text("فاتورة مشتريات",
                      style: TextStyle(
                          color: Coloring.primary,
                          fontSize: 15,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.bold)),
                ),
              ]),
        ),
        Container(
            width: viewport.getWidthscreen / 1.2,
            height: viewport.getHeightscreen / 3,
            child: _buildQrView(viewport, context)),
        FittedBox(
          fit: BoxFit.contain,
          child: Column(
            children: [
              if (result != null)
                Text(
                    'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
              else
                const Text("...عملية المسح جارية",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.bold)),
              SizedBox(
                width: viewport.getWidthscreen / 1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () async {
                        await controller?.pauseCamera();
                      },
                      child: const Text("إيقاف",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold)),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await controller?.resumeCamera();
                      },
                      child: const Text('بدء المسح',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Container(
                width: viewport.getWidthscreen / 1.1,
                height: viewport.getHeightscreen / 15,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                child: const Text("فاتورة مبيعات رقم #45453",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                height: viewport.getHeightscreen / 5,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Scrollbar(
                    thickness: 10,
                    radius: Radius.circular(25),
                    scrollbarOrientation: ScrollbarOrientation.left,
                    child: SingleChildScrollView(
                      child: DataTable(
                        dataRowHeight: viewport.getHeightscreen / 10,
                        columnSpacing: viewport.getWidthscreen / 5,
                        border: TableBorder.all(
                            borderRadius: BorderRadius.circular(15),
                            width: 3,
                            color: Colors.grey),
                        dividerThickness: 5,
                        columns: const [
                          DataColumn(
                              label: Text("العنصر",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.bold,
                                  ))),
                          DataColumn(
                            label: Text("الكمية",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          DataColumn(
                              label: Text("السعر",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.bold,
                                  )))
                        ],
                        rows: [
                          for (var item in field)
                            DataRow(cells: [
                              DataCell(Row(
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(item['element']![0]['name'],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(item['element']![0]['type'],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(item['element']![0]['number'],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              )),
                              DataCell(SingleChildScrollView(
                                child: Column(
                                  children: [
                                    for (int i = 0; i < 100; i++) ...[
                                      Text(i.toString(),
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Divider(thickness: 5),
                                    ]
                                  ],
                                ),
                              )),
                              DataCell(Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text("السعر:",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(item['price']![0]['price'],
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold,
                                          ))
                                    ],
                                  ),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text("الضريبة",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(item['price']![0]['Tax'],
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold,
                                          ))
                                    ],
                                  ),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text("الإجمالي",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(item['price']![0]['total'],
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold,
                                          ))
                                    ],
                                  )
                                ],
                              ))
                            ])
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: DataTable(
                    headingRowHeight: viewport.getHeightscreen / 30,
                    headingRowColor:
                        MaterialStatePropertyAll<Color>(Coloring.primary),
                    dataRowHeight: viewport.getHeightscreen / 30,
                    columnSpacing: viewport.getWidthscreen / 5,
                    border: TableBorder.all(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        width: 3,
                        color: Colors.grey),
                    dividerThickness: 5,
                    columns: [
                      DataColumn(
                          label: Text("الإجمالي ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                backgroundColor: Colors.blue[800],
                                color: Colors.blue,
                                fontSize: 15,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold,
                              ))),
                      DataColumn(
                          label: Text("الضريبة",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                backgroundColor: Colors.blue[800],
                                color: Colors.blue,
                                fontSize: 15,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold,
                              ))),
                      DataColumn(
                          label: Text("المجموع النهائي",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                backgroundColor: Colors.blue[800],
                                color: Colors.blue,
                                fontSize: 15,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold,
                              ))),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text("4.75",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold,
                            ))),
                        DataCell(Text("0.7125",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold,
                            ))),
                        DataCell(Text("5.4625",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold,
                            )))
                      ])
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                width: viewport.getWidthscreen / 1.1,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TabBar(
                    unselectedLabelColor: Colors.grey[800],
                    indicator: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    controller: tabControllerinvoice,
                    tabs: [
                      Tab(
                        child: Text("إلغاء الفاتورة",
                            style: TextStyle(
                                color: Coloring.primary,
                                fontSize: 15,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold)),
                      ),
                      Tab(
                        child: Text("حفظ الفاتورة",
                            style: TextStyle(
                                color: Coloring.primary,
                                fontSize: 15,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold)),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ])),
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.qr_code)),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 3, color: Colors.blue))),
          child: FABBottomAppBar(
            onTabSelected: (value) {
              setState(() {
                selectedpage = value;
              });
            },
            items: [
              FABBottomAppBarItem(
                  iconData: Icon(Icons.storefront_sharp,
                      color:
                          selectedpage == 0 ? Coloring.primary : Colors.grey),
                  text: ""),
              FABBottomAppBarItem(
                  iconData: Icon(Icons.headset_mic,
                      color:
                          selectedpage == 1 ? Coloring.primary : Colors.grey),
                  text: ""),
              FABBottomAppBarItem(
                  iconData: Icon(Icons.equalizer,
                      color:
                          selectedpage == 2 ? Coloring.primary : Colors.grey),
                  text: ""),
              FABBottomAppBarItem(
                  iconData: Icon(Icons.home,
                      color:
                          selectedpage == 3 ? Coloring.primary : Colors.grey),
                  text: ""),
            ],
            backgroundColor: Colors.white,
            centerItemText: '',
            color: Colors.grey,
            notchedShape: const CircularNotchedRectangle(),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 65,
          actions: [
            Column(
              children: [
                Container(
                  height: 20,
                  margin: const EdgeInsets.only(right: 15),
                  child: Text("ميني سوبر ماركت",
                      style: TextStyle(
                          color: Coloring.primary,
                          fontSize: 15,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  height: 20,
                  margin: const EdgeInsets.only(right: 15),
                  child: const Text("...كاشير احمد, مرحبا بك",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  height: 20,
                  margin: const EdgeInsets.only(right: 15),
                  child: Text(
                    formatDate(DateTime.now(), [
                      '  ',
                      HH,
                      ':',
                      nn,
                      am,
                      ',',
                      yyyy,
                      '/',
                      mm,
                      '/',
                      D,
                    ]),
                    style: TextStyle(color: Colors.grey[800], fontSize: 12),
                  ),
                )
              ],
            )
          ],
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.reorder,
                  color: Coloring.primary,
                  size: 44, // Changing Drawer Icon Size
                ),
                onPressed: () {
                  Values.dialogDrawer(
                      invoiceselected, context, viewport.getWidthscreen / 1.2);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: Colors.white,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.white),
        ),
        body: pages.elementAt(selectedpage));
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
