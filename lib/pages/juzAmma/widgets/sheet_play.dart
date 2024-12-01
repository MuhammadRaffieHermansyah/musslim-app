import 'package:flutter/material.dart';
import 'package:musslim_app/constants/colors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quran/quran.dart' as quran;

class SheetPlay extends StatefulWidget {
  const SheetPlay({
    super.key,
    required this.nomorSurat,
  });

  final int nomorSurat;

  @override
  State<SheetPlay> createState() => _SheetPlayState();
}

class _SheetPlayState extends State<SheetPlay> {
  bool isPlay = false;
  @override
  void dispose() {
    final player = AudioPlayer();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      height: screenHeight * 0.25,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: ColorTheme.mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      quran.getSurahName(widget.nomorSurat),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.075,
                      ),
                    ),
                    Text(
                      "${quran.getPlaceOfRevelation(widget.nomorSurat)}, ${quran.getVerseCount(widget.nomorSurat).toString()} Ayat",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  quran.getSurahNameArabic(widget.nomorSurat),
                  style: TextStyle(
                    fontSize: screenWidth * 0.075,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const LinearProgressIndicator(
            value: 0,
            color: Colors.black,
            backgroundColor: Colors.white,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('0.00', style: TextStyle(color: Colors.white)),
              Text('4.00', style: TextStyle(color: Colors.white)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_previous,
                  color: Colors.white,
                  size: screenHeight * 0.045,
                ),
              ),
              IconButton(
                onPressed: () async {
                  final player = AudioPlayer();
                  if (!isPlay) {
                    if (player.state == PlayerState.playing) {
                      await player.resume();
                    } else {
                      await player.play(
                        UrlSource(
                          quran.getAudioURLBySurah(widget.nomorSurat),
                        ),
                      );
                      setState(() {
                        isPlay = true;
                      });
                    }
                  } else {
                    await player.pause();
                    setState(() {
                      isPlay = false;
                    });
                  }
                },
                icon: Icon(
                  isPlay ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: screenHeight * 0.045,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_next,
                  color: Colors.white,
                  size: screenHeight * 0.045,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
