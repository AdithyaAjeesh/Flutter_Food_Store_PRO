import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/view/cart_screen.dart';
import 'package:flutter_food_firebase_pro/view/home_screen.dart';
import 'package:flutter_food_firebase_pro/view/product_screens/store_screen.dart';

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
