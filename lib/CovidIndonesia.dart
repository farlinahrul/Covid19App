// To parse this JSON data, do
//
//     final covidIndonesia = covidIndonesiaFromJson(jsonString);

import 'dart:convert';

CovidIndonesia covidIndonesiaFromJson(String str) => CovidIndonesia.fromJson(json.decode(str));

String covidIndonesiaToJson(CovidIndonesia data) => json.encode(data.toJson());

class CovidIndonesia {
  CovidIndonesia({
    this.data,
    this.update,
  });

  Data data;
  Update update;

  factory CovidIndonesia.fromJson(Map<String, dynamic> json) => CovidIndonesia(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    update: json["update"] == null ? null : Update.fromJson(json["update"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "update": update == null ? null : update.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.jumlahOdp,
    this.jumlahPdp,
    this.totalSpesimen,
    this.totalSpesimenNegatif,
  });

  int id;
  int jumlahOdp;
  int jumlahPdp;
  int totalSpesimen;
  int totalSpesimenNegatif;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] == null ? null : json["id"],
    jumlahOdp: json["jumlah_odp"] == null ? null : json["jumlah_odp"],
    jumlahPdp: json["jumlah_pdp"] == null ? null : json["jumlah_pdp"],
    totalSpesimen: json["total_spesimen"] == null ? null : json["total_spesimen"],
    totalSpesimenNegatif: json["total_spesimen_negatif"] == null ? null : json["total_spesimen_negatif"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "jumlah_odp": jumlahOdp == null ? null : jumlahOdp,
    "jumlah_pdp": jumlahPdp == null ? null : jumlahPdp,
    "total_spesimen": totalSpesimen == null ? null : totalSpesimen,
    "total_spesimen_negatif": totalSpesimenNegatif == null ? null : totalSpesimenNegatif,
  };
}

class Update {
  Update({
    this.penambahan,
    this.harian,
    this.total,
  });

  Penambahan penambahan;
  List<Harian> harian;
  Total total;

  factory Update.fromJson(Map<String, dynamic> json) => Update(
    penambahan: json["penambahan"] == null ? null : Penambahan.fromJson(json["penambahan"]),
    harian: json["harian"] == null ? null : List<Harian>.from(json["harian"].map((x) => Harian.fromJson(x))),
    total: json["total"] == null ? null : Total.fromJson(json["total"]),
  );

  Map<String, dynamic> toJson() => {
    "penambahan": penambahan == null ? null : penambahan.toJson(),
    "harian": harian == null ? null : List<dynamic>.from(harian.map((x) => x.toJson())),
    "total": total == null ? null : total.toJson(),
  };
}

class Harian {
  Harian({
    this.keyAsString,
    this.key,
    this.docCount,
    this.jumlahMeninggal,
    this.jumlahSembuh,
    this.jumlahPositif,
    this.jumlahDirawat,
    this.jumlahPositifKum,
    this.jumlahSembuhKum,
    this.jumlahMeninggalKum,
    this.jumlahDirawatKum,
  });

  DateTime keyAsString;
  int key;
  int docCount;
  Jumlah jumlahMeninggal;
  Jumlah jumlahSembuh;
  Jumlah jumlahPositif;
  Jumlah jumlahDirawat;
  Jumlah jumlahPositifKum;
  Jumlah jumlahSembuhKum;
  Jumlah jumlahMeninggalKum;
  Jumlah jumlahDirawatKum;

  factory Harian.fromJson(Map<String, dynamic> json) => Harian(
    keyAsString: json["key_as_string"] == null ? null : DateTime.parse(json["key_as_string"]),
    key: json["key"] == null ? null : json["key"],
    docCount: json["doc_count"] == null ? null : json["doc_count"],
    jumlahMeninggal: json["jumlah_meninggal"] == null ? null : Jumlah.fromJson(json["jumlah_meninggal"]),
    jumlahSembuh: json["jumlah_sembuh"] == null ? null : Jumlah.fromJson(json["jumlah_sembuh"]),
    jumlahPositif: json["jumlah_positif"] == null ? null : Jumlah.fromJson(json["jumlah_positif"]),
    jumlahDirawat: json["jumlah_dirawat"] == null ? null : Jumlah.fromJson(json["jumlah_dirawat"]),
    jumlahPositifKum: json["jumlah_positif_kum"] == null ? null : Jumlah.fromJson(json["jumlah_positif_kum"]),
    jumlahSembuhKum: json["jumlah_sembuh_kum"] == null ? null : Jumlah.fromJson(json["jumlah_sembuh_kum"]),
    jumlahMeninggalKum: json["jumlah_meninggal_kum"] == null ? null : Jumlah.fromJson(json["jumlah_meninggal_kum"]),
    jumlahDirawatKum: json["jumlah_dirawat_kum"] == null ? null : Jumlah.fromJson(json["jumlah_dirawat_kum"]),
  );

