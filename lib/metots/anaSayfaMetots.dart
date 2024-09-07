import 'package:flutter_filmler_uygulamasi/models/Kategoriler.dart';
import 'package:flutter_filmler_uygulamasi/models/Kategorilerdao.dart';

Future<List<Kategoriler>> tumKategorileriGoster() async {
  var kategoriListesi = await Kategorilerdao().tumKategorileriGoster();

  return kategoriListesi;
}
