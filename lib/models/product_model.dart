/**i need::
 * title, id, price, description, image....
 */

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  int quantity; //don't use final(because it is changed)....

  Product({
    this.quantity = 1,
    required this.id,
    required this.description,
    required this.image,
    required this.price,
    required this.title,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      title: json['title'],
    );
  }
}
