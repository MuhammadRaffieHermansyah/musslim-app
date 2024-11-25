import 'package:flutter/material.dart';

class KajianDakwahCard extends StatelessWidget {
  const KajianDakwahCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Kajian & Dakwah',
            style: TextStyle(
              fontSize: screenWidth * 0.055,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.separated(
              itemBuilder: (context, index) => Container(
                height: screenHeight * 0.2,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/kajian.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              scrollDirection: Axis.vertical,
              itemCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}
