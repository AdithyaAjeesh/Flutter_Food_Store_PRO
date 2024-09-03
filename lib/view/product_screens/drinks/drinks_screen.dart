import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/view/product_screens/widgets/stream_builder_widget.dart';

class DrinksScreen extends StatelessWidget {
  const DrinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomStreamBuilderWidget(product: 'Drink'),
    );
  }
}
