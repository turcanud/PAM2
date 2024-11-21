import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laborator_2/domain/repository/barbershop_repo.dart';
import 'package:laborator_2/presentation/barbershop_cubit.dart';
import 'package:laborator_2/presentation/barbershop_view.dart';

class BarbershopPage extends StatelessWidget {
  final BarbershopRepo barbershopRepo;

  const BarbershopPage({super.key, required this.barbershopRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BarbershopCubit(barbershopRepo)..loadBarbershops(),
      child: const BarbershopView(),
    );
  }
}
