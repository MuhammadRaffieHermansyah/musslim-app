import 'package:flutter/material.dart';
import 'package:musslim_app/pages/home/home_page.dart';

void main() {
  runApp(const MusslimApp());
}

class MusslimApp extends StatelessWidget {
  const MusslimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musslim App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const HomePage(),
    );
  }
}
