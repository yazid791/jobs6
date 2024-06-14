import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Dunia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RotatingNames(),
    );
  }
}

class RotatingNames extends StatefulWidget {
  @override
  _RotatingNamesState createState() => _RotatingNamesState();
}

class _RotatingNamesState extends State<RotatingNames> {
  List<String> names = [
    'Muhamad Yazid Fyze Rahman',
    'Nely',
    'Alfi',
    'Ardi',
    'Ilham'
  ];

  int currentIndex = 0;
  Color currentColor = Colors.black;

  void changeNameAndColor() {
    setState(() {
      currentIndex = _getRandomIndex(); // Memilih indeks nama secara acak
      currentColor = _getRandomColor(); // Memilih warna secara acak
    });
  }

  int _getRandomIndex() {
    Random random = Random();
    return random.nextInt(
        names.length); // Mengembalikan indeks secara acak dari list nama
  }

  Color _getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Dunia'),
        backgroundColor: Colors.blue, // Memberi warna biru pada AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              changeNameAndColor(); // Memanggil fungsi untuk mengubah nama dan warna
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Apa kabar,',
              style: TextStyle(fontSize: 24, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              '${names[currentIndex]}',
              style: TextStyle(fontSize: 24, color: currentColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                changeNameAndColor(); // Memanggil fungsi untuk mengubah nama dan warna
              },
              child: Text('Random'),
            ),
          ],
        ),
      ),
    );
  }
}
