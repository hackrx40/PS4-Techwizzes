import 'package:flutter/material.dart';

Widget searchTextField({
  TextEditingController? controller,
  required String hintText,
  TextInputType? keybordType,
  required Widget prefixIcon,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: TextFormField(
      controller: controller,
      keyboardType: keybordType,
      cursorColor: Colors.grey[400],
      autofocus: false,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.grey[400], fontWeight: FontWeight.w400, fontSize: 14),
        filled: true,
        prefixIcon: prefixIcon,
        fillColor: Colors.grey.shade100,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            color: Colors.grey.shade100,
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
