import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/cart/cart_screen.dart';
import 'package:flutter_food_firebase_pro/home/home_screen.dart';
import 'package:flutter_food_firebase_pro/product_screens/store_screen.dart';

class BottomNavController extends ChangeNotifier {
  int currentIndex = 0;
  List screens = [
    const HomeScreen(),
    const StoreScreen(),
    const CartScreen(),
  ];

  void navigateToNextScreen(index) {
    currentIndex = index;
    notifyListeners();
  }
}
