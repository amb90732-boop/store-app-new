import 'package:flutter/material.dart';
import 'package:store_app/models/product_card.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/api_service.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products =
        ApiService.getProducts(); //this is fuction that i used it to make
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: products,

      builder: (context, snapshot) {
        //the first condition of waiting icon....
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        //if the items already has data
        final items = snapshot.data!;

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,//make it about rows not Column....
          ),

          itemCount: items.length, //Access

          itemBuilder: (context, index) {
            return ProductCard(
              product: items[index],
            ); //this is the file of(product_cart.dart)....
          },
        );
      },
    );
  }
}
