import 'package:flutter/material.dart';
import 'package:musslim_app/constants/colors.dart';
import 'package:quran/quran.dart' as quran;

class VerseSurahPage extends StatelessWidget {
  const VerseSurahPage({super.key, required this.nomorSurat});

  final int nomorSurat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          quran.getSurahName(nomorSurat),
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ColorTheme.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: ListView.builder(
          itemCount: quran.getVerseCount(nomorSurat),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: ColorTheme.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    quran.getVerse(
                      nomorSurat,
                      index + 1,
                      verseEndSymbol: true,
                    ),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 28,
                      color: ColorTheme.mainColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    quran.getVerseTranslation(
                      nomorSurat,
                      index + 1,
                      translation: quran.Translation.indonesian,
                    ),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: ColorTheme.mainColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
