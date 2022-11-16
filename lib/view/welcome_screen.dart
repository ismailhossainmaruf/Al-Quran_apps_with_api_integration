import 'package:al_quran_app/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: MyHomePage(),
      duration: 5000,
      imageSize: 150,
      imageSrc: "asset/quran.png",
      text: "Al-Quran",
      textType: TextType.TyperAnimatedText,
      textStyle: GoogleFonts.notoSans(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 30),
      backgroundColor: Color(0xFF8759BD),
    );
  }
}
