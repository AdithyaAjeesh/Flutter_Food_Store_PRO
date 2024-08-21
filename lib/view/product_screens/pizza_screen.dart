import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/view/widget/stream_builder_widget.dart';

class PizzaScreen extends StatelessWidget {
  const PizzaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomStreamBuilderWidget(product: 'Pizza');
  }
}
