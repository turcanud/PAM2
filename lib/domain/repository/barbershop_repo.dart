import 'package:laborator_2/domain/models/barbershop.dart';

abstract class BarbershopRepo {
  //get list of barbershops
  Future<List<Barbershop>> getNearestBarbershops();
  Future<List<Barbershop>> getMostRecommendedBarbershops();
  Future<List<Barbershop>> getListBarbershops();
}
