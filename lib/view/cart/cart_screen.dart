import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/controller/product_controller.dart';
import 'package:flutter_food_firebase_pro/model/product_model.dart';
import 'package:flutter_food_firebase_pro/view/cart/widget/cart_card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.black,
            shadows: [
              Shadow(
                color: Color.fromARGB(255, 247, 199, 95),
                offset: Offset(2, 3),
              )
            ],
          ),
        ),
      ),
      body: StreamBuilder<List<ProductModel>>(
        stream: provider.getCartProductsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading cart items.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Your cart is empty.'));
          }

          final cartProducts = snapshot.data!;
          return ListView.builder(
            itemCount: cartProducts.length,
            itemBuilder: (context, index) {
              final product = cartProducts[index];
              final name = product.name.toString();
              final price = product.price.toString();
              final image = product.image.toString();
              final id = product.id.toString();
              return CartCard(
                name: name,
                price: price,
                image: image,
                id: id,
              );
            },
          );
        },
      ),
    );
  }
}
