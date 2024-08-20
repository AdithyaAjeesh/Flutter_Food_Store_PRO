import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/controller/tab_bar_controller.dart';
import 'package:flutter_food_firebase_pro/view/admin/add_product_screen.dart';
import 'package:flutter_food_firebase_pro/view/admin/admin_modify_product_screen.dart';
import 'package:flutter_food_firebase_pro/view/admin/other_feature_screen.dart';
import 'package:provider/provider.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<TabBarController>(context, listen: false);
    _tabController = TabController(
        length: 3, vsync: this, initialIndex: provider.currentIndex);
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
      appBar: AppBar(
        title: const Text(
          'Admin',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
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
        bottom: TabBar(
          controller: _tabController,
          onTap: (value) {
            provider.setIndex(value);
          },
          tabs: const [
            Tab(
              child: Text(
                'Add Product',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Modify Product',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Other Features',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: TabBarView(
          controller: _tabController,
          children: const [
            AddProductScreen(),
            AdminModifyProductScreen(),
            OtherFeatureScreen(),
          ],
        ),
      ),
    );
  }
}
