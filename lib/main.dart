import 'package:flutter/material.dart';
import 'package:laborator_2/data/repository/db_barbershop_repo.dart';
// import 'package:laborator_2/domain/models/barbershop.dart';
import 'package:laborator_2/domain/repository/barbershop_repo.dart';
import 'package:laborator_2/presentation/barbershop_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Instantiate the repository.
  final repo = DbBarbershopRepo();

  // Load barbershops from the JSON file.
  // List<Barbershop> barbershops = await repo.getListBarbershops();

  // Run a simple Flutter app to see results in the UI.
  runApp(MyApp(
    barbershopRepo: repo,
  ));
}

class MyApp extends StatelessWidget {
  final BarbershopRepo barbershopRepo;

  const MyApp({super.key, required this.barbershopRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BarbershopPage(barbershopRepo: barbershopRepo),
    );
  }
}
