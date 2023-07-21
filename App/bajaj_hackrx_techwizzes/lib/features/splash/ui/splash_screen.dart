import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:bajaj_hackrx_techwizzes/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../auth/ui/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(milliseconds: 3150),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/flow.json'),
            FadeIn(
              duration: const Duration(milliseconds: 2000),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Text(
                  'Invest, Save, Repeat – Building a better future.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, color: AppColors.textColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
