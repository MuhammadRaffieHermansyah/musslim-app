import 'package:flutter/material.dart';
import 'package:musslim_app/constants/colors.dart';
import 'package:musslim_app/pages/juzAmma/layouts/verse_surah_page.dart';
import 'package:quran/quran.dart' as quran;

class JuzAmmaPage extends StatelessWidget {
  const JuzAmmaPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> numbers = List.generate(114, (index) => index + 1);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Juz Amma",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorTheme.mainColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 0,
        ),
        child: ListView.builder(
          itemCount: numbers.length,
          clipBehavior: Clip.none,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerseSurahPage(
                      nomorSurat: numbers[index],
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: ColorTheme.mainColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            quran.getSurahName(numbers[index]),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "${quran.getPlaceOfRevelation(numbers[index])}, ${quran.getVerseCount(numbers[index]).toString()} Ayat",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      quran.getSurahNameArabic(numbers[index]),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
