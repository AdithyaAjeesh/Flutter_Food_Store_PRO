import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/controller/auth_controller.dart';
import 'package:flutter_food_firebase_pro/view/startup_screens/login_screen.dart';
import 'package:provider/provider.dart';

import '../widget/auth_textfeild.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthController>(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Register Now',
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
              const SizedBox(height: 10),
              // Container(
              //   margin: const EdgeInsets.only(left: 20),
              //   child: const Text(
              //     'Enter the Email Address at which you can be contacted. No one will see this on your profile',
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              //   ),
              // ),
              const SizedBox(height: 20),
              AuthTextfeild(
                text: 'Enter your User Name',
                controller: provider.userNameController,
              ),
              AuthTextfeild(
                controller: provider.emailController,
                text: 'Enter your Email',
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
                  provider.signUpFunction(context);
                },
                child: const Text(
                  'Sign Up',
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
                    'Already a Member ?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color.fromARGB(255, 236, 175, 43),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                'OR',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 247, 199, 95),
                      offset: Offset(2, 3),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  provider.registerUsingOtherMethodPopUp(context);
                },
                child: const Text(
                  'Register using other Methods?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 236, 175, 43),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
