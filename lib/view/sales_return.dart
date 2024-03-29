import 'dart:developer';
import 'dart:ui';

import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../constant/colors.dart';
import '../constant/data_grid.dart';
import '../constant/fabbar.dart';
import '../constant/values.dart';
import '../constant/viewport.dart';
import '../controller/invoice_controller.dart';

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
  ScrollController _scrollControlList = ScrollController();
  ScrollController _scrollControlGrid = ScrollController();
  InvoiceController invoiceController = Get.find();

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  late DataGrid dataGrid;
  GlobalKey<FormState> _formeditable = GlobalKey();
  GlobalKey<FormState> _formeditable2 = GlobalKey();

  @override
  void initState() {
    dataGrid = DataGrid(invoice: Values.invoice);

    tabController = TabController(length: 2, vsync: this);
    if (Values.invoiceselected.isTrue) {
      tabController!.index = 0;
    } else {
      tabController!.index = 1;
    }
    tabControllerinvoice = TabController(length: 2, vsync: this);
    _scrollControlGrid.addListener(() {
      _scrollControlList.animateTo(_scrollControlGrid.position.pixels,
          duration: Duration(milliseconds: 1), curve: Curves.linear);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    return SafeArea(
      child: SingleChildScrollView(
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
                    Values.invoiceselected.value = true;
                  } else {
                    Values.invoiceselected.value = false;
                  }
                });
              },
              tabs: [
                Tab(
                  child: Text("فاتورة مبيعات",
                      style: TextStyle(
                          color: Coloring.primary,
                          fontSize: 15,
                          fontFamily: Values.fontFamily,
                          fontWeight: FontWeight.bold)),
                ),
                Tab(
                  child: Text("فاتورة مشتريات",
                      style: TextStyle(
                          color: Coloring.primary,
                          fontSize: 15,
                          fontFamily: Values.fontFamily,
                          fontWeight: FontWeight.bold)),
                ),
              ]),
        ),
        Container(
            width: viewport.getWidthscreen / 1.2,
            height: viewport.getHeightscreen / 3,
            child: _buildQrView(viewport, context)),
        Column(
          children: [
            if (result != null)
              Text(
                  'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
            else
              Text("...عملية المسح جارية",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontFamily: Values.fontFamily,
                      fontWeight: FontWeight.bold)),
            Container(
              width: viewport.getWidthscreen / 1.1,
              height: viewport.getHeightscreen / 15,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(15)),
              child: Text("فاتورة مبيعات رقم #45453",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: Values.fontFamily,
                      fontWeight: FontWeight.bold)),
            ),
            Stack(
              children: [
                Container(
                  height: viewport.getHeightscreen / 2.3,
                  width: viewport.getWidthscreen,
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: GetBuilder<InvoiceController>(builder: (controller) {
                      return ListView.builder(
                          controller: _scrollControlList,
                          itemCount: controller.invoice.getInvoiceItems.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: viewport.getHeightscreen / 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/images/edit.png",
                                      width: 30,
                                      height: 30,
                                    ),
                                    Image.asset("assets/images/delete.png",
                                        width: 30, height: 30)
                                  ],
                                ),
                                SizedBox(
                                  height: viewport.getHeightscreen / 20,
                                ),
                              ],
                            );
                          });
                    }),
                  ),
                ),
                Container(
                  width: viewport.getWidthscreen / 1.1,
                  margin: EdgeInsets.symmetric(
                      vertical: 15, horizontal: viewport.getWidthscreen / 11),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Scrollbar(
                      thickness: 10,
                      radius: Radius.circular(25),
                      scrollbarOrientation: ScrollbarOrientation.left,
                      child: SingleChildScrollView(
                        child: SfDataGridTheme(
                          data: SfDataGridThemeData(
                              gridLineColor: Colors.grey,
                              gridLineStrokeWidth: 2),
                          child: SfDataGrid(
                            verticalScrollController: _scrollControlGrid,
                            gridLinesVisibility: GridLinesVisibility.both,
                            defaultColumnWidth: viewport.getHeightscreen / 6,
                            source: dataGrid,
                            rowHeight: viewport.getHeightscreen / 5,
                            headerRowHeight: viewport.getHeightscreen / 20,
                            swipeMaxOffset: 50,
                            allowSwiping: true,
                            headerGridLinesVisibility: GridLinesVisibility.both,
                            endSwipeActionsBuilder:
                                (context, dataGridRow, rowIndex) {
                              return Values.DialogEdit(
                                  context,
                                  viewport,
                                  rowIndex,
                                  _formeditable,
                                  _formeditable2,
                                  invoiceController.invoice,
                                  dataGrid);
                            },
                            startSwipeActionsBuilder:
                                (context, dataGridRow, rowIndex) {
                              return Values.DialogDelete(
                                  context,
                                  viewport,
                                  rowIndex,
                                  _formeditable,
                                  _formeditable2,
                                  dataGrid);
                            },
                            columns: [
                              GridColumn(
                                  columnName: 'element',
                                  label: Text("العنصر",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontFamily: Values.fontFamily,
                                        fontWeight: FontWeight.bold,
                                      ))),
                              GridColumn(
                                width: viewport.getWidthscreen / 6,
                                columnName: 'quantities',
                                label: Text("الكمية",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontFamily: Values.fontFamily,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              GridColumn(
                                  columnName: 'price',
                                  label: Text("السعر",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontFamily: Values.fontFamily,
                                        fontWeight: FontWeight.bold,
                                      )))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Container(
                width: viewport.getWidthscreen,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: DataTable(
                    headingRowHeight: viewport.getHeightscreen / 10,
                    headingRowColor:
                        MaterialStatePropertyAll<Color>(Coloring.primary),
                    dataRowHeight: viewport.getHeightscreen / 20,
                    columnSpacing: viewport.getWidthscreen / 15,
                    border: TableBorder.all(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        width: 3,
                        color: Colors.grey),
                    dividerThickness: 5,
                    columns: [
                      DataColumn(
                          label: Text("إجمالي \nقبل الضريبة ",
                              style: TextStyle(
                                backgroundColor: Colors.blue[800],
                                color: Colors.blue,
                                fontSize: 15,
                                fontFamily: Values.fontFamily,
                                fontWeight: FontWeight.bold,
                              ))),
                      DataColumn(
                          label: Text("الضريبة الكلّيّة",
                              style: TextStyle(
                                backgroundColor: Colors.blue[800],
                                color: Colors.blue,
                                fontSize: 15,
                                fontFamily: Values.fontFamily,
                                fontWeight: FontWeight.bold,
                              ))),
                      DataColumn(
                          label: Text("الإجمالي النهائي",
                              style: TextStyle(
                                backgroundColor: Colors.blue[800],
                                color: Colors.blue,
                                fontSize: 15,
                                fontFamily: Values.fontFamily,
                                fontWeight: FontWeight.bold,
                              ))),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Obx(() {
                          return Text(dataGrid.getSumFirst.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontFamily: Values.fontFamily,
                                fontWeight: FontWeight.bold,
                              ));
                        })),
                        DataCell(Obx(() {
                          return Text(dataGrid.getTaxFinal.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontFamily: Values.fontFamily,
                                fontWeight: FontWeight.bold,
                              ));
                        })),
                        DataCell(
                          Obx(() {
                            return Text(dataGrid.getsumFinal.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontFamily: Values.fontFamily,
                                  fontWeight: FontWeight.bold,
                                ));
                          }),
                        )
                      ])
                    ],
                  ),
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
      ])),
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
