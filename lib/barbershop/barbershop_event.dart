import 'package:equatable/equatable.dart';

abstract class BarbershopEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadBarbershops extends BarbershopEvent {}
