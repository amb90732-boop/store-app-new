
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required List<dynamic> cart});
  @override
  Widget build(BuildContext context) {
    //variable that store at CartProvider....
     final cartProvider = Provider.of<CartProvider>(context);
     final cart = cartProvider.cart;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final product = cart[index];
              return  ListTile(
                  leading: Image.network(product.image),
                  title: Text(product.title),
                  subtitle: Text("\$${product.price}"),
                  //not Column
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //this is icon to decrease the quantity....
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          cartProvider.decreaseQuantity(product);
                        },    
                      ),
                      Text(product.quantity.toString()),
                      //this is icon to increase the quantity....
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          cartProvider.increaseQuantity(product);
                        },    
                      ),
                      //this is the icon to remove from Cart....
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          cartProvider.removeFromCart(product);
                        },    
                      ),
                      
                    ],
                  ),
                );
            },
          ),
        ),

        ElevatedButton(
          onPressed: () {

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Purchase completed successfully"),
              ),
            );
          },
          child: const Text("Purchase"),
        ),
      ],
    );
  }
}