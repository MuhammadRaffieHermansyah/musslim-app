import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String _currentTime = '';
  String _currentDay = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateFormat('HH.mm').format(DateTime.now());
        _currentDay = DateFormat('d MMM y').format(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      height: screenHeight * 0.45,
      width: double.infinity,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg.png'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _currentTime,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.15,
            ),
          ),
          Text(
            _currentDay,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.05,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Dzuhur 2 hours 30 min left',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: screenHeight * 0.035,
            ),
          ),
          const Spacer(),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const Column(
                  children: [
                    Text(
                      'Dzuhur',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '12.00',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              },
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(width: 14),
            ),
          ),
        ],
      ),
    );
  }
}
