import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_food_firebase_pro/model/product_model.dart';
import 'package:image_picker/image_picker.dart';

class ProductService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<void> addProductFunction(
    String name,
    String discription,
    String price,
    String catagory,
    String image,
  ) async {
    try {
      DocumentReference docRef = firebaseFirestore.collection('products').doc();
      ProductModel productModel = ProductModel(
        id: docRef.id,
        name: name,
        price: price,
        discription: discription,
        catagory: catagory,
        image: image,
      );
      await docRef.set(productModel.toJson());
      log('Success');
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteProduct(String productUID) async {
    try {
      firebaseFirestore.collection('products').doc(productUID).delete();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  Future<String> uploadProductImage(XFile image) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final ref = firebaseStorage.ref().child('products/$fileName');
      final snapshot = await ref.putFile(File(image.path));
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }

  Future<void> addCarouselImagesFunction(String imageURL) async {
    try {
      DocumentReference documentReference =
          firebaseFirestore.collection('carouselImages').doc();
      await documentReference.set(
        {
          'imageUrl': imageURL,
        },
      );
      log('Success');
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  
}
