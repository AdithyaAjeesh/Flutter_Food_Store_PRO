import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/controller/product_controller.dart';
import 'package:provider/provider.dart';

class AdminProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String discription;
  final String image;
  final String id;
  const AdminProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.discription,
    required this.image,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductController>(context);
    return InkWell(
      onTap: () {},
      child: Container(
        height: 210,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 170,
              width: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 40),
            Column(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Price: $price',
                ),
                const SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed: () {
                    provider.deleteProduct(id);
                  },
                  style: ElevatedButton.styleFrom(),
                  label: const Text(
                    'Delete',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromARGB(255, 238, 189, 82),
                    ),
                  ),
                  icon: const Icon(Icons.delete),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(),
                  label: const Text(
                    'Update',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromARGB(255, 238, 189, 82),
                    ),
                  ),
                  icon: const Icon(Icons.update),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
