import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/controller/product_controller.dart';
import 'package:provider/provider.dart';

class OtherFeatureScreen extends StatelessWidget {
  const OtherFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                ),
                child: Column(
                  children: [
                    const Text('Modify Home Carousel 1'),
                    ElevatedButton(
                      onPressed: () {
                        provider.pickImage();
                      },
                      child: const Text('pick Image'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        provider.addCarouselImages();
                      },
                      child: const Text('Add Image'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
