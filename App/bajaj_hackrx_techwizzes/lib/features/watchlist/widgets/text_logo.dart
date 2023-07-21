import 'package:flutter/material.dart';

class LogoTexts extends StatelessWidget {
  final double size;
  final Color color;
  final String texts;
  final bool isBold;
  LogoTexts(
      {required this.size,
      required this.color,
      required this.texts,
      required this.isBold});

  @override
  Widget build(BuildContext context) {
    return Text(
      texts,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: isBold == true ? FontWeight.w600 : null,
      ),
    );
  }
}
