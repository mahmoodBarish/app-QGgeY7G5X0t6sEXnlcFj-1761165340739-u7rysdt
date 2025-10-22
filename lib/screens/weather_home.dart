import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            _buildBackground(),
            _buildContent(),
            _buildBottomNavBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.89, -0.99),
          end: Alignment(0.85, 0.96),
          colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
        ),
      ),
      child: Image.asset(
        'assets/images/I1_142_218_4440.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }

  Widget _buildContent() {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/I1_144_218_4436.png',
              fit: BoxFit.cover,
              width: mediaQuery.size.width,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 1),
                _buildWeatherInfo(),
                const Spacer(flex: 2),
                _buildBottomModal(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Montreal',
          // --- 🌟 تم التعديل هنا ---
          style: GoogleFonts.poppins(
            fontSize: 34,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 0.37,
          ),
        ),
        Text(
          '19°',
          // --- 🌟 تم التعديل هنا ---
          style: GoogleFonts.poppins(
            fontSize: 96,
            fontWeight: FontWeight.w200,
            color: Colors.white,
            letterSpacing: 0.37,
          ),
        ),
        Text(
          'Mostly Clear',
          // --- 🌟 تم التعديل هنا ---
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0x99EBEBF5),
            letterSpacing: 0.38,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'H:24°   L:18°',
          // --- 🌟 تم التعديل هنا ---
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 0.38,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomModal() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(44.0)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
        child: Container(
          height: 325,
          decoration: BoxDecoration(
            color: const Color(0xFF2E335A).withOpacity(0.26),
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(44.0)),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              _buildForecastTabs(),
              const Divider(
                color: Color(0x4DFFFFFF),
                height: 1,
                thickness: 0.5,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildHourlyForecast(),
                    _buildWeeklyForecast(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForecastTabs() {
    return SizedBox(
      height: 50,
      child: TabBar(
        controller: _tabController,
        labelColor: Colors.white,
        unselectedLabelColor: const Color(0x99EBEBF5),
        indicatorColor: Colors.white,
        indicatorWeight: 3,
        indicatorSize: TabBarIndicatorSize.label,
        // --- 🌟 تم التعديل هنا ---
        labelStyle: GoogleFonts.poppins(
            fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: -0.5),
        // --- 🌟 تم التعديل هنا ---
        unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: -0.5),
        tabs: const [
          Tab(text: 'Hourly Forecast'),
          Tab(text: 'Weekly Forecast'),
        ],
      ),
    );
  }

  Widget _buildHourlyForecast() {
    final List<Map<String, dynamic>> hourlyData = [
      {'time': '12 AM', 'icon': 'assets/images/I1_155_229_4455_229_4451_217_4578.png', 'temp': '19°', 'isActive': false},
      {'time': 'Now', 'icon': 'assets/images/I1_156_232_4582_229_4451_217_4578.png', 'temp': '19°', 'isActive': true},
      {'time': '2 AM', 'icon': 'assets/images/I1_157_229_4491_229_4451_229_4526_217_4571.png', 'temp': '18°', 'isActive': false},
      {'time': '3 AM', 'icon': 'assets/images/I1_158_229_4499_229_4451_217_4578.png', 'temp': '19°', 'isActive': false},
      {'time': '4 AM', 'icon': 'assets/images/I1_159_229_4507_229_4451_217_4578.png', 'temp': '19°', 'isActive': false},
      {'time': '5 AM', 'icon': 'assets/images/I1_160_229_4515_229_4451_217_4578.png', 'temp': '19°', 'isActive': false},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: hourlyData.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          var data = hourlyData[index];
          return _ForecastCard(
            time: data['time'],
            iconPath: data['icon'],
            temperature: data['temp'],
            isActive: data['isActive'],
          );
        },
      ),
    );
  }

  Widget _buildWeeklyForecast() {
    final List<Map<String, dynamic>> weeklyData = [
      {'time': 'MON', 'icon': 'assets/images/I1_165_229_4455_229_4451_2_105_2_94.png', 'temp': '20°', 'isActive': false},
      {'time': 'TUE', 'icon': 'assets/images/I1_166_232_4582_229_4451_2_105_2_94.png', 'temp': '21°', 'isActive': true},
      {'time': 'WED', 'icon': 'assets/images/I1_167_229_4491_229_4451_229_4526_2_103_2_92.png', 'temp': '18°', 'isActive': false},
      {'time': 'THU', 'icon': 'assets/images/I1_168_229_4499_229_4451_2_103_2_92.png', 'temp': '20°', 'isActive': false},
      {'time': 'FRI', 'icon': 'assets/images/I1_169_229_4507_229_4451_2_105_2_94.png', 'temp': '22°', 'isActive': false},
      {'time': 'SAT', 'icon': 'assets/images/I1_170_229_4515_229_4451_2_103_2_92.png', 'temp': '24°', 'isActive': false},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: weeklyData.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          var data = weeklyData[index];
          return _ForecastCard(
            time: data['time'],
            iconPath: data['icon'],
            temperature: data['temp'],
            isActive: data['isActive'],
          );
        },
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
          child: Container(
            height: 88,
            decoration: BoxDecoration(
              color: const Color(0x422E335A).withOpacity(0.26),
              border: Border(
                top: BorderSide(
                  color: const Color(0xFF485196).withOpacity(0.5),
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.location_on, color: Colors.white, size: 28),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 64,
                  height: 64,
                  child: FloatingActionButton(
                    onPressed: () => context.go('/weather_search_add'),
                    backgroundColor: const Color(0xFFE5E5EA),
                    elevation: 10,
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.add,
                      size: 36,
                      color: Color(0xFF48319D),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.list, color: Colors.white, size: 28),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ForecastCard extends StatelessWidget {
  final String time;
  final String iconPath;
  final String temperature;
  final bool isActive;

  const _ForecastCard({
    required this.time,
    required this.iconPath,
    required this.temperature,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF48319D) : const Color(0x3348319D),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withOpacity(isActive ? 0.5 : 0.2),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 10,
            offset: Offset(5, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            time,
            // --- 🌟 تم التعديل هنا ---
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Image.asset(iconPath, width: 32, height: 32),
          Text(
            temperature,
            // --- 🌟 تم التعديل هنا ---
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
