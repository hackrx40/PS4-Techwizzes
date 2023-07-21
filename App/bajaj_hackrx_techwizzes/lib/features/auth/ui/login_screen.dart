import 'package:bajaj_hackrx_techwizzes/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Center(
              //   child: Image.asset(
              //     'assets/images/rupee.png',
              //     scale: 4.5,
              //   ),
              // ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Text(
                'Hii, Welcome Back! 👋',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    letterSpacing: 1),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Text(
                'Hello again, you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 15,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              const Text(
                'Email',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              customTextField(hintText: 'Enter your ID'),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Text(
                'Password',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              customTextField(
                hintText: 'Enter your password',
                suffixIcon: const Icon(
                  Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    maximumSize: const Size(double.maxFinite, 45),
                    minimumSize: const Size(double.maxFinite, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    letterSpacing: 0.5,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
