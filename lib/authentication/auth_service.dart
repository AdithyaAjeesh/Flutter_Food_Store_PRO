import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_food_firebase_pro/model/user_model.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> signupAuth(
    String email,
    String userName,
    String password,
  ) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        UserModel userModel = UserModel(
          userName: userName,
          email: email,
          passWord: password,
          location: '',
          cartItems: [],
          orderdItems: [],
          uid: user.uid,
          isAdmin: false,
        );
        firebaseFirestore
            .collection('users')
            .doc(user.uid)
            .set(userModel.toJson());
        log('Sucess');
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  Future<User?> loginAuth(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (firebaseAuth.currentUser!.emailVerified) {
        log('Sucess');
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
    return null;
  }

  Future<User?> loginAsAdminAuth(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (firebaseAuth.currentUser!.emailVerified) {
        log('Success');
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
