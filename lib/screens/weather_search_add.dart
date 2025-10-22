import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

class WeatherSearchAdd extends StatelessWidget {
  const WeatherSearchAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const _SearchAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF2E335A),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -150,
              child: Container(
                width: 352,
                height: 352,
                // --- ⛔️ تم إزالة 'const' من هنا ---
                decoration: BoxDecoration( 
                  shape: BoxShape.circle,
                  gradient: AngularGradient(
                    colors: [
                      Color(0xFF612FA8),
                      Color.fromRGBO(97, 47, 168, 0),
                      Color(0xFF612FA8),
                      Color.fromRGBO(97, 47, 168, 0),
                    ],
                    stops: [0.13, 0.35, 0.62, 0.74],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -150,
              right: -150,
              child: Container(
                width: 365,
                height: 365,
                // --- ⛔️ وتم إزالة 'const' من هنا ---
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AngularGradient(
                    colors: [
                      Color(0xFF612FA8),
                      Color.fromRGBO(97, 47, 168, 0),
                      Color(0xFF612FA8),
                      Color.fromRGBO(97, 47, 168, 0),
                    ],
                    stops: [0.13, 0.35, 0.62, 0.74],
                  ),
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            ListView(
              padding: EdgeInsets.fromLTRB(
                  20.0,
                  MediaQuery.of(context).padding.top + 130.0,
                  20.0,
                  MediaQuery.of(context).padding.bottom + 20.0),
              children: [
                _WeatherCard(
                  onTap: () => context.go('/weather_home'),
                  temperature: '19°',
                  highTemp: '24°',
                  lowTemp: '18°',
                  location: 'Montreal, Canada',
                  condition: 'Mid Rain',
                  imageAsset: 'assets/images/I1_538_2_341_2_90.png',
                ),
                const SizedBox(height: 20),
                _WeatherCard(
                  onTap: () => context.go('/weather_home'),
                  temperature: '20°',
                  highTemp: '21°',
                  lowTemp: '19°',
                  location: 'Toronto, Canada',
                  condition: 'Fast Wind',
                  imageAsset: 'assets/images/I1_539_2_341_2_88.png',
                ),
                const SizedBox(height: 20),
                _WeatherCard(
                  onTap: () => context.go('/weather_home'),
                  temperature: '13°',
                  highTemp: '16°',
                  lowTemp: '8°',
                  location: 'Tokyo, Japan',
                  condition: 'Showers',
                  imageAsset: 'assets/images/I1_540_2_341_2_92.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _SearchAppBar();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          color: Colors.white.withOpacity(0.05),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.chevron_left,
                                color: Colors.white, size: 28),
                            onPressed: () => context.go('/weather_home'),
                          ),
                          Text(
                            'Weather',
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_horiz,
                            color: Colors.white, size: 28),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    style: GoogleFonts.poppins(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search for a city or airport',
                      hintStyle: GoogleFonts.poppins(
                        color: const Color.fromRGBO(235, 235, 245, 0.6),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromRGBO(235, 235, 245, 0.6),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(46, 51, 90, 0.26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 8.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130);
}

class _WeatherCard extends StatelessWidget {
  final String temperature;
  final String highTemp;
  final String lowTemp;
  final String location;
  final String condition;
  final String imageAsset;
  final VoidCallback onTap;

  const _WeatherCard({
    required this.temperature,
    required this.highTemp,
    required this.lowTemp,
    required this.location,
    required this.condition,
    required this.imageAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 342 / 184,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
              colors: [Color(0xFF5936B4), Color(0xFF362A84)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Stack(
              children: [
                Positioned(
                  top: -20,
                  right: 0,
                  child: Image.asset(
                    imageAsset,
                    width: 160,
                    height: 160,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            temperature,
                            style: GoogleFonts.poppins(
                              fontSize: 64,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        'H:$highTemp L:$lowTemp',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(235, 235, 245, 0.6),
                        ),
                      ),
                      Text(
                        location,
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Text(
                    condition,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
