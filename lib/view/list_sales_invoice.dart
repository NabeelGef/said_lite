import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/colors.dart';
import '../constant/fabbar.dart';
import '../constant/values.dart';
import '../constant/viewport.dart';

class SalesInvoice extends StatefulWidget {
  const SalesInvoice({super.key});

  @override
  State<SalesInvoice> createState() => _SalesInvoiceState();
}

class _SalesInvoiceState extends State<SalesInvoice> {
  var field = [
    {"ID": "#1", "Invoicenum": "654223", "Invoicesum": "2.50"},
    {"ID": "#2", "Invoicenum": "654223", "Invoicesum": "2.50"},
    {"ID": "#3", "Invoicenum": "654223", "Invoicesum": "2.50"},
    {"ID": "#4", "Invoicenum": "654223", "Invoicesum": "2.50"},
    {"ID": "#5", "Invoicenum": "654223", "Invoicesum": "2.50"},
    {"ID": "#6", "Invoicenum": "654223", "Invoicesum": "2.50"}
  ];

  @override
  Widget build(BuildContext context) {
    Screen viewport = Screen(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              child: Container(
                alignment: Alignment.center,
                width: viewport.getWidthscreen / 2,
                height: viewport.getHeightscreen / 12,
                child: Text("قائمة فواتير المبيعات",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Coloring.primary,
                        fontSize: 15,
                        fontFamily: Values.fontFamily,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: viewport.getHeightscreen / 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textDirection: TextDirection.rtl,
              children: [
                Text("من",
                    style: TextStyle(
                        color: Coloring.primary,
                        fontSize: 15,
                        fontFamily: Values.fontFamily,
                        fontWeight: FontWeight.bold)),
                Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Text("10/10/2022",
                          style: TextStyle(
                              color: Coloring.primary,
                              fontSize: 15,
                              fontFamily: Values.fontFamily,
                              fontWeight: FontWeight.bold)),
                      Icon(Icons.calendar_month)
                    ],
                  ),
                ),
                Text("إلى",
                    style: TextStyle(
                        color: Coloring.primary,
                        fontSize: 15,
                        fontFamily: Values.fontFamily,
                        fontWeight: FontWeight.bold)),
                Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Text("10/11/2022",
                          style: TextStyle(
                              color: Coloring.primary,
                              fontSize: 15,
                              fontFamily: Values.fontFamily,
                              fontWeight: FontWeight.bold)),
                      Icon(Icons.calendar_month)
                    ],
                  ),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: viewport.getHeightscreen / 40),
                width: viewport.getWidthscreen / 2,
                height: viewport.getHeightscreen / 15,
                child: TextFormField(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.grey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.grey)),
                      hintTextDirection: TextDirection.rtl,
                      hintText: "بحث برقم الفاتورة ...",
                      contentPadding: EdgeInsets.zero,
                      hintStyle: TextStyle(
                          overflow: TextOverflow.fade,
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: Values.fontFamily,
                          fontWeight: FontWeight.bold),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 30,
                      )),
                )),
            Container(
              margin: const EdgeInsets.all(15),
              height: viewport.getHeightscreen / 3,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Scrollbar(
                  thickness: 10,
                  radius: Radius.circular(25),
                  scrollbarOrientation: ScrollbarOrientation.left,
                  child: SingleChildScrollView(
                    child: DataTable(
                      headingRowHeight: viewport.getHeightscreen / 20,
                      dataRowHeight: viewport.getHeightscreen / 20,
                      border: TableBorder.all(
                          borderRadius: BorderRadius.circular(15),
                          width: 3,
                          color: Colors.grey),
                      dividerThickness: 5,
                      columns: [
                        DataColumn(
                            label: Text("ID",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontFamily: Values.fontFamily,
                                  fontWeight: FontWeight.bold,
                                ))),
                        DataColumn(
                          label: Text("رقم الفاتورة",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontFamily: Values.fontFamily,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        DataColumn(
                          label: Text("مبلغ الفاتورة",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontFamily: Values.fontFamily,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                      rows: [
                        for (var item in field) ...[
                          DataRow(cells: [
                            DataCell(Text(item['ID']!,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontFamily: Values.fontFamily,
                                  fontWeight: FontWeight.bold,
                                ))),
                            DataCell(Text(item['Invoicenum']!,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontFamily: Values.fontFamily,
                                  fontWeight: FontWeight.bold,
                                ))),
                            DataCell(Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(item['Invoicesum']!,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontFamily: Values.fontFamily,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Icon(Icons.history, color: Coloring.primary),
                                Icon(Icons.print, color: Coloring.primary),
                              ],
                            )),
                          ])
                        ]
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DataTable(
                  headingRowHeight: viewport.getHeightscreen / 30,
                  headingRowColor:
                      MaterialStatePropertyAll<Color>(Coloring.primary),
                  dataRowHeight: viewport.getHeightscreen / 30,
                  columnSpacing: viewport.getWidthscreen / 10,
                  border: TableBorder.all(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      width: 3,
                      color: Colors.grey),
                  dividerThickness: 5,
                  columns: [
                    DataColumn(
                        label: Text("إجمالي الفواتير ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              backgroundColor: Colors.blue[800],
                              color: Colors.blue,
                              fontSize: 15,
                              fontFamily: Values.fontFamily,
                              fontWeight: FontWeight.bold,
                            ))),
                    DataColumn(
                        label: Text("الضريبة",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              backgroundColor: Colors.blue[800],
                              color: Colors.blue,
                              fontSize: 15,
                              fontFamily: Values.fontFamily,
                              fontWeight: FontWeight.bold,
                            ))),
                    DataColumn(
                        label: Text("المجموع النهائي",
                            textAlign: TextAlign.center,
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
                      DataCell(Text("45",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold,
                          ))),
                      DataCell(Text("0.7125",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold,
                          ))),
                      DataCell(Text("5.4625",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold,
                          )))
                    ])
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
