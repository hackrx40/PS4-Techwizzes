import 'package:flutter/material.dart';

class LogoTexts extends StatelessWidget {
  final double size;
  final Color color;
  final String texts;
  final bool isBold;
  final bool? isLetterSpacing;
  const LogoTexts({
    super.key,
    required this.size,
    required this.color,
    required this.texts,
    required this.isBold,
    this.isLetterSpacing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texts,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: size,
        letterSpacing: isLetterSpacing == false ? 0 : 1,
        fontWeight: isBold == true ? FontWeight.w600 : null,
      ),
    );
  }
}
