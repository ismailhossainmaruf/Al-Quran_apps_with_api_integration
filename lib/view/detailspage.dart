import 'package:al_quran_app/model/sura_arabic_version_model.dart';
import 'package:al_quran_app/view/surah.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Detailspage extends StatelessWidget {
  Detailspage({
    Key? key,
    this.dataRecive,
    this.recieveSurah,
    this.surah,
  }) : super(key: key);
  var dataRecive;
  var surah;
  var recieveSurah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF8759BD),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xE15D348A),
          title: Text("Surah ${dataRecive["name"]}"),
          centerTitle: true,
        ),
        body: surah != null
            ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.60,
                          width: MediaQuery.of(context).size.width * 0.95,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xff943df4),
                                    Colors.white70,
                                  ])),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dataRecive["name"],
                                style: GoogleFonts.notoSans(
                                    color: Colors.white,
                                    //Color(0xff943df4),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                dataRecive["englishname"],
                                style: GoogleFonts.notoSans(
                                    color: Colors.white,
                                    //Color(0xff943df4),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              Divider(
                                color: Colors.white30,
                                endIndent: 60,
                                indent: 60,
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dataRecive["revelation"],
                                    style: GoogleFonts.notoSans(
                                        color: Colors.white,
                                        //Color(0xff943df4),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "+${dataRecive["verses"][0]["line"]}",
                                    style: GoogleFonts.notoSans(
                                        color: Colors.white,
                                        //Color(0xff943df4),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    " ${dataRecive["verses"][0]["verse"]}",
                                    style: GoogleFonts.notoSans(
                                        color: Colors.white,
                                        //Color(0xff943df4),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              Text(
                                dataRecive["arabicname"],
                                style: GoogleFonts.notoSansArabic(
                                    color: Colors.white,
                                    //Color(0xff943df4),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.50,
                            child: ReadSurah(),
                            //
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : CircularProgressIndicator(
                backgroundColor: Color(0xff943df4),
                color: Colors.white70,
              ));
  }
}
