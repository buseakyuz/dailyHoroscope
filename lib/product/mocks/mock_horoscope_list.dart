import 'package:flutter_openmoji/flutter_openmoji.dart';

import '../models/horoscope_preview.dart';

class MockHoroscopeList {
  static List<HoroscopePreview> allHoroscopes = [
    HoroscopePreview(
        name: "Koç",
        date: "21 Mart - 20 Nisan",
        apiLink: "https://burc-yorumlari.vercel.app/get/koc",
        iconData: OpenmojiIcons.aries),
    HoroscopePreview(
        name: "Boğa",
        date: "21 Nisan - 20 Mayıs",
        apiLink: "https://burc-yorumlari.vercel.app/get/boga",
        iconData: OpenmojiIcons.taurus),
    HoroscopePreview(
      name: "İkizler",
      date: "21 Mayıs - 20 Haziran",
      apiLink: "https://burc-yorumlari.vercel.app/get/ikizler",
      iconData: OpenmojiIcons.gemini,
    ),
    HoroscopePreview(
      name: "Yengeç",
      date: "21 Haziran - 22 Temmuz",
      apiLink: "https://burc-yorumlari.vercel.app/get/yengec",
      iconData: OpenmojiIcons.cancer,
    ),
    HoroscopePreview(
      name: "Aslan",
      date: "23 Temmuz - 22 Ağustos",
      apiLink: "https://burc-yorumlari.vercel.app/get/aslan",
      iconData: OpenmojiIcons.leo,
    ),
    HoroscopePreview(
      name: "Başak",
      date: "23 Ağustos - 22 Eylül",
      apiLink: "https://burc-yorumlari.vercel.app/get/basak",
      iconData: OpenmojiIcons.virgo,
    ),
    HoroscopePreview(
      name: "Terazi",
      date: "23 Eylül - 22 Ekim",
      apiLink: "https://burc-yorumlari.vercel.app/get/terazi",
      iconData: OpenmojiIcons.libra,
    ),
    HoroscopePreview(
      name: "Akrep",
      date: "23 Ekim - 22 Kasım",
      apiLink: "https://burc-yorumlari.vercel.app/get/akrep",
      iconData: OpenmojiIcons.scorpio,
    ),
    HoroscopePreview(
      name: "Yay",
      date: "23 Kasım - 21 Aralık",
      apiLink: "https://burc-yorumlari.vercel.app/get/yay",
      iconData: OpenmojiIcons.sagittarius,
    ),
    HoroscopePreview(
      name: "Oğlak",
      date: "22 Aralık - 19 Ocak",
      apiLink: "https://burc-yorumlari.vercel.app/get/oglak",
      iconData: OpenmojiIcons.sagittarius,
    ),
    HoroscopePreview(
      name: "Kova",
      date: "20 Ocak - 18 Şubat",
      apiLink: "https://burc-yorumlari.vercel.app/get/kova",
      iconData: OpenmojiIcons.aquarius,
    ),
    HoroscopePreview(
      name: "Balık",
      date: "19 Şubat - 20 Mart",
      apiLink: "https://burc-yorumlari.vercel.app/get/balik",
      iconData: OpenmojiIcons.pisces,
    ),
  ];
}
