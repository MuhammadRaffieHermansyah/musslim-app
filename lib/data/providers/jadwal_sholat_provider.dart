import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:musslim_app/data/models/jadwal_sholat_model.dart';

class JadwalSholatProvider {
  static Future<List<JadwalSholatModel>> getJadwalSholat() async {
    final url = Uri.parse(
        'https://raw.githubusercontent.com/lakuapik/jadwalsholatorg/master/adzan/jember/2024/11.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => JadwalSholatModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load prayer times');
    }
  }
}
