import 'package:flutter/material.dart';
import 'package:musslim_app/pages/home/widget/header.dart';
import 'package:musslim_app/pages/home/widget/menu_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Header(),
            MenuCard(),
          ],
        ),
      ),
    );
  }
}
