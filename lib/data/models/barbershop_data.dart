import 'package:laborator_2/domain/models/barbershop.dart';

class BarbershopData {
  final List<Barbershop> nearestBarbershops;
  final List<Barbershop> mostRecommended;
  final List<Barbershop> list;

  BarbershopData({
    required this.nearestBarbershops,
    required this.mostRecommended,
    required this.list,
  });

  factory BarbershopData.fromJson(Map<String, dynamic> json) {
    return BarbershopData(
      nearestBarbershops: (json['nearest_barbershop'] as List<dynamic>)
          .map((item) => Barbershop.fromJson(item as Map<String, dynamic>))
          .toList(),
      mostRecommended: (json['most_recommended'] as List<dynamic>)
          .map((item) => Barbershop.fromJson(item as Map<String, dynamic>))
          .toList(),
      list: (json['list'] as List<dynamic>)
          .map((item) => Barbershop.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
