import 'package:flutter/material.dart';
import 'package:flutter_filmler_uygulamasi/FilmlerSayfa.dart';
import 'package:flutter_filmler_uygulamasi/metots/anaSayfaMetots.dart';
import 'package:flutter_filmler_uygulamasi/models/Kategoriler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filmler Uygulaması',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 94, 204),
        title: Text(
          "Kategoriler",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<Kategoriler>>(
        future: tumKategorileriGoster(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var kategoriListesi = snapshot.data;
            return ListView.builder(
              itemCount: kategoriListesi!.length,
              itemBuilder: (context, index) {
                var kategori = kategoriListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Filmlersayfa(
                                  kategori: kategori,
                                )));
                  },
                  child: Card(
                    child: SizedBox(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            kategori.kategori_ad,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
