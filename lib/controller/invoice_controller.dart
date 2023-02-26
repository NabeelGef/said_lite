import 'package:get/get.dart';
import 'package:said_lite/model/invoice.dart';

class InvoiceController extends GetxController {
  Invoice invoice;
  InvoiceController({required this.invoice}) {
    invoice = invoice;
  }
  void EditInvoice(Invoice newInvoice) {
    invoice = newInvoice;
    update();
  }
}
