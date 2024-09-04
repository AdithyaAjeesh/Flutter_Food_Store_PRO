import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/controller/product_controller.dart';
import 'package:flutter_food_firebase_pro/product_screens/product_details_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String discription;
  final String image;
  final String id;
  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.discription,
    required this.image,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductController>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
            imageURL: image,
            productName: name,
            productPrice: price,
            productDisciption: discription,
          ),
        ));
      },
      child: Container(
        height: 210,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 8),
                blurRadius: 5,
                spreadRadius: 2,
                color: Color.fromARGB(255, 203, 197, 197),
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            color: Color.fromARGB(255, 255, 255, 255)),
        child: Row(
          children: [
            SizedBox(
              width: 190,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Price: $price',
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 100,
                    height: 20,
                    child: RatingBar.builder(
                      itemSize: 20,
                      itemBuilder: (context, index) {
                        return const Icon(Icons.star);
                      },
                      onRatingUpdate: (value) {},
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      provider.addProductToCart(id);
                    },
                    style: ElevatedButton.styleFrom(),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromARGB(255, 238, 189, 82),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 170,
              width: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
