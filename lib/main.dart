import 'package:flutter/material.dart';
import 'package:musslim_app/pages/home/home_page.dart';
import 'package:musslim_app/pages/juzAmma/juz_amma_page.dart';
import 'package:musslim_app/pages/splash/screen.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const Screen(),
        '/home': (context) => const HomePage(),
        '/juz-amma': (context) => const JuzAmmaPage(),
      },
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
    );
  }
}
