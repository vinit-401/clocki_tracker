import 'dart:async';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  Duration _duration = Duration();
  bool _isRunning = false;
  bool _isPaused = false;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _duration += Duration(seconds: 1);
      });
    });
    setState(() {
      _isRunning = true;
      _isPaused = false;
    });
  }

  void _pauseTimer() {
    _timer.cancel();
    setState(() {
      _isPaused = true;
    });
  }

  void _resumeTimer() {
    _startTimer();
  }

  void _stopTimer() {
    _timer.cancel();
    setState(() {
      _isRunning = false;
      _isPaused = false;
      _duration = Duration(); // Reset
    });
  }

  String _formatTime(int number) => number.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final hours = _formatTime(_duration.inHours);
    final minutes = _formatTime(_duration.inMinutes.remainder(60));
    final seconds = _formatTime(_duration.inSeconds.remainder(60));

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Time Display
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _timeBox(hours),
              _colon(),
              _timeBox(minutes),
              _colon(),
              _timeBox(seconds),
            ],
          ),
          SizedBox(height: 30),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (!_isRunning) {
                    _startTimer();
                  } else {
                    _stopTimer();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
                child: Text(_isRunning ? 'Stop' : 'Start'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: !_isRunning
                    ? null
                    : () {
                        if (_isPaused) {
                          _resumeTimer();
                        } else {
                          _pauseTimer();
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
                child: Text(_isPaused ? 'Resume' : 'Pause'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timeBox(String value) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white70),
      ),
      child: Text(
        value,
        style: TextStyle(
            fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _colon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        ":",
        style: TextStyle(fontSize: 36, color: Colors.white),
      ),
    );
  }
}
