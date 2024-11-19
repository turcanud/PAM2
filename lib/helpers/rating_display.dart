import 'package:flutter/material.dart';

class RatingDisplay extends StatelessWidget {
  final String rating;

  const RatingDisplay({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/star.png',
          width: 16.0,
          height: 16.0,
        ),
        const SizedBox(width: 4.0),
        Text(
          rating,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'PlusJakartaSans',
            color: Color(0xff8683A1),
          ),
        ),
      ],
    );
  }
}