  Map<String, dynamic> toJson() => {
    "key_as_string": keyAsString == null ? null : keyAsString.toIso8601String(),
    "key": key == null ? null : key,
    "doc_count": docCount == null ? null : docCount,
    "jumlah_meninggal": jumlahMeninggal == null ? null : jumlahMeninggal.toJson(),
    "jumlah_sembuh": jumlahSembuh == null ? null : jumlahSembuh.toJson(),
    "jumlah_positif": jumlahPositif == null ? null : jumlahPositif.toJson(),
    "jumlah_dirawat": jumlahDirawat == null ? null : jumlahDirawat.toJson(),
    "jumlah_positif_kum": jumlahPositifKum == null ? null : jumlahPositifKum.toJson(),
    "jumlah_sembuh_kum": jumlahSembuhKum == null ? null : jumlahSembuhKum.toJson(),
    "jumlah_meninggal_kum": jumlahMeninggalKum == null ? null : jumlahMeninggalKum.toJson(),
    "jumlah_dirawat_kum": jumlahDirawatKum == null ? null : jumlahDirawatKum.toJson(),
  };
}

class Jumlah {
  Jumlah({
    this.value,
  });

  int value;

  factory Jumlah.fromJson(Map<String, dynamic> json) => Jumlah(
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : value,
  };
}

class Penambahan {
  Penambahan({
    this.jumlahPositif,
    this.jumlahMeninggal,
    this.jumlahSembuh,
    this.jumlahDirawat,
    this.tanggal,
    this.created,
  });

  int jumlahPositif;
  int jumlahMeninggal;
  int jumlahSembuh;
  int jumlahDirawat;
  DateTime tanggal;
  DateTime created;

  factory Penambahan.fromJson(Map<String, dynamic> json) => Penambahan(
    jumlahPositif: json["jumlah_positif"] == null ? null : json["jumlah_positif"],
    jumlahMeninggal: json["jumlah_meninggal"] == null ? null : json["jumlah_meninggal"],
    jumlahSembuh: json["jumlah_sembuh"] == null ? null : json["jumlah_sembuh"],
    jumlahDirawat: json["jumlah_dirawat"] == null ? null : json["jumlah_dirawat"],
    tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
    created: json["created"] == null ? null : DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "jumlah_positif": jumlahPositif == null ? null : jumlahPositif,
    "jumlah_meninggal": jumlahMeninggal == null ? null : jumlahMeninggal,
    "jumlah_sembuh": jumlahSembuh == null ? null : jumlahSembuh,
    "jumlah_dirawat": jumlahDirawat == null ? null : jumlahDirawat,
    "tanggal": tanggal == null ? null : "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
    "created": created == null ? null : created.toIso8601String(),
  };
}

class Total {
  Total({
    this.jumlahPositif,
    this.jumlahDirawat,
    this.jumlahSembuh,
    this.jumlahMeninggal,
  });

  int jumlahPositif;
  int jumlahDirawat;
  int jumlahSembuh;
  int jumlahMeninggal;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
    jumlahPositif: json["jumlah_positif"] == null ? null : json["jumlah_positif"],
    jumlahDirawat: json["jumlah_dirawat"] == null ? null : json["jumlah_dirawat"],
    jumlahSembuh: json["jumlah_sembuh"] == null ? null : json["jumlah_sembuh"],
    jumlahMeninggal: json["jumlah_meninggal"] == null ? null : json["jumlah_meninggal"],
  );

  Map<String, dynamic> toJson() => {
    "jumlah_positif": jumlahPositif == null ? null : jumlahPositif,
    "jumlah_dirawat": jumlahDirawat == null ? null : jumlahDirawat,
    "jumlah_sembuh": jumlahSembuh == null ? null : jumlahSembuh,
    "jumlah_meninggal": jumlahMeninggal == null ? null : jumlahMeninggal,
  };
}
