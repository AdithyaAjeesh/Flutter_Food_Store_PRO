import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/controller/product_controller.dart';
import 'package:flutter_food_firebase_pro/view/admin/admin_product_card.dart';
import 'package:provider/provider.dart';

class AdminModifyProductScreen extends StatelessWidget {
  const AdminModifyProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductController>(context);
    return Scaffold(
        body: StreamBuilder(
      stream: provider.getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No Products Found'),
          );
        }
        final data = snapshot.data!;
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final product = data[index];
            final name = product.name.toString();
            final image = product.image.toString();
            final discription = product.discription.toString();
            final price = product.price.toString();
            final id = product.id.toString();
            return AdminProductCard(
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
