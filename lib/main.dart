import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ViewModel> items = [];

  Future<void> readJSON() async {
    final String response = await rootBundle.loadString('assets/v2.json');
    final data = await json.decode(response);
  }

  @override
  void initState() {
    super.initState();
    readJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(preferredSize: const Size.fromHeight(25.0), child: AppBar(
        backgroundColor: Colors.white,
      )),
      body: SingleChildScrollView(
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
                children: List<Widget>.generate(10, (index) =>
                    BarberInfoCard(
                      model: BarberInfoModel(
                        imageUrl: 'assets/images/barb1.png',
                        title: "Alana Barbershop - Haircut massage & Spa",
                        location: "Banguntapan (5 km)",
                        rating: "4.5",
                      ),
                    ),
                ).toList(),
                // children: [
                //   CustomText(
                //     text: "Nearest Barbershop",
                //     fontSize: 18.0,
                //     fontWeight: FontWeight.w700,
                //     color: Color(0xFF111827),
                //   ),
                //   SizedBox(height: 16.0),
                //   // --- Bar Place
                //   BarberInfoCard(
                //     model: BarberInfoModel(
                //       imageUrl: 'assets/images/barb1.png',
                //       title: "Alana Barbershop - Haircut massage & Spa",
                //       location: "Banguntapan (5 km)",
                //       rating: "4.5",
                //     ),
                //   ),
                //   SizedBox(height: 16.0),
                //   // --- Bar Place
                //   BarberInfoCard(
                //     model: BarberInfoModel(
                //       imageUrl: 'assets/images/barb2.png',
                //       title: "Hercha Barbershop - Haircut & Styling",
                //       location: "Jalan Kaliurang (8 km)",
                //       rating: "5.0",
                //     )
                //   ),
                //   SizedBox(height: 16.0),
                //   // --- Bar Place
                //   BarberInfoCard(
                //     model: BarberInfoModel(
                //       imageUrl: 'assets/images/barb3.png',
                //       title: "Barberking - Haircut styling & massage",
                //       location: "Jogja Expo Centre (12 km)",
                //       rating: "4.5",
                //     ),
                //   ),
                //
                // ],
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
                          color: const Color(0xFF312651),
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
              BarberInfoCard(
                model: BarberInfoModel(
                imageUrl: 'assets/images/barb4.png',
                title: "Varcity Barbershop Jogja ex The Varcher",
                location: "Condongcatur (10 km)",
                rating: "4.5",
                )
              ),
              const SizedBox(height: 16.0),
              // --- Bar Place
              BarberInfoCard(
                model: BarberInfoModel(
                  imageUrl: 'assets/images/barb5.png',
                  title: "Twinsky Monkey Barber & Men Stuff",
                  location: "Jl Taman Siswa (8 km)",
                  rating: "5.0",
                ),
              ),
              const SizedBox(height: 16.0),
              // --- Bar Place
              BarberInfoCard(
                model: BarberInfoModel(
                  imageUrl: 'assets/images/barb6.png',
                  title: "Barberman - Haircut styling & massage",
                  location: "J-Walk Centre  (17 km)",
                  rating: "4.5",
                ),
              ),
              const SizedBox(height: 64.0),
            ],
          ),
        ),
      )
    );
  }
}

abstract class ViewModel {}

class BarberInfoModel extends ViewModel {
  final String imageUrl;
  final String title;
  final String location;
  final String rating;

  BarberInfoModel({required this.imageUrl, required this.title, required this.location, required this.rating});
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
          model.imageUrl,
          width: 100.0,
          height: 100.0,
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: model.title,
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF111827),
              ),
              LocationDisplay(location: model.location),
              const SizedBox(height: 8.0),
              RatingDisplay(rating: model.rating),
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
    Key? key,
    required this.location,
  }) : super(key: key);

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
    Key? key,
    required this.rating,
  }) : super(key: key);

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
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  }) : super(key: key);

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