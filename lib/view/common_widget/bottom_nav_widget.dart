import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/controller/bottom_nav_controller.dart';
import 'package:provider/provider.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavController>(context);
    return Scaffold(
      body: provider.screens[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 247, 199, 95),
        unselectedIconTheme: const IconThemeData(color: Colors.black),
        showUnselectedLabels: false,
        currentIndex: provider.currentIndex,
        onTap: (value) {
          provider.navigateToNextScreen(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
