// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_filmler_uygulamasi/models/Filmler.dart';

class Detaysayfa extends StatefulWidget {
  Filmler film;
  Detaysayfa({
    Key? key,
    required this.film,
  }) : super(key: key);

  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {
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
          widget.film.film_ad,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.film.film_resim}"),
            Text(
              "Film Yılı :",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.film.film_yil.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Film Yönetmeni :",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.film.yonetmen.yonetmen_ad,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
