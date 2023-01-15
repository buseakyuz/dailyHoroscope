import 'dart:convert';

import 'package:dailyhoroscope/product/models/horoscope.dart';
import 'package:http/http.dart' as http;

// İnternete bağlan datayı getir.
class ApiService {
  Future<Horoscope> fetchInfo(String url) async {
    var response = await http.get(Uri.parse(url));

    List<dynamic> data = jsonDecode(response.body);
    return Horoscope.fromJson(data.first);
  }
}
