import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laborator_2/domain/models/barbershop.dart';
import 'package:laborator_2/domain/repository/barbershop_repo.dart';

class BarbershopCubit extends Cubit<List<Barbershop>> {
  final BarbershopRepo barbershoptodoRepo;

  BarbershopCubit(this.barbershoptodoRepo) : super([]);

  Future<void> loadBarbershops() async {
    try {
      final barbershops = await barbershoptodoRepo.getListBarbershops();
      emit(barbershops);
    } catch (e) {
      emit([]);
    }
  }
}
