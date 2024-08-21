import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/view/widget/stream_builder_widget.dart';

class BurgerScreens extends StatelessWidget {
  const BurgerScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomStreamBuilderWidget(product: 'Burger'),
    );
  }
}
