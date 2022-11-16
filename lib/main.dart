import 'package:al_quran_app/view/home_page.dart';
import 'package:al_quran_app/view/home_page.dart';
import 'package:al_quran_app/model/sura_arabic_version_model.dart';
import 'package:al_quran_app/view/welcome_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: SplashScreen(),
    );
  }
}
