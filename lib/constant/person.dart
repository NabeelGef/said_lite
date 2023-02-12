// ignore_for_file: public_member_api_docs, sort_constructors_first
class Person {
  String? name;
  int? quantity;
  int? age;
  Person({
    this.name,
    this.quantity,
    this.age,
  });

  String? get getName => this.name;

  set setName(String? name) => this.name = name;

  get getQuantity => this.quantity;

  set setQuantity(quantity) => this.quantity = quantity;

  get getAge => this.age;

  set setAge(age) => this.age = age;
}
