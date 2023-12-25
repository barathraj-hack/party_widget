import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = ConfettiController();
  bool isPlaying = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 218, 242, 255),
            title: Center(
              child: Text(
                'Home Page',
                style: GoogleFonts.outfit(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          body: Center(
            child: MaterialButton(
              onPressed: () {
                if (isPlaying) {
                  _controller.stop();
                } else {
                  _controller.play();
                }
                isPlaying = !isPlaying;
              },
              child: Text(
                'Party Time',
              ),
              color: Colors.deepPurple[200],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: _controller,
          blastDirection: pi / 2,
          colors: const [
            Colors.green,
            Colors.blue,
            Colors.orange,
          ],
          gravity: 0.010,
          emissionFrequency: 0.03,
        ),
      ],
    );
  }
}
