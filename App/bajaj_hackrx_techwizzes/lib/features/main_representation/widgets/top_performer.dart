import 'package:flutter/material.dart';

import '../../watchlist/widgets/text_logo.dart';

class TopPerformers extends StatelessWidget {
  const TopPerformers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nasdaq',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey[900],
                  ),
                ),
                const Text(
                  '35,950.76',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LogoTexts(
                    size: 14,
                    color: const Color(0XFF2ECB7F),
                    texts: '+196.67',
                    isBold: true),
                const Icon(
                  Icons.arrow_upward_rounded,
                  color: Color(0XFF2ECB7F),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
