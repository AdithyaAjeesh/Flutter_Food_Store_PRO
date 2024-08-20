import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/controller/auth_controller.dart';
import 'package:flutter_food_firebase_pro/view/admin/admin_signup_screen.dart';
import 'package:flutter_food_firebase_pro/view/widget/auth_textfeild.dart';
import 'package:provider/provider.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthController>(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Admin',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 247, 199, 95),
                      offset: Offset(2, 3),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              AuthTextfeild(
                text: 'Enter your Email',
                controller: provider.emailController,
              ),
              AuthTextfeild(
                text: 'Enter your Password',
                controller: provider.passWordController,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  backgroundColor: const Color.fromARGB(255, 247, 199, 95),
                  fixedSize: const Size(330, 50),
                  side: const BorderSide(),
                ),
                onPressed: () {
                  provider.loginAsAdminFunction(context);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a Member Already ?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const AdminSignupScreen(),
                      ));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color.fromARGB(255, 236, 175, 43),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
