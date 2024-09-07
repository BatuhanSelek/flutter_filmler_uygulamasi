import 'package:flutter_filmler_uygulamasi/models/Filmler.dart';
import 'package:flutter_filmler_uygulamasi/models/Kategoriler.dart';
import 'package:flutter_filmler_uygulamasi/models/VeritabaniYardimcisi.dart';
import 'package:flutter_filmler_uygulamasi/models/Yonetmenler.dart';

class Filmlerdao {
  Future<List<Filmler>> tumFilmlerByKategoriID(int kategori_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM filmler,kategoriler,yonetmenler WHERE filmler.kategori_id=kategoriler.kategori_id AND filmler.yonetmen_id=yonetmenler.yonetmen_id AND filmler.kategori_id=$kategori_id");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      var k = Kategoriler(
          kategori_id: satir["kategori_id"], kategori_ad: satir["kategori_ad"]);
      var y = Yonetmenler(
          yonetmen_id: satir["yonetmen_id"], yonetmen_ad: satir["yonetmen_ad"]);
      var f = Filmler(
          film_id: satir["film_id"],
          film_ad: satir["film_ad"],
          film_yil: satir["film_yil"],
          film_resim: satir["film_resim"],
          kategori: k,
          yonetmen: y);

      return f;
    });
  }
}
