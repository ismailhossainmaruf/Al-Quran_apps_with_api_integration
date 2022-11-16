import 'dart:convert';

import 'package:al_quran_app/view/detailspage.dart';
import 'package:al_quran_app/model/sura_name_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ReadSurah extends StatefulWidget {
  const ReadSurah({Key? key}) : super(key: key);

  @override
  State<ReadSurah> createState() => _ReadSurahState();
}

class _ReadSurahState extends State<ReadSurah> {
  var suraHdata;
  var surah;
  var bangla;
  var english;
  List<SurahName> allsurahname = [];
  @override
  void initState() {
    // TODO: implement initState
    //getsuraName();
    this.GetSurahName();
    this.GetSura();
    this.GetBangTranslation();
    this.GetEngTranslation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return surah != null
        ? ListView.separated(
            // itemCount: allsurahname.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: surah == null ? 0 : surah.length + 1,
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.white30,
              );
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Flexible(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height * 0.60,
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      // color: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Chapter:${surah[index + 1]["chapter"]}",
                              style: GoogleFonts.notoSans(
                                  color: Colors.white,
                                  //Color(0xff943df4),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Verse:${surah[index + 1]["verse"]}",
                              style: GoogleFonts.notoSans(
                                  color: Colors.white,
                                  //Color(0xff943df4),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Container(
                            padding: EdgeInsets.all(8.0),
                            height: 45,
                            width: MediaQuery.of(context).size.width * 0.95,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white30,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xff943df4),
                                  radius: 14,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.black87,
                                    foregroundColor: Colors.greenAccent,
                                    child: Text(
                                      "${suraHdata[index]["chapter"]}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.share),
                                      color: Color(0xff943df4),
                                      iconSize: 20,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.bookmark),
                                      color: Color(0xff943df4),
                                      iconSize: 20,
                                    )
                                  ],
                                )
                              ],
                            )),
                        Flexible(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.70,
                              alignment: Alignment.centerRight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      "${surah[index + 1]["text"]}",
                                      style: GoogleFonts.notoSansArabic(
                                          color: Colors.white,
                                          //Color(0xff943df4),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.white30,
                                  ),
                                  Flexible(
                                    flex: 4,
                                    child: Text(
                                      "English : ${english[index + 1]["text"]}",
                                      style: GoogleFonts.notoSans(
                                        color: Colors.white,
                                        //Color(0xff943df4),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.white,
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      "অনুবাদ : ${bangla[index + 1]["text"]}",
                                      style: GoogleFonts.notoSansBengali(
                                          color: Colors.white,
                                          //Color(0xff943df4),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: const CircularProgressIndicator(
              backgroundColor: Color(0xff943df4),
              color: Colors.white70,
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

  Future GetBangTranslation() async {
    String translatelink3 =
        "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/ben-muhiuddinkhan.json";
    var response = await http.get(Uri.parse(translatelink3));
    setState(() {
      var decode3 = json.decode(response.body);
      bangla = (decode3["quran"]);
      print(decode3);
    });
  }

  Future GetEngTranslation() async {
    String translatelink4 =
        "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/eng-abdelhaleem.json";
    var response = await http.get(Uri.parse(translatelink4));
    setState(() {
      var decode4 = json.decode(response.body);
      english = (decode4["quran"]);
      print("In English : ${decode4}");
    });
  }
}
