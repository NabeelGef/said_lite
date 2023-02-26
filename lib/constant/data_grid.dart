import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/person.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/constant/viewport.dart';
import 'package:said_lite/controller/invoice_controller.dart';
import 'package:said_lite/model/invoice.dart';
import 'package:said_lite/view/home.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataGrid extends DataGridSource {
  Invoice invoice;
  List<DataGridRow> invoices = [];
  List<RxDouble> indexes = List.generate(500, (index) => 0.0.obs);
  InvoiceController invoiceController = Get.find();
  DataGrid({required this.invoice}) {
    sumFinal.value = 0.0;
    sumFirst.value = 0.0;
    taxFinal.value = 0.0;
    invoice = invoice;

    for (int i = 0; i < invoice.getInvoiceItems.length; i++) {
      sumFinal.value += invoice.getInvoiceItems[i].getTotal;
      sumFirst.value += invoice.getInvoiceItems[i].getItem.getSalePrice;
      taxFinal.value += invoice.getInvoiceItems[i].getVat;
      editIndex(i, invoice.getInvoiceItems[i].getQuantity.toDouble() - 1);
      invoices.add(DataGridRow(cells: [
        DataGridCell(columnName: 'element', value: [
          i,
          invoice.getInvoiceItems[i].getItem.getName,
          'علبة',
          '5'
        ]),
        DataGridCell(columnName: 'quantities', value: [
          i,
          invoice.getInvoiceItems[i].getQuantity,
        ]),
        DataGridCell(columnName: 'price', value: [
          i,
          invoice.getInvoiceItems[i].getItem.getSalePrice,
          invoice.getInvoiceItems[i].getVat,
          invoice.getInvoiceItems[i].getTotal
        ])
      ]));
    }
  }
  void setList(Invoice invoice) {
    sumFinal.value = 0.0;
    sumFirst.value = 0.0;
    taxFinal.value = 0.0;
    invoices.clear();
    invoice = invoice;
    for (int i = 0; i < invoice.getInvoiceItems.length; i++) {
      sumFinal.value += invoice.getInvoiceItems[i].getTotal;
      sumFirst.value += invoice.getInvoiceItems[i].getItem.getSalePrice;
      taxFinal.value += invoice.getInvoiceItems[i].getVat;

      print("Quantities : ${invoice.getInvoiceItems[i].getQuantity}\n");

      invoices.add(DataGridRow(cells: [
        DataGridCell(columnName: 'element', value: [
          i,
          invoice.getInvoiceItems[i].getItem.getName,
          'علبة',
          '5'
        ]),
        DataGridCell(columnName: 'quantities', value: [
          i,
          invoice.getInvoiceItems[i].getQuantity,
        ]),
        DataGridCell(columnName: 'price', value: [
          i,
          invoice.getInvoiceItems[i].getItem.getSalePrice,
          invoice.getInvoiceItems[i].getVat,
          invoice.getInvoiceItems[i].getTotal
        ])
      ]));
    }
    invoiceController.EditInvoice(invoice);
    updateDataGridSource();
  }

  @override
  List<DataGridRow> get rows => invoices;
  RxDouble sumFinal = 0.0.obs;
  double get getsumFinal => this.sumFinal.value;
  RxDouble taxFinal = 0.0.obs;
  double get getTaxFinal => this.taxFinal.value;
  RxDouble sumFirst = 0.0.obs;
  double get getSumFirst => this.sumFirst.value;
  void editIndex(int ind, double newIndex) {
    indexes[ind].value = newIndex;
  }

  Rx<FixedExtentScrollController> _scroller = FixedExtentScrollController().obs;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map((datacell) {
      if (datacell.columnName == 'element') {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          textDirection: TextDirection.rtl,
          children: [
            Text(datacell.value[1],
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: Values.fontFamily,
                  fontWeight: FontWeight.bold,
                )),
            Text(datacell.value[2],
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: Values.fontFamily,
                  fontWeight: FontWeight.bold,
                )),
            Text(datacell.value[3],
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: Values.fontFamily,
                  fontWeight: FontWeight.bold,
                )),
          ],
        );
      } else if (datacell.columnName == "quantities") {
        print("QuantitiesNew==> : ${datacell.value[1].toInt() - 1}\n");

        return CupertinoPicker.builder(
          childCount: 500,

          itemBuilder: (context, index) {
            return Text((index + 1).toString(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontFamily: Values.fontFamily,
                  fontWeight: FontWeight.bold,
                ));
          },
          itemExtent: 35,
          scrollController: FixedExtentScrollController(
              initialItem: datacell.value[1].toInt() - 1),
          onSelectedItemChanged: (value) {
            invoice.getInvoiceItems[datacell.value[0]].setQuantity =
                (value + 1).toInt();

            invoice =
                invoice.calculateVat(value + 1.toDouble(), datacell.value[0]);
            invoice =
                invoice.calculateTotal(value + 1.toDouble(), datacell.value[0]);
            setList(invoice);
            updateDataGridSource();
          },
          // children: [
          //   for (int i = 2; i < 999; i++) ...[
          //     //Divider(thickness: 5),
          //   ]
          //]
        );
      } else {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("السعر:",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                          // change.isEmpty ?
                          datacell.value[1].toStringAsFixed(1),
                          //: 100.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("الضريبة:",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(datacell.value[2].toStringAsFixed(1),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("الإجمالي:",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(datacell.value[3].toStringAsFixed(1),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      }
    }).toList());
  }

  void updateDataGridSource() {
    notifyListeners();
  }
}
