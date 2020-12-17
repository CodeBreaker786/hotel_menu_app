import 'dart:convert';

class Order {
  String tableId;
  List<Item> items;

  Order(this.tableId, this.items);

  toJson() => {"tableId": this.tableId, "items": jsonEncode(items)};
}

class Item {
  String name;
  double price;
  int quantity;

  Item(this.name, this.price, this.quantity);

  toJson() =>
      {"name": this.name, "price": this.price, "quantity": this.quantity};
}
