// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:said_lite/model/invoice_item.dart';
import 'package:said_lite/model/item.dart';

class Invoice {
  DateTime date;
  double total;
  double vat;
  double net;
  List<InvoiceItem> invoiceItems;
  List<InvoiceItem> get getInvoiceItems => this.invoiceItems;

  Invoice(
      {required this.date,
      required this.total,
      required this.vat,
      required this.net,
      required this.invoiceItems});
  void addItem(Item item) {}
  void preview() {}
  void finalize() {}
  Invoice calculateTotal(double quantity, int index) {
    this.getInvoiceItems[index].setTotal =
        this.getInvoiceItems[index].getItem.getSalePrice * quantity +
            this.getInvoiceItems[index].getVat;
    return this;
  }

  Invoice calculateVat(double quantity, int index) {
    this.getInvoiceItems[index].setVat =
        this.getInvoiceItems[index].getItem.getSalePrice *
            quantity *
            this.getInvoiceItems[index].getItem.getVatRate;
    return this;
  }

  void print() {}
  void returnInvoice(Invoice invoice) {}
  void returnItem(Item item) {}
}
