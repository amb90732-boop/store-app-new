import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class FavoriteProvider extends ChangeNotifier {

  //list name calles == favories....
  final List<Product> favorites = [];

  //Function to add and remove bool ....
  void toggltFavorite(Product product) {

    //we reverse the conditions at this state....(true or fasle... علشان كده هنكتب بالعكس)....
    if (favorites.contains(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
    notifyListeners();
  }

  //the remove function....

  void removeFavorite(Product product) {
    favorites.remove(product);
    notifyListeners();
  }
}
