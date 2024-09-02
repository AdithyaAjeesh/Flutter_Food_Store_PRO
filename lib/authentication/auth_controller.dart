import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/authentication/auth_service.dart';
import 'package:flutter_food_firebase_pro/view/admin/admin_home_screen.dart';
import 'package:flutter_food_firebase_pro/view/admin/admin_login_screen.dart';
import 'package:flutter_food_firebase_pro/view/widget/bottom_nav_widget.dart';
import 'package:flutter_food_firebase_pro/view/product_screens/store_screen.dart';
import 'package:flutter_food_firebase_pro/view/startup_screens/login_screen.dart';
import 'package:flutter_food_firebase_pro/view/startup_screens/splash_screen.dart';

class AuthController extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  AuthService authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  Future<void> signUpFunction(BuildContext context) async {
    String userName = userNameController.text.trim();
    String password = passWordController.text.trim();
    String email = emailController.text.trim();
    if (userName.isNotEmpty && password.isNotEmpty && email.isNotEmpty) {
      authService.signupAuth(
        email,
        userName,
        password,
      );
      log('Created Account');

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const StoreScreen(),
      ));
    } else {
      log('empty');
    }
  }

  Future<void> loginFunction(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passWordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      authService.loginAuth(
        email,
        password,
      );
      log('Logged In');
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const BottomNavWidget(),
      ));
    } else {
      log('Empty');
    }
  }

  Future<void> loginAsAdminFunction(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passWordController.text.trim();
    if (email.isNotEmpty && password.isEmpty) {
      authService.loginAsAdminAuth(
        email,
        password,
      );
      log('Logged In');
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const AdminHomeScreen(),
      ));
    } else {
      log('Could not Login');
    }
  }

  Future<void> logoutFuntion(BuildContext context) async {
    try {
      firebaseAuth.signOut();
      log('Signed Out');
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      ));
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  Future<void> checkUserLoggedOrNot(BuildContext context) async {
    try {
      if (firebaseAuth.currentUser != null) {
        Timer(const Duration(seconds: 3), () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const BottomNavWidget(),
          ));
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
        });
      }
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  Future<void> registerUsingOtherMethodPopUp(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Other ways'),
          content: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 70,
                  width: 220,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent,
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 199, 95),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'G',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Google',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 70,
                  width: 220,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent,
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 199, 95),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(child: Icon(Icons.phone)),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Phone',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AdminLoginScreen(),
                  ));
                },
                child: Container(
                  height: 70,
                  width: 220,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent,
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 199, 95),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(Icons.person_2_outlined),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Admin',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
