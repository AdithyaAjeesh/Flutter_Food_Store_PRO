import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/controller/tab_bar_controller.dart';
import 'package:flutter_food_firebase_pro/view/product_screens/all_products.dart';
import 'package:flutter_food_firebase_pro/view/product_screens/burger/burger_screens.dart';
import 'package:flutter_food_firebase_pro/view/product_screens/drinks/drinks_screen.dart';
import 'package:flutter_food_firebase_pro/view/product_screens/pizza/pizza_screen.dart';
import 'package:flutter_food_firebase_pro/view/common_widget/custom_drawer_widget.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<StoreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<TabBarController>(context, listen: false);
    _tabController = TabController(
        length: 4, vsync: this, initialIndex: provider.currentIndex);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        provider.setIndex(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TabBarController>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 25,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
        bottom: TabBar(
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          controller: _tabController,
          onTap: (value) {
            provider.setIndex(value);
          },
          tabs: const [
            Tab(
              child: Text(
                'All',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Burger',
              ),
            ),
            Tab(
              child: Text(
                'Pizza',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Drinks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AllProducts(),
          BurgerScreens(),
          PizzaScreen(),
          DrinksScreen(),
        ],
      ),
      drawer: const CustomDrawerWidget(),
    );
  }
}
