// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:said_lite/model/item.dart';

class InvoiceItem {
  Item? item;
  Float? total;
  int? quantity;
  Float? vat;
  Float? get getTotla => this.total;

  set setTotla(Float? total) => this.total = total;

  get getQuantity => this.quantity;

  set setQuantity(quantity) => this.quantity = quantity;

  get getVat => this.vat;

  set setVat(vat) => this.vat = vat;

  InvoiceItem() {
    item = Item();
  }
}
