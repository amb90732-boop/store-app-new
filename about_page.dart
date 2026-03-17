import 'package:flutter/material.dart';
import '../models/product_model.dart';


class CartProvider extends ChangeNotifier {

  final List<Product> cart = [];//this is the list name....

  void addToCart(Product product) {
    final index = cart.indexWhere((p) => p.id == product.id);

    if (index >=0 ){
      cart[index].quantity++;
    } else {
      cart.add(product);
    }
    notifyListeners();
  }
  void removeFromCart(Product product) {

    cart.remove(product);
    notifyListeners();
  }
  void increaseQuantity(Product product) {

    product.quantity++;
    notifyListeners();
  }
  void decreaseQuantity(Product product) {

    if (product.quantity > 1) {
      product.quantity--;
      notifyListeners();
    }
  }

}
