import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  bool isSplash = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        isSplash = false;
      });
    });
    Future.delayed(const Duration(milliseconds: 2400), () {
      Navigator.pushNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    isSplash = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Stack(
      children: [
        Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_home.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: AnimatedTextKit(
              isRepeatingAnimation: false,
              pause: const Duration(milliseconds: 500),
              animatedTexts: [
                RotateAnimatedText(
                  'MUSLIM',
                  duration: const Duration(milliseconds: 3100),
                  transitionHeight: screenHeight * 0.3,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: screenHeight * 0.07,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    letterSpacing: -5,
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            height: screenHeight * 0.5,
            width: screenWidth * 0.85,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: isSplash
                    ? null
                    : const ColorFilter.mode(
                        Colors.transparent,
                        BlendMode.clear,
                      ),
                image: const AssetImage('assets/images/splash.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
