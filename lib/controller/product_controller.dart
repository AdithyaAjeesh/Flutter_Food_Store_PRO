import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/model/product_model.dart';
import 'package:flutter_food_firebase_pro/service/product_service.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDiscriptionController = TextEditingController();
  ProductService productService = ProductService();
  String selectedValue = 'Burger';
  final List<String> options = ['Burger', 'Pizza', 'Drink'];

  void dropdownonChange(newValue) {
    selectedValue = newValue;
    notifyListeners();
  }

  Future<void> addProductAccordingly() async {
    String name = productNameController.text.trim();
    String price = productPriceController.text.trim();
    String discription = productDiscriptionController.text.trim();
    String catagory = selectedValue;
    try {
      String imageUrl = await productService.uploadProductImage(selectedImage!);
      if (name.isNotEmpty &&
          price.isNotEmpty &&
          discription.isNotEmpty &&
          imageUrl.isNotEmpty) {
        productService.addProductFunction(
          name,
          discription,
          price,
          catagory,
          imageUrl,
        );
      } else {
        log('Empty');
      }
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ProductModel>> fetchAllProductsOnce() async {
    try {
      QuerySnapshot querySnapshot =
          await firebaseFirestore.collection('products').get();
      return querySnapshot.docs.map(
        (doc) {
          return ProductModel.fromJson(doc.data() as Map<String, dynamic>);
        },
      ).toList();
    } catch (e) {
      log('Error fetching products: $e');
      throw Exception('Error fetching products: $e');
    }
  }

  Stream<List<ProductModel>> getAllProductsAccordingly(String catagory) {
    return firebaseFirestore
        .collection('products')
        .where('catagory', isEqualTo: catagory)
        .snapshots()
        .map(
      (QuerySnapshot querySnapshot) {
        return querySnapshot.docs.map((doc) {
          return ProductModel.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
      },
    );
  }

  Stream<List<ProductModel>> getAllProducts() {
    return firebaseFirestore.collection('products').snapshots().map(
      (QuerySnapshot querySnapshot) {
        return querySnapshot.docs.map((doc) {
          return ProductModel.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
      },
    );
  }

  XFile? selectedImage;
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    selectedImage = image;
    notifyListeners();
  }

  Future<void> deleteProduct(String productUID) async {
    productService.deleteProduct(productUID);
  }

  Future<void> addCarouselImages() async {
    String imageUrl = await productService.uploadProductImage(selectedImage!);
    productService.addCarouselImagesFunction(imageUrl);
  }

  Stream<List<String>> getCarouselImages() {
    return firebaseFirestore
        .collection('carouselImages')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc['imageUrl'] as String;
      }).toList();
    });
  }

  Future<void> addProductToCart(String productId) async {
    try {
      DocumentReference userDoc = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid);
      await userDoc.update({
        'cartItems': FieldValue.arrayUnion([productId]),
      });
      log('Product added to cart successfully');
    } on FirebaseException catch (e) {
      throw Exception('Failed to add product to cart: ${e.message}');
    }
  }

  Future<void> removeProductFromCart(String productId) async {
    try {
      DocumentReference userDoc = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid);
      await userDoc.update({
        'cartItems': FieldValue.arrayRemove([productId]),
      });
      log('Product removed from cart successfully');
    } on FirebaseException catch (e) {
      throw Exception('Failed to remove product from cart: ${e.message}');
    }
  }

  Future<void> addProductToOrders() async {}

  Stream<List<ProductModel>> getCartProductsStream() {
    final userId = firebaseAuth.currentUser?.uid;
    if (userId == null) throw Exception('No user signed in.');

    return firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .asyncMap(
      (userDoc) async {
        final cartItems = List<String>.from(userDoc['cartItems'] ?? []);
        return Future.wait(
          cartItems.map(
            (id) async {
              final productDoc =
                  await firebaseFirestore.collection('products').doc(id).get();
              return ProductModel.fromJson(productDoc.data()!);
            },
          ),
        );
      },
    );
  }
}
