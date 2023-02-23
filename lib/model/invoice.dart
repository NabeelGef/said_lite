// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:said_lite/model/invoice_item.dart';
import 'package:said_lite/model/item.dart';

class Invoice {
  DateTime date;
  Float total;
  Float vat;
  Float net;
  List<InvoiceItem> invoiceItems = [];
  Invoice({
    required this.date,
    required this.total,
    required this.vat,
    required this.net,
  });
  void addItem(Item item) {}
  void preview() {}
  void finalize() {}
  void calculateTotal() {}
  void calculateVat() {}
  void print() {}
  void returnInvoice(Invoice invoice) {}
  void returnItem(Item item) {}
}
