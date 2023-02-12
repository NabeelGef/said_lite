import 'package:flutter/material.dart';
import 'package:said_lite/constant/colors.dart';
import 'package:said_lite/constant/person.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataGrid extends DataGridSource {
  List<DataGridRow> test = [];
  DataGrid({required List<Map<String, dynamic>> field}) {
    test = field.map<DataGridRow>((item) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'element', value: [
          item['element']![0]['name'],
          item['element']![0]['type'],
          item['element']![0]['number']
        ]),
        DataGridCell(
            columnName: 'quantities',
            value: [for (int i = 0; i < 100; i++) i.toString()]),
        DataGridCell(columnName: 'price', value: [
          item['price']![0]['price'],
          item['price']![0]['Tax'],
          item['price']![0]['total']
        ]),
      ]);
    }).toList();
  }
  void setList(List<Map<String, dynamic>> field) {
    test = field.map<DataGridRow>((item) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'element', value: [
          item['element']![0]['name'],
          item['element']![0]['type'],
          item['element']![0]['number']
        ]),
        DataGridCell(
            columnName: 'quantities',
            value: [for (int i = 0; i < 100; i++) i.toString()]),
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

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    print("Rows ===> ${row.getCells().first.value.toString()}");
    return DataGridRowAdapter(
        cells: row.getCells().map((datacell) {
      if (datacell.columnName == 'element') {
        return Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.error,
              color: Colors.red,
              size: 15,
            ),
            Text(datacell.value[0],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold,
                )),
            Text(datacell.value[1],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold,
                )),
            Text(datacell.value[2],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold,
                )),
          ],
        );
      } else if (datacell.columnName == "quantities") {
        return SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < 100; i++) ...[
                Text(datacell.value[i].toString(),
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
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("السعر:",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.bold,
                        )),
                    Text(datacell.value[0],
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("الضريبة",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.bold,
                        )),
                    Text(datacell.value[1],
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("الإجمالي",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.bold,
                        )),
                    Text(datacell.value[2],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                )
              ],
            ),
            Icon(Icons.edit, color: Coloring.primary, size: 15)
          ],
        );
      }
    }).toList());
  }

  void updateDataGridSource() {
    notifyListeners();
  }
}
