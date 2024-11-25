// import 'dart:convert';

// class GetDataChecklist {
//   final List<JadwalSholatModel> data;

//   GetDataChecklist({
//     required this.data,
//   });

//   factory GetDataChecklist.fromRawJson(String str) =>
//       GetDataChecklist.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory GetDataChecklist.fromJson(Map<String, dynamic> json) =>
//       GetDataChecklist(
//         data: List<JadwalSholatModel>.from(
//             json["data"].map((x) => JadwalSholatModel.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

class JadwalSholatModel {
    final DateTime tanggal;
    final String imsyak;
    final String shubuh;
    final String terbit;
    final String dhuha;
    final String dzuhur;
    final String ashr;
    final String magrib;
    final String isya;

    JadwalSholatModel({
        required this.tanggal,
        required this.imsyak,
        required this.shubuh,
        required this.terbit,
        required this.dhuha,
        required this.dzuhur,
        required this.ashr,
        required this.magrib,
        required this.isya,
    });

    factory JadwalSholatModel.fromJson(Map<String, dynamic> json) => JadwalSholatModel(
        tanggal: DateTime.parse(json["tanggal"]),
        imsyak: json["imsyak"],
        shubuh: json["shubuh"],
        terbit: json["terbit"],
        dhuha: json["dhuha"],
        dzuhur: json["dzuhur"],
        ashr: json["ashr"],
        magrib: json["magrib"],
        isya: json["isya"],
    );

    Map<String, dynamic> toJson() => {
        "tanggal": "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "imsyak": imsyak,
        "shubuh": shubuh,
        "terbit": terbit,
        "dhuha": dhuha,
        "dzuhur": dzuhur,
        "ashr": ashr,
        "magrib": magrib,
        "isya": isya,
    };
}
