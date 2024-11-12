import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'barbershop_event.dart';
import 'barbershop_state.dart';

class BarbershopBloc extends Bloc<BarbershopEvent, BarbershopState> {
  BarbershopBloc() : super(BarbershopLoading());

  Stream<BarbershopState> mapEventToState(BarbershopEvent event) async* {
    if (event is LoadBarbershops) {
      yield BarbershopLoading();
      try {
        final String response = await rootBundle.loadString('assets/v2.json');
        final data = json.decode(response);
        final nearestBarbershop = data['nearest_barbershop'] as List;
        final mostRecommended = data['most_recommended'] as List;

        yield BarbershopLoaded(nearestBarbershop, mostRecommended);
      } catch (_) {
        yield BarbershopError();
      }
    }
  }
}
