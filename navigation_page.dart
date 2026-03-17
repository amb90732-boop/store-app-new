import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';



class ProductCard extends StatefulWidget {

  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  int quantity = 1;
  bool hover = false;

  @override
  Widget build(BuildContext context) {

    return MouseRegion(

      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),

      child: Card(
        child: Column(
          children: [

            Image.network(widget.product.image, height: 100),

            Text(widget.product.title),

            Text("\$${widget.product.price}"),

            if (hover)
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(widget.product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: (){
                    if(quantity > 1){
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),

                Text(quantity.toString()),

                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: (){
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),

            ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to cart")),
                );
              },
              child: const Text("Add To Cart"),
            )
          ],
        ),
      ),
    );
  }
}