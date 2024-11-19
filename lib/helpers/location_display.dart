import 'package:flutter/material.dart';
import 'package:laborator_2/helpers/custom_text.dart';

class LocationDisplay extends StatelessWidget {
  final String location;

  const LocationDisplay({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/location.png',
          width: 10.67,
          height: 13.33,
        ),
        const SizedBox(width: 4.0),
        CustomText(
          text: location,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: const Color(0xff8683A1),
        ),
      ],
    );
  }
}
