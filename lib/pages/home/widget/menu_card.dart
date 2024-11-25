import 'package:flutter/material.dart';
import 'package:musslim_app/constants/colors.dart';
import 'package:musslim_app/pages/ceritaNabi/cerita_nabi_page.dart';
import 'package:musslim_app/pages/dzikir/dzikir_page.dart';
import 'package:musslim_app/pages/jadwalSholat/jadwal_sholat_page.dart';
import 'package:musslim_app/pages/juzAmma/juz_amma_page.dart';
import 'package:musslim_app/pages/kajian/kajian_page.dart';
import 'package:musslim_app/pages/niatDanDoa/niat_dan_doa_page.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          width: double.infinity,
          height: screenHeight * 0.52,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'All Features',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: screenHeight * 0.12,
                width: double.infinity,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final item = listMenu[index];
                    return Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => item['route'],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(8),
                              backgroundColor: ColorTheme.mainColor,
                              fixedSize:
                                  Size(screenWidth * 0.15, screenHeight * 0.08),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Center(
                            child: Icon(
                              item['icon'],
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('${item['nama']}')
                      ],
                    );
                  },
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: listMenu.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Kajian & Dakwah',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    child: const Text('See All'),
                    onPressed: () {},
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/dakwah_example_1.png'),
                            fit: BoxFit.cover,
                          )),
                      padding: const EdgeInsets.all(10),
                    );
                  },
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: listMenu.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ],
    );
  }
}

List<Map<String, dynamic>> listMenu = [
  {
    'nama': 'Juz Amma',
    'icon': Icons.my_library_books_rounded,
    'route': const JuzAmmaPage(),
  },
  {
    'nama': 'Cerita Nabi',
    'icon': Icons.person,
    'route': const CeritaNabiPage(),
  },
  {
    'nama': 'Jadwal Sholat',
    'icon': Icons.list_alt_outlined,
    'route': const JadwalSholatPage(),
  },
  {
    'nama': 'Kajian',
    'icon': Icons.announcement,
    'route': const KajianPage(),
  },
  {
    'nama': 'Dzikir',
    'icon': Icons.my_library_books_rounded,
    'route': const DzikirPage(),
  },
  {
    'nama': 'Niat & Doa',
    'icon': Icons.my_library_books_rounded,
    'route': const NiatDanDoaPage(),
  },
];
