import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laborator_2/helpers/custom_text.dart';
import 'package:laborator_2/models/barber_info_card.dart';
import 'package:laborator_2/models/barber_info_model.dart';

import 'barbershop/barbershop_bloc.dart';
import 'barbershop/barbershop_event.dart';
import 'barbershop/barbershop_state.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BlocProvider(
      create: (context) => BarbershopBloc()..add(LoadBarbershops()),
      child: const Home(),
    ),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(25.0),
          child: AppBar(
            backgroundColor: Colors.white,
          )),
      body: BlocBuilder<BarbershopBloc, BarbershopState>(
          builder: (context, state) {
        if (state is BarbershopLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BarbershopLoaded) {
          final nearestBarbershops = state.nearestBarbershop;
          final mostRecommended = state.mostRecommended;

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: nearestBarbershops.length + mostRecommended.length + 4,
            itemBuilder: (context, index) {
              // --- Header Content ---
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/location.png',
                                  width: 10.67,
                                  height: 13.33,
                                ),
                                const SizedBox(width: 4.0),
                                const CustomText(
                                  text: "Yogyakarta",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff6B7280),
                                ),
                              ],
                            ),
                            const CustomText(
                              text: "Joe Samanta",
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff111827),
                            ),
                          ],
                        ),
                        ClipOval(
                          child: Image.asset(
                            'assets/images/profile.png',
                            width: 42.0,
                            height: 42.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18.0),
                    Image.asset(
                      'assets/images/home-card.png',
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search barber’s, haircut service',
                              hintStyle: const TextStyle(
                                color: Color(0xFF8683A1),
                                fontFamily: 'PlusJakartaSans',
                              ),
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFEBF0F5),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF3A2A8B),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.tune, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    const CustomText(
                      text: "Nearest Barbershop",
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                );
              }

              // --- Nearest Barbershops ---
              if (index > 0 && index <= nearestBarbershops.length) {
                final barber = nearestBarbershops[index - 1];
                return BarberInfoCard(
                  model: BarberInfoModel(
                    image: 'assets/images/barb1.png',
                    name: barber["name"],
                    locationWithDistance: barber["location_with_distance"],
                    reviewRate: barber["review_rate"],
                  ),
                );
              }

              // --- Spacer for "See All" Button ---
              if (index == nearestBarbershops.length + 1) {
                return Column(
                  children: [
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF312651)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                text: 'See All',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF312651),
                              ),
                              SizedBox(width: 8.0),
                              Icon(
                                Icons.open_in_new,
                                size: 18.0,
                                color: Color(0xFF312651),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    const CustomText(
                      text: "Most Recommended",
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                );
              }

              // --- Most Recommended Barbershops ---
              if (index > nearestBarbershops.length + 2 &&
                  index <=
                      nearestBarbershops.length + mostRecommended.length + 2) {
                final barber =
                    mostRecommended[index - nearestBarbershops.length - 3];
                return BarberInfoCard(
                  model: BarberInfoModel(
                    image: 'assets/images/barb1.png',
                    name: barber["name"],
                    locationWithDistance: barber["location_with_distance"],
                    reviewRate: barber["review_rate"],
                  ),
                );
              }

              // --- Spacer for Bottom Padding ---
              return const SizedBox(height: 64.0);
            },
          );
        } else if (state is BarbershopError) {
          return const Center(child: Text("Error loading barbershops."));
        }

        return const SizedBox.shrink();
      }),
    );
  }
}
