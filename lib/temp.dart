/*
import 'dart:math';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _minuteController;
  late final AnimationController _hourController;
  late final AnimationController _fadeUpController;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Toggle between real time and test time
    final bool useTestTime = false;
    final DateTime now = useTestTime
        ? DateTime(2025, 1, 1, 10, 15, 0) // Simulated time
        : DateTime.now();

    final double currentMinute = now.minute + now.second / 60;
    final double currentHour = now.hour % 12 + currentMinute / 60;

    final double normalizedMinute = currentMinute / 60;
    final double normalizedHour = currentHour / 12;

    _minuteController = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    )..value = normalizedMinute
     ..repeat();

    _hourController = AnimationController(
      duration: const Duration(seconds: 720), // Simulate 12 hours in 12 minutes
      vsync: this,
    )..value = normalizedHour
     ..repeat();

    _fadeUpController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.6),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _fadeUpController,
      curve: Curves.easeOut,
    ));

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeUpController, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _minuteController.dispose();
    _hourController.dispose();
    _fadeUpController.dispose();
    super.dispose();
  }

  Widget buildClockHand({
    required double height,
    required double width,
    required Color color,
    required double angle,
  }) {
    return Transform.rotate(
      angle: angle,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }

  Widget buildClockFace() {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
        boxShadow: const [
          BoxShadow(
            color: Colors.green,
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Hour hand
          AnimatedBuilder(
            animation: _hourController,
            builder: (_, __) {
              return Transform.rotate(
                angle: _hourController.value * 2 * pi,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    children: [
                      Container(
                        height: 90,
                        width: 4,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: 30,
                          width: 4,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          // Minute hand
          AnimatedBuilder(
            animation: _minuteController,
            builder: (_, __) {
              return buildClockHand(
                height: 100,
                width: 2,
                color: Colors.redAccent,
                angle: _minuteController.value * 2 * pi,
              );
            },
          ),
          // Center pin
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextSection() {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Column(
          children: const [
            Text(
              "ClockiTrackr",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.4,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Time • Work • Accountability",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
                letterSpacing: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF311B92),
              Color(0xFF512DA8),
              Color(0xFF9575CD),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildClockFace(),
              const SizedBox(height: 50),
              buildTextSection(),
            ],
          ),
        ),
      ),
    );
  }
}

 */
