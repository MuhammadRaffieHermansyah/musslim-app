import 'package:flutter/material.dart';

class PrayerSchedule extends StatelessWidget {
  
  const PrayerSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return SizedBox(
      height: screenHeight * 0.08,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: screenWidth * 0.25,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.green,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Subuh',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.045,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '04.35',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.045,
                ),
              ),
            ],
          ),
        ),
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(width: 0),
      ),
    );
  }
}
