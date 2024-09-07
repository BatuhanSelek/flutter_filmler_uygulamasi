import 'package:flutter_filmler_uygulamasi/models/Filmler.dart';
import 'package:flutter_filmler_uygulamasi/models/Filmlerdao.dart';
import 'package:flutter_filmler_uygulamasi/models/Kategoriler.dart';
import 'package:flutter_filmler_uygulamasi/models/Yonetmenler.dart';

Future<List<Filmler>> filmleriGoster(int kategori_id) async {
  var filmlerListesi = await Filmlerdao().tumFilmlerByKategoriID(kategori_id);

  return filmlerListesi;
}
