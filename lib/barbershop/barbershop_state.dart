import 'package:equatable/equatable.dart';

abstract class BarbershopState extends Equatable {
  @override
  List<Object> get props => [];
}

class BarbershopLoading extends BarbershopState {}

class BarbershopLoaded extends BarbershopState {
  final List nearestBarbershop;
  final List mostRecommended;

  BarbershopLoaded(this.nearestBarbershop, this.mostRecommended);

  @override
  List<Object> get props => [nearestBarbershop, mostRecommended];
}

class BarbershopError extends BarbershopState {}
