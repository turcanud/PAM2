import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'barbershop_event.dart';
import 'barbershop_state.dart';

class BarbershopBloc extends Bloc<BarbershopEvent, BarbershopState> {
  BarbershopBloc() : super(BarbershopLoading()) {
    on<LoadBarbershops>(_onLoadBarbershops);
  }

  Future<void> _onLoadBarbershops(
      LoadBarbershops event, Emitter<BarbershopState> emit) async {
    try {
      final String response = await rootBundle.loadString('assets/v2.json');
      final data = json.decode(response);
      final nearestBarbershop = data['nearest_barbershop'] as List;
      final mostRecommended = data['most_recommended'] as List;
      emit(BarbershopLoaded(nearestBarbershop, mostRecommended));
    } catch (e) {
      emit(BarbershopError());
    }
  }
}
