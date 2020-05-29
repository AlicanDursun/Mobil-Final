import 'dart:convert';
import 'package:onlinehaber/model/covidmodel.dart';
import 'package:onlinehaber/model/covidtek.dart';
import 'package:onlinehaber/model/models.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Haber> genelHaber() async {
    final String url =
        "http://newsapi.org/v2/top-headlines?country=tr&apiKey=9757aeed26814676a2ab3146a3d32db8";
    Haber haber;
    final cevap = await http.get(url);
    if (cevap.statusCode == 200) {
      var decodedJson = json.decode(cevap.body);
      haber = Haber.fromJson(decodedJson);
      return haber;
    } else {
      throw Exception("Bağlanamadık ${cevap.statusCode}");
    }
  }

  Future<Haber> kategorikHaber(String kategori) async {
    final String url =
        "http://newsapi.org/v2/top-headlines?country=tr&category=" +
            kategori +
            "&apiKey=9757aeed26814676a2ab3146a3d32db8";
    Haber haber;
    final cevap = await http.get(url);
    if (cevap.statusCode == 200) {
      var decodedJson = json.decode(cevap.body);
      haber = Haber.fromJson(decodedJson);
      return haber;
    } else {
      throw Exception("Bağlanamadık ${cevap.statusCode}");
    }
  }

  Future<List<Covid>> covid() async {
    final String url =
        "https://corona.lmao.ninja/v2/countries/Turkey,USA,Russia,China,Italy,France,Spain,Brazil?yesterday=false&strict=true&query";
    final cevap = await http.get(url);
    if (cevap.statusCode == 200) {
      return (json.decode(cevap.body) as List)
          .map((ulke) => Covid.fromJson(ulke))
          .toList();
    } else {
      throw Exception("Bağlanamadık ${cevap.statusCode}");
    }
  }

  Future<Covidtek> covidtek(String sehir) async {
    String buyukharf = sehir[0].toUpperCase();
    sehir = sehir.replaceFirst(sehir[0], buyukharf);
    final String url = "https://corona.lmao.ninja/v2/countries/" +
        sehir +
        "?yesterday=false&strict=true&query";
    final cevap = await http.get(url);
    if (cevap.statusCode == 200) {
      final gelenjson = json.decode(cevap.body);
      return Covidtek.fromJson(gelenjson);
    } else {
      return null;
    }
  }
}
