import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;

class ArabicVersion extends StatefulWidget {
  const ArabicVersion({Key? key}) : super(key: key);

  @override
  State<ArabicVersion> createState() => _ArabicVersionState();
}

class _ArabicVersionState extends State<ArabicVersion> {
  @override
  void initState() {
    // TODO: implement initState
    this.GetData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index){
        return Divider(
          color: Colors.black,
        );
      },
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: arabicversionMap!.length,
      itemBuilder: (context,index){
        return Container(
          height: MediaQuery.of(context).size.height * 0.50,
          width: MediaQuery.of(context).size.width * 0.35,
          color: Colors.blueGrey,
          margin: EdgeInsets.only(
            bottom: 2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("${arabicversionMap![index]["quran"][index]["chapter"]}",
                style: GoogleFonts.notoSans(
                    color: Colors.black,
                    //Color(0xff943df4),
                    fontSize: 16,
                    fontWeight: FontWeight.w700),),
              Text("${arabicversionMap![index]["quran"][index]["text"]}",
                style: GoogleFonts.notoSansArabic(
                    color: Colors.black,
                    //Color(0xff943df4),
                    fontSize: 16,
                    fontWeight: FontWeight.w700),),
              Text("${arabicversionMap![index]["quran"][index]["verse"]}",
                style: GoogleFonts.notoSans(
                    color: Colors.black,
                    //Color(0xff943df4),
                    fontSize: 16,
                    fontWeight: FontWeight.w700),),
            ],
          ),
        );
      },
    );
  }
  Future GetData()async{
    String suraName = "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/info.json";
    String surah = "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/ara-quranacademy.json";
    var nameResponse = await http.get(Uri.parse(suraName));
    var surahResponse = await http.get(Uri.parse(surah));
    setState(() {
      nameMap = Map<String,dynamic>.from(jsonDecode(nameResponse.body));
      arabicversionMap = Map<String,dynamic>.from(jsonDecode(surahResponse.body));
    });
    print("name of surah are : ${nameResponse.body}");
    print("surah are : ${surahResponse.body}");
  }
  Map<String, dynamic>? arabicversionMap;
  Map<String, dynamic>? nameMap;
}
