import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laborator_2/domain/models/barbershop.dart';
import 'package:laborator_2/presentation/barbershop_cubit.dart';

class BarbershopView extends StatelessWidget {
  const BarbershopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Barbershops')),
        body: BlocBuilder<BarbershopCubit, List<Barbershop>>(
            builder: (context, barbershops) {
          return ListView.builder(
            itemCount: barbershops.length,
            itemBuilder: (context, index) {
              final barbershop = barbershops[index];
              return ListTile(
                leading: Image.asset(
                  'assets/images/location.png',
                  width: 10.67,
                  height: 13.33,
                ),
                title: Text(barbershop.name),
                subtitle: Text(
                  '${barbershop.locationWithDistance} - Rating: ${barbershop.reviewRate}',
                ),
              );
            },
          );
        }));
  }
}
