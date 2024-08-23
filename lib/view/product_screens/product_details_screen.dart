import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String imageURL;
  final String productName;
  final String productPrice;
  final String productDisciption;
  const ProductDetailsScreen({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productDisciption,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  child: Image.network(
                    imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Text(
                        productName,
                        style: const TextStyle(
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
                    ),
                    const SizedBox(width: 30),
                    Text(
                      'Price: $productPrice',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  productDisciption,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    height: 230,
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 65,
                          width: MediaQuery.of(context).size.width - 20,
                          color: Colors.redAccent,
                          child: const Text('Extra Cheeses'),
                        ),
                        Container(
                          height: 65,
                          width: MediaQuery.of(context).size.width - 20,
                          color: Colors.redAccent,
                          child: const Text('Extra Cheeses'),
                        ),
                        Container(
                          height: 65,
                          width: MediaQuery.of(context).size.width - 20,
                          color: Colors.redAccent,
                          child: const Text('Extra Cheeses'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
