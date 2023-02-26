// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:said_lite/model/item.dart';

class InvoiceItem {
  Item item;
  double total;
  int quantity;
  double vat;
  InvoiceItem({
    required this.item,
    required this.total,
    required this.quantity,
    required this.vat,
  }) {
    item = item;
    total = total;
    quantity = quantity;
    vat = vat;
  }
  Item get getItem => this.item;

  set setItem(Item item) => this.item = item;

  double get getTotal => this.total;

  set setTotal(double total) => this.total = total;

  get getQuantity => this.quantity;

  set setQuantity(quantity) => this.quantity = quantity;

  get getVat => this.vat;

  set setVat(vat) => this.vat = vat;
}
