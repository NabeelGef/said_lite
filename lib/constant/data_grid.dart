import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/person.dart';
import 'package:said_lite/constant/values.dart';
import 'package:said_lite/constant/viewport.dart';
import 'package:said_lite/view/home.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataGrid extends DataGridSource {
  List<DataGridRow> test = [];
  DataGrid({required List<Map<String, dynamic>> field}) {
    sumFinal.value = 0.0;
    sumFirst.value = 0.0;
    taxFinal.value = 0.0;
    test = field.map<DataGridRow>((item) {
      sumFinal.value += double.parse(item['price'][0]['total']);
      sumFirst.value += double.parse(item['price'][0]['price']);
      taxFinal.value += double.parse(item['price'][0]['Tax']);
      return DataGridRow(cells: [
        DataGridCell(columnName: 'element', value: [
          item['element']![0]['name'],
          item['element']![0]['type'],
          item['element']![0]['number']
        ]),
        DataGridCell(
            columnName: 'quantities',
            value: [for (int i = 1; i < 1000; i++) i.toString()]),
        DataGridCell(columnName: 'price', value: [
          item['price']![0]['price'],
          item['price']![0]['Tax'],
          item['price']![0]['total']
        ]),
      ]);
    }).toList();
  }
  void setList(List<Map<String, dynamic>> field) {
    sumFinal.value = 0.0;
    test = field.map<DataGridRow>((item) {
      sumFinal.value += double.parse(item['price']![0]['total']);
      return DataGridRow(cells: [
        DataGridCell(columnName: 'element', value: [
          item['element']![0]['name'],
          item['element']![0]['type'],
          item['element']![0]['number']
        ]),
        DataGridCell(
            columnName: 'quantities',
            value: [for (int i = 1; i < 1000; i++) i.toString()]),
        DataGridCell(columnName: 'price', value: [
          item['price']![0]['price'],
          item['price']![0]['Tax'],
          item['price']![0]['total']
        ]),
      ]);
    }).toList();
  }

  // DataGrid({required List<Person> field}) {
  //   test = field.map((item) {
  //     return DataGridRow(cells: [
  //       DataGridCell(columnName: "element", value: item.getName),
  //       DataGridCell(columnName: "quantities", value: item.getQuantity),
  //       DataGridCell(columnName: "price", value: item.getAge)
  //     ]);
  //   }).toList();
  // }
  @override
  List<DataGridRow> get rows => test;
  RxDouble index = 0.0.obs;
  double get getIndex => this.index.value + 1;
  RxDouble sumFinal = 0.0.obs;
  double get getsumFinal => this.sumFinal.value;
  RxDouble taxFinal = 0.0.obs;
  double get getTaxFinal => this.taxFinal.value;
  RxDouble sumFirst = 0.0.obs;
  double get getSumFirst => this.sumFirst.value;
  void editIndex(double newIndex) {
    index.value = newIndex;
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    //print("Rows ===> ${row.getCells().first.value.toString()}");
    return DataGridRowAdapter(
        cells: row.getCells().map((datacell) {
      if (datacell.columnName == 'element') {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          textDirection: TextDirection.rtl,
          children: [
            Text(datacell.value[0],
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: Values.fontFamily,
                  fontWeight: FontWeight.bold,
                )),
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
          ],
        );
      } else if (datacell.columnName == "quantities") {
        return Obx(() {
          print("Index = ${index.value}");
          return CupertinoPicker(
              useMagnifier: true,
              itemExtent: 35,
              scrollController:
                  FixedExtentScrollController(initialItem: index.value.toInt()),
              onSelectedItemChanged: (value) {
                index.value = value.toDouble();
              },
              children: [
                for (int i = 0; i < 999; i++) ...[
                  Text(datacell.value[i].toString(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontFamily: Values.fontFamily,
                        fontWeight: FontWeight.bold,
                      )),
                  //Divider(thickness: 5),
                ]
              ]);
        });

        // return SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       for (int i = 0; i < 100; i++) ...[
        //         Text(datacell.value[i].toString(),
        //             style: const TextStyle(
        //               color: Colors.grey,
        //               fontSize: 20,
        //               fontFamily: "Lato",
        //               fontWeight: FontWeight.bold,
        //             )),
        //         Divider(thickness: 5),
        //       ]
        //     ],
        //   ),
        // );
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
                            fontSize: 20,
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                          // change.isEmpty ?
                          datacell.value[0],
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
                            fontSize: 20,
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(datacell.value[1],
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
                            fontSize: 20,
                            fontFamily: Values.fontFamily,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(datacell.value[2],
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
