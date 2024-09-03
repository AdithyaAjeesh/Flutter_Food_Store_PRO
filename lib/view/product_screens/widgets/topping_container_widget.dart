import 'package:flutter/material.dart';

class ToppingContainerWidget extends StatelessWidget {
  final String title;
  final VoidCallback increase;
  final VoidCallback decrease;

  const ToppingContainerWidget({
    super.key,
    required this.title,
    required this.increase,
    required this.decrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width - 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: increase,
                icon: const Icon(Icons.add),
              ),
              const Text(
                '5',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              IconButton(
                onPressed: decrease,
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
