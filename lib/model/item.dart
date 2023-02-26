// ignore_for_file: public_member_api_docs, sort_constructors_first
class Item {
  String name;
  double purchasePrice;
  double salePrice;
  double vatRate;
  Item({
    required this.name,
    required this.purchasePrice,
    required this.salePrice,
    required this.vatRate,
  });
  String get getName => this.name;

  set setName(String name) => this.name = name;

  get getPurchasePrice => this.purchasePrice;

  set setPurchasePrice(purchasePrice) => this.purchasePrice = purchasePrice;

  get getSalePrice => this.salePrice;

  set setSalePrice(salePrice) => this.salePrice = salePrice;

  get getVatRate => this.vatRate;

  set setVatRate(vatRate) => this.vatRate = vatRate;
}
