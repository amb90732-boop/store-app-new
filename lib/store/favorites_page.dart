import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/favorite_provider.dart';

class FavouritaPage extends StatefulWidget {
  const FavouritaPage({super.key});

  @override
  State<FavouritaPage> createState() => _FavouritaPageState();
}

class _FavouritaPageState extends State<FavouritaPage> {
  @override
  Widget build(BuildContext context) {
  final favorities = Provider.of<FavoriteProvider>(context).favorites;
    return Scaffold(
      body: ListView.builder(
        itemCount: favorities.length,
        itemBuilder: (context, index) {
          final product = favorities[index];

          return ListTile(
            leading: Image.network(product.image),
            title: Text(product.title),
            subtitle: IconButton(
              onPressed: () {
                Provider.of<FavoriteProvider>(context).removeFavorite(product);
              },
              icon: const Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
