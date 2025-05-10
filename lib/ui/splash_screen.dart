import 'dart:async';
import 'dart:math';
import 'package:clocki_tracker/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _minuteController;
  late AnimationController _hourController;
  late AnimationController _fadeUpController;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  double? initialMinuteAngle;
  double? initialHourAngle;
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    double currentMinute = now.minute + now.second / 60;
    double currentHour =
        now.hour % 12 + currentMinute / 60; // Using 12-hour format
    double normalizedMinute = currentMinute / 60;
    double normalizedHour = currentHour / 12;

    // Calculate the initial angles for minute and hour hands
    initialMinuteAngle = (currentMinute / 60) * 2 * pi;
    initialHourAngle = (currentHour / 12) * 2 * pi;

    // Set the starting value AFTER starting the repeat
    _minuteController = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    );
    _minuteController.value = normalizedMinute;
    _minuteController.repeat();

    _hourController = AnimationController(
      duration: Duration(seconds: 40),
      vsync: this,
    );
    _hourController.value = normalizedHour;
    _hourController.repeat();
    _fadeUpController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0.6),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _fadeUpController,
      curve: Curves.easeOut,
    ));

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeUpController, curve: Curves.easeIn),
    );
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF311B92), // Dark indigo (start)
              Color(0xFF512DA8), // Medium indigo
              Color(0xFF9575CD), // Light indigo/lavender end
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Clock Face
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  boxShadow: [
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
                    // Hour Hand
                    AnimatedBuilder(
                      animation: _hourController,
                      builder: (_, child) {
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
                    // Minute Hand
                    AnimatedBuilder(
                      animation: _minuteController,
                      builder: (_, child) {
                        return buildClockHand(
                          height: 100,
                          width: 2,
                          color: Colors.redAccent,
                          angle: _minuteController.value * 2 * pi,
                        );
                      },
                    ),
                    // Center Pin
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),

              // Text Animations
              FadeTransition(
                opacity: _opacityAnimation,
                child: SlideTransition(
                  position: _offsetAnimation,
                  child: Column(
                    children: [
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
