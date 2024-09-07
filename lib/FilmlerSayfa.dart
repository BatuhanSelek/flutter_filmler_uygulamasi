// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_filmler_uygulamasi/DetaySayfa.dart';
import 'package:flutter_filmler_uygulamasi/main.dart';
import 'package:flutter_filmler_uygulamasi/metots/filmlerSayfaMetots.dart';
import 'package:flutter_filmler_uygulamasi/models/Filmler.dart';
import 'package:flutter_filmler_uygulamasi/models/Kategoriler.dart';

class Filmlersayfa extends StatefulWidget {
  Kategoriler kategori;
  Filmlersayfa({
    super.key,
    required this.kategori,
  });

  @override
  State<Filmlersayfa> createState() => _FilmlersayfaState();
}

class _FilmlersayfaState extends State<Filmlersayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: const Color.fromARGB(255, 34, 94, 204),
        title: Text(
          "Filmler : ${widget.kategori.kategori_ad}",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGoster(widget.kategori.kategori_id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var filmlerListesi = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemCount: filmlerListesi!.length,
              itemBuilder: (context, index) {
                var film = filmlerListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detaysayfa(
                                  film: film,
                                )));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset("resimler/${film.film_resim}"),
                        ),
                        Text(
                          film.film_ad,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
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
