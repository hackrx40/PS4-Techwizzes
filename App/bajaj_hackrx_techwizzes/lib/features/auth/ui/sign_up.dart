import 'package:bajaj_hackrx_techwizzes/features/auth/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../home/ui/home_screen.dart';
import '../widgets/custom_textfield.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blue,
            height: 0.4.sh,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.backgroundColor),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.backgroundColor,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                const Text(
                  'Name',
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
                customTextField(hintText: 'Enter your name'),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Text(
                  'Clinet Code',
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
                customTextField(hintText: 'Enter your client code'),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Text(
                  'Pin',
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
                  hintText: 'Enter your pin',
                  suffixIcon: const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      maximumSize: const Size(double.maxFinite, 45),
                      minimumSize: const Size(double.maxFinite, 45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 15,
                      letterSpacing: 0.5,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
