import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/controller/product_controller.dart';
import 'package:flutter_food_firebase_pro/view/product_screens/widgets/product_card.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductController>(context);
    return Scaffold(
      body: FutureBuilder(
        future: provider.fetchAllProductsOnce(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.data!.isEmpty || snapshot.data == null) {
            return const Center(
              child: Text('No Products Available'),
            );
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final product = data[index];
                final name = product.name.toString();
                final price = product.price.toString();
                final discription = product.discription.toString();
                final image = product.image.toString();
                final id = product.id.toString();
                return ProductCard(
                  name: name,
                  price: price,
                  discription: discription,
                  image: image,
                  id: id,
                );
              },
            );
          }
        },
      ),
    );
  }
}
