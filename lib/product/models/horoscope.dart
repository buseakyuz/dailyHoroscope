import 'dart:convert';

List<Horoscope?>? horoscopeFromJson(String str) => json.decode(str) == null
    ? []
    : List<Horoscope?>.from(
        json.decode(str)!.map((x) => Horoscope.fromJson(x)));

String horoscopeToJson(List<Horoscope?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Horoscope {
  Horoscope({
    this.burc,
    this.mottosu,
    this.gezegeni,
    this.elementi,
    this.gunlukYorum,
  });

  String? burc;
  String? mottosu;
  String? gezegeni;
  String? elementi;
  String? gunlukYorum;

  factory Horoscope.fromJson(Map<String, dynamic> json) => Horoscope(
        burc: json["Burc"],
        mottosu: json["Mottosu"],
        gezegeni: json["Gezegeni"],
        elementi: json["Elementi"],
        gunlukYorum: json["GunlukYorum"],
      );

  Map<String, dynamic> toJson() => {
        "Burc": burc,
        "Mottosu": mottosu,
        "Gezegeni": gezegeni,
        "Elementi": elementi,
        "GunlukYorum": gunlukYorum,
      };
}
