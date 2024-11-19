import 'package:flutter/material.dart';
import 'package:laborator_2/helpers/custom_text.dart';
import 'package:laborator_2/helpers/location_display.dart';
import 'package:laborator_2/helpers/rating_display.dart';
import 'package:laborator_2/models/barber_info_model.dart';

class BarberInfoCard extends StatelessWidget {
  final BarberInfoModel model;
  const BarberInfoCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          model.image,
          width: 100.0,
          height: 100.0,
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: model.name,
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF111827),
              ),
              LocationDisplay(location: model.locationWithDistance),
              const SizedBox(height: 8.0),
              RatingDisplay(rating: model.reviewRate.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
