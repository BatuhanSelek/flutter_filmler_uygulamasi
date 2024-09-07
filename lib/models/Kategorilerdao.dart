import 'package:flutter_filmler_uygulamasi/models/Kategoriler.dart';
import 'package:flutter_filmler_uygulamasi/models/VeritabaniYardimcisi.dart';

class Kategorilerdao {
  Future<List<Kategoriler>> tumKategorileriGoster() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM kategoriler");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kategoriler(
          kategori_id: satir["kategori_id"], kategori_ad: satir["kategori_ad"]);
    });
  }
}
