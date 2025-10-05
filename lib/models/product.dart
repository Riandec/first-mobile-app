class Product {
  int id;
  String name;
  String desc;
  double price;

  Product(this.id, this.name, this.desc, this.price);

  Product.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      desc = json['description'],
      price = json['price'];
}
