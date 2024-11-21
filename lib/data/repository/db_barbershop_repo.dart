import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:laborator_2/domain/models/barbershop.dart';
import 'package:laborator_2/domain/repository/barbershop_repo.dart';

class DbBarbershopRepo implements BarbershopRepo {
  Future<List<Barbershop>> _fetchBarbershops(String key) async {
    final String response = await rootBundle.loadString('assets/v2.json');
    final Map<String, dynamic> jsonData = json.decode(response);
    final List<dynamic> data = jsonData[key] ?? [];
    return data
        .map((item) => Barbershop.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<Barbershop>> getNearestBarbershops() {
    return _fetchBarbershops('nearest_barbershop');
  }

  @override
  Future<List<Barbershop>> getMostRecommendedBarbershops() {
    return _fetchBarbershops('most_recommended');
  }

  @override
  Future<List<Barbershop>> getListBarbershops() {
    return _fetchBarbershops('list');
  }
}
