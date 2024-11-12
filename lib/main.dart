import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class Home extends StatelessWidget  {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(preferredSize: const Size.fromHeight(25.0), child: AppBar(
          backgroundColor: Colors.white,
        )),
        body: BlocBuilder<BarbershopBloc, BarbershopState>(
          builder: (context, state) {
            if(state is BarbershopLoading){
              return const Center(child: CircularProgressIndicator());
            } else if(state is BarbershopLoaded) {
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //--- Greeting-Profile
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
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
                      //--- Home Card
                      Image.asset(
                        'assets/images/home-card.png',
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                      const SizedBox(height: 24.0),
                      //--- Search Field
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
                      const SizedBox(height: 16.0),
                      //---Barbershop List
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: "Nearest Barbershop",
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF111827),
                          ),
                          const SizedBox(height: 16.0),
                          // --- Bar Place
                          ...state.nearestBarbershop.map((barber) =>
                              BarberInfoCard(
                                model: BarberInfoModel(
                                  image: 'assets/images/barb1.png',
                                  name: barber["name"],
                                  locationWithDistance: barber["location_with_distance"],
                                  reviewRate: barber["review_rate"],
                                ),
                              ),
                          ),
                          const SizedBox(height: 16.0),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      // (SeeAll) Btn
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF312651)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                      // Section Text
                      const CustomText(
                        text: "Most recommended",
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                      const SizedBox(height: 16.0),
                      //--- Home Card
                      Image.asset(
                        'assets/images/pict.png',
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                      const SizedBox(height: 12.0),
                      // Barber main card title
                      const CustomText(
                        text: "Master piece Barbershop - Haircut styling",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                      const SizedBox(height: 8.0),
                      //Location & Rating
                      const LocationDisplay(location: "Jogja Expo Centre (2 km)"),
                      const SizedBox(height: 8.0),
                      const RatingDisplay(rating: "5.0"),
                      const SizedBox(height: 8.0),
                      //That
                      const SizedBox(height: 8.0),
                      // --- Bar Place
                      ...state.mostRecommended.map((barber) =>
                          BarberInfoCard(
                            model: BarberInfoModel(
                              image: 'assets/images/barb1.png',
                              name: barber["name"],
                              locationWithDistance: barber["location_with_distance"],
                              reviewRate: barber["review_rate"],
                            ),
                          ),
                      ),
                      const SizedBox(height: 64.0),
                    ],
                  ),
                ),
              );
            }
          }
        ),
    );
  }
}

class BarberInfoModel {
  final String name;
  final String locationWithDistance;
  final String image;
  final double reviewRate;

  BarberInfoModel({
    required this.name,
    required this.locationWithDistance,
    required this.image,
    required this.reviewRate,
  });
}

class BarberInfoCard extends StatelessWidget {
  final BarberInfoModel model;
  const BarberInfoCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          model.image,
          width: 100.0,
          height: 100.0,
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: model.name,
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF111827),
              ),
              LocationDisplay(location: model.locationWithDistance),
              const SizedBox(height: 8.0),
              RatingDisplay(rating: model.reviewRate.toString()),
            ],
          ),
        ),
      ],
    );
  }
}

class LocationDisplay extends StatelessWidget {
  final String location;

  const LocationDisplay({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/location.png',
          width: 10.67,
          height: 13.33,
        ),
        const SizedBox(width: 4.0),
        CustomText(
          text: location,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: const Color(0xff8683A1),
        ),
      ],
    );
  }
}

class RatingDisplay extends StatelessWidget {
  final String rating;

  const RatingDisplay({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/star.png',
          width: 16.0,
          height: 16.0,
        ),
        const SizedBox(width: 4.0),
        Text(
          rating,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'PlusJakartaSans',
            color: Color(0xff8683A1),
          ),
        ),
      ],
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'PlusJakartaSans',
        color: color,
      ),
    );
  }
}