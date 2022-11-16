// To parse this JSON data, do
//
//     final surahName = surahNameFromJson(jsonString);

import 'dart:convert';

SurahName surahNameFromJson(String str) => SurahName.fromJson(json.decode(str));

class SurahName {
  SurahName({
    this.verses,
    this.chapters,
    this.sajdas,
    this.rukus,
    this.pages,
    this.manzils,
    this.maqras,
    this.juzs,
  });

  final Verses ?verses;
  final List<Chapter> ?chapters;
  final Sajdas ?sajdas;
  final Rukus ?rukus;
  final Pages ?pages;
  final Manzils ?manzils;
  final Maqras ?maqras;
  final Juzs ?juzs;

  factory SurahName.fromJson(Map<String, dynamic> json) => SurahName(
    verses: Verses.fromJson(json["verses"]),
    chapters: List<Chapter>.from(json["chapters"].map((x) => Chapter.fromJson(x))),
    sajdas: Sajdas.fromJson(json["sajdas"]),
    rukus: Rukus.fromJson(json["rukus"]),
    pages: Pages.fromJson(json["pages"]),
    manzils: Manzils.fromJson(json["manzils"]),
    maqras: Maqras.fromJson(json["maqras"]),
    juzs: Juzs.fromJson(json["juzs"]),
  );

}

class Chapter {
  Chapter({
    this.chapter,
    this.name,
    this.englishname,
    this.arabicname,
    this.revelation,
    this.verses,
  });

  final int ?chapter;
  final String ?name;
  final String ?englishname;
  final String ?arabicname;
  final Revelation ?revelation;
  final List<Verse> ?verses;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
    chapter: json["chapter"],
    name: json["name"],
    englishname: json["englishname"],
    arabicname: json["arabicname"],
    //revelation: revelationValues.map[json["revelation"]],
    verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
  );

}

enum Revelation { MECCA, MADINA }

// final revelationValues =EnumValues({
//   "Madina": Revelation.MADINA,
//   "Mecca": Revelation.MECCA
// });

class Verse {
  Verse({
    this.verse,
    this.line,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.maqra,
    this.sajda,
  });

  final int ?verse;
  final int ?line;
  final int ?juz;
  final int ?manzil;
  final int ?page;
  final int ?ruku;
  final int ?maqra;
  final dynamic ?sajda;

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
    verse: json["verse"],
    line: json["line"],
    juz: json["juz"],
    manzil: json["manzil"],
    page: json["page"],
    ruku: json["ruku"],
    maqra: json["maqra"],
    sajda: json["sajda"],
  );

}

class SajdaClass {
  SajdaClass({
    this.no,
    this.recommended,
    this.obligatory,
  });

  final int ?no;
  final bool ?recommended;
  final bool ?obligatory;

  factory SajdaClass.fromJson(Map<String, dynamic> json) => SajdaClass(
    no: json["no"],
    recommended: json["recommended"],
    obligatory: json["obligatory"],
  );

}

class Juzs {
  Juzs({
    this.count,
    this.references,
  });

  final int ?count;
  final List<JuzsReference> ?references;

  factory Juzs.fromJson(Map<String, dynamic> json) => Juzs(
    count: json["count"],
    references: List<JuzsReference>.from(json["references"].map((x) => JuzsReference.fromJson(x))),
  );


}

class JuzsReference {
  JuzsReference({
    this.juz,
    this.start,
    this.end,
  });

  final int ?juz;
  final End ?start;
  final End ?end;

  factory JuzsReference.fromJson(Map<String, dynamic> json) => JuzsReference(
    juz: json["juz"],
    start: End.fromJson(json["start"]),
    end: End.fromJson(json["end"]),
  );

}

class End {
  End({
    this.chapter,
    this.verse,
  });

  final int ?chapter;
  final int ?verse;

  factory End.fromJson(Map<String, dynamic> json) => End(
    chapter: json["chapter"],
    verse: json["verse"],
  );
}

class Manzils {
  Manzils({
    this.count,
    this.references,
  });

  final int ?count;
  final List<ManzilsReference>? references;

  factory Manzils.fromJson(Map<String, dynamic> json) => Manzils(
    count: json["count"],
    references: List<ManzilsReference>.from(json["references"].map((x) => ManzilsReference.fromJson(x))),
  );

}

class ManzilsReference {
  ManzilsReference({
    this.manzil,
    this.start,
    this.end,
  });

  final int ?manzil;
  final End ?start;
  final End ?end;

  factory ManzilsReference.fromJson(Map<String, dynamic> json) => ManzilsReference(
    manzil: json["manzil"],
    start: End.fromJson(json["start"]),
    end: End.fromJson(json["end"]),
  );

}

class Maqras {
  Maqras({
    this.count,
    this.references,
  });

  final int ?count;
  final List<MaqrasReference> ?references;

  factory Maqras.fromJson(Map<String, dynamic> json) => Maqras(
    count: json["count"],
    references: List<MaqrasReference>.from(json["references"].map((x) => MaqrasReference.fromJson(x))),
  );

}

class MaqrasReference {
  MaqrasReference({
    this.maqra,
    this.start,
    this.end,
  });

  final int? maqra;
  final End ?start;
  final End ?end;

  factory MaqrasReference.fromJson(Map<String, dynamic> json) => MaqrasReference(
    maqra: json["maqra"],
    start: End.fromJson(json["start"]),
    end: End.fromJson(json["end"]),
  );
}

class Pages {
  Pages({
    this.count,
    this.references,
  });

  final int ?count;
  final List<PagesReference> ?references;

  factory Pages.fromJson(Map<String, dynamic> json) => Pages(
    count: json["count"],
    references: List<PagesReference>.from(json["references"].map((x) => PagesReference.fromJson(x))),
  );


}

class PagesReference {
  PagesReference({
    this.page,
    this.start,
    this.end,
  });

  final int ?page;
  final End ?start;
  final End ?end;

  factory PagesReference.fromJson(Map<String, dynamic> json) => PagesReference(
    page: json["page"],
    start: End.fromJson(json["start"]),
    end: End.fromJson(json["end"]),
  );

}

class Rukus {
  Rukus({
    this.count,
    this.references,
  });

  final int ?count;
  final List<RukusReference> ?references;

  factory Rukus.fromJson(Map<String, dynamic> json) => Rukus(
    count: json["count"],
    references: List<RukusReference>.from(json["references"].map((x) => RukusReference.fromJson(x))),
  );

}

class RukusReference {
  RukusReference({
    this.ruku,
    this.start,
    this.end,
  });

  final int ?ruku;
  final End ?start;
  final End ?end;

  factory RukusReference.fromJson(Map<String, dynamic> json) => RukusReference(
    ruku: json["ruku"],
    start: End.fromJson(json["start"]),
    end: End.fromJson(json["end"]),
  );


}

class Sajdas {
  Sajdas({
    this.count,
    this.references,
  });

  final int ?count;
  final List<SajdasReference> ?references;

  factory Sajdas.fromJson(Map<String, dynamic> json) => Sajdas(
    count: json["count"],
    references: List<SajdasReference>.from(json["references"].map((x) => SajdasReference.fromJson(x))),
  );

}

class SajdasReference {
  SajdasReference({
    this.sajda,
    this.chapter,
    this.verse,
    this.recommended,
    this.obligatory,
  });

  final int ?sajda;
  final int ?chapter;
  final int ?verse;
  final bool ?recommended;
  final bool ?obligatory;

  factory SajdasReference.fromJson(Map<String, dynamic> json) => SajdasReference(
    sajda: json["sajda"],
    chapter: json["chapter"],
    verse: json["verse"],
    recommended: json["recommended"],
    obligatory: json["obligatory"],
  );
}

class Verses {
  Verses({
    this.count,
  });

  final int ?count;

  factory Verses.fromJson(Map<String, dynamic> json) => Verses(
    count: json["count"],
  );

}

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
