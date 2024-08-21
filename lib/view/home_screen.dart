import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/controller/product_controller.dart';
import 'package:flutter_food_firebase_pro/view/widget/custom_carousel_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Store',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
            shadows: [
              Shadow(
                color: Color.fromARGB(255, 247, 199, 95),
                offset: Offset(2, 3),
              )
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              height: 70,
              color: const Color.fromRGBO(247, 199, 95, 1),
              child: const Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    'Our Latest Foods',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // const CustomCarouselWidget()
          ],
        ),
      ),
    );
  }
}
