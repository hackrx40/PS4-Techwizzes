import 'package:flutter/material.dart';

Widget customTextField({
  TextEditingController? controller,
  required String hintText,
  //required double height,
  bool obscureText = false,
  TextInputType? keybordType,
  Widget? suffixIcon,
}) {
  return SizedBox(
    //height: height,
    child: TextFormField(
      controller: controller,
      keyboardType: keybordType,
      // style: const TextStyle(
      //   color: Colors.white,
      // ),
      obscureText: obscureText,
      cursorColor: Colors.grey[200],
      autofocus: false,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.grey[500], fontWeight: FontWeight.w400, fontSize: 14),
        filled: true,

        suffixIcon: suffixIcon,
        //focusColor: kGrey,
        fillColor: Colors.grey.shade100,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.all(15),
      ),
    ),
  );
}
