// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_filmler_uygulamasi/models/Kategoriler.dart';
import 'package:flutter_filmler_uygulamasi/models/Yonetmenler.dart';

class Filmler {
  int film_id;
  String film_ad;
  int film_yil;
  String film_resim;
  Kategoriler kategori;
  Yonetmenler yonetmen;
  Filmler({
    required this.film_id,
    required this.film_ad,
    required this.film_yil,
    required this.film_resim,
    required this.kategori,
    required this.yonetmen,
  });
}
