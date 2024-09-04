import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/controller/product_controller.dart';
import 'package:flutter_food_firebase_pro/product_screens/widgets/product_card.dart';
import 'package:provider/provider.dart';

class CustomStreamBuilderWidget extends StatelessWidget {
  final String product;
  const CustomStreamBuilderWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductController>(context);
    return Scaffold(
        body: StreamBuilder(
      stream: provider.getAllProductsAccordingly(product),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          return Center(
            child: Text('No $product Found'),
          );
        }
        final data = snapshot.data!;
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final burger = data[index];
            final name = burger.name.toString();
            final image = burger.image.toString();
            final discription = burger.discription.toString();
            final price = burger.price.toString();
            final id = burger.id.toString();
            return ProductCard(
              name: name,
              image: image,
              price: price,
              discription: discription,
              id: id,
            );
          },
        );
      },
    ));
  }
}
