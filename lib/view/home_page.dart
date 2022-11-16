import 'dart:convert';

import 'package:al_quran_app/view/detailspage.dart';
import 'package:al_quran_app/model/sura_name_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var suraHdata;
  var surah;
  List<SurahName> allsurahname = [];
  @override
  void initState() {
    // TODO: implement initState
    //getsuraName();
    this.GetSurahName();
    this.GetSura();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8759BD),
      appBar: AppBar(
        title: Text("AL-Quran"),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.99,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xff943df4),
                            Colors.white70,
                          ])),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.menu_book,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Last Read",
                                  style: GoogleFonts.notoSans(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Center(
                                      child: Image.asset(
                                    "asset/quran.png",
                                    height: MediaQuery.of(context).size.height *
                                        0.45,
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    fit: BoxFit.cover,
                                  )),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [],
                          ),
                          Row(
                            children: [
                              Text(
                                "Ayah No:00",
                                style: GoogleFonts.notoSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xff943df4),
                          Colors.white70,
                        ]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: suraHdata == null ? 0 : suraHdata.length,
                      itemBuilder: (context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Detailspage(
                                          dataRecive: suraHdata[index],
                                          recieveSurah: surah[index],
                                          surah: surah[index],
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              padding: const EdgeInsets.all(10.0),
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white30,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Color(0xff943df4),
                                        radius: 18,
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.black87,
                                          foregroundColor: Colors.greenAccent,
                                          child: Text(
                                            "${suraHdata[index]["chapter"]}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Surah ${suraHdata[index]["name"]}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(
                                        "${suraHdata[index]["arabicname"]}",
                                        style: GoogleFonts.notoSansArabic(
                                            color: Colors.white,
                                            //Color(0xff943df4),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Revelation : ${suraHdata[index]["revelation"]}",
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future GetSurahName() async {
    String suralink =
        "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/info.json";
    var responce = await http.get(Uri.parse(suralink));
    setState(() {
      var decode = json.decode(responce.body);
      suraHdata = decode["chapters"];
      print(decode);
    });
  }

  Future GetSura() async {
    String suralink2 =
        "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/ara-quranacademy.json";
    var responce = await http.get(Uri.parse(suralink2));
    setState(() {
      var decode2 = json.decode(responce.body);
      surah = decode2["quran"];
      print(decode2);
    });
  }
}
