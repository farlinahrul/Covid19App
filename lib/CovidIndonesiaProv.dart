// To parse this JSON data, do
//
//     final covidIndonesiaProv = covidIndonesiaProvFromJson(jsonString);

import 'dart:convert';

CovidIndonesiaProv covidIndonesiaProvFromJson(String str) => CovidIndonesiaProv.fromJson(json.decode(str));

String covidIndonesiaProvToJson(CovidIndonesiaProv data) => json.encode(data.toJson());

class CovidIndonesiaProv {
  CovidIndonesiaProv({
    this.lastDate,
    this.currentData,
    this.missingData,
    this.tanpaProvinsi,
    this.listData,
  });

  DateTime lastDate;
  double currentData;
  double missingData;
  int tanpaProvinsi;
  List<ListDatum> listData;

  factory CovidIndonesiaProv.fromJson(Map<String, dynamic> json) => CovidIndonesiaProv(
    lastDate: json["last_date"] == null ? null : DateTime.parse(json["last_date"]),
    currentData: json["current_data"] == null ? null : json["current_data"],
    missingData: json["missing_data"] == null ? null : json["missing_data"],
    tanpaProvinsi: json["tanpa_provinsi"] == null ? null : json["tanpa_provinsi"],
    listData: json["list_data"] == null ? null : List<ListDatum>.from(json["list_data"].map((x) => ListDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "last_date": lastDate == null ? null : "${lastDate.year.toString().padLeft(4, '0')}-${lastDate.month.toString().padLeft(2, '0')}-${lastDate.day.toString().padLeft(2, '0')}",
    "current_data": currentData == null ? null : currentData,
    "missing_data": missingData == null ? null : missingData,
    "tanpa_provinsi": tanpaProvinsi == null ? null : tanpaProvinsi,
    "list_data": listData == null ? null : List<dynamic>.from(listData.map((x) => x.toJson())),
  };
}

class ListDatum {
  ListDatum({
    this.key,
    this.docCount,
    this.jumlahKasus,
    this.jumlahSembuh,
    this.jumlahMeninggal,
    this.jumlahDirawat,
    this.jenisKelamin,
    this.kelompokUmur,
    this.lokasi,
    this.penambahan,
  });

  String key;
  double docCount;
  int jumlahKasus;
  int jumlahSembuh;
  int jumlahMeninggal;
  int jumlahDirawat;
  List<JenisKelamin> jenisKelamin;
  List<KelompokUmur> kelompokUmur;
  Lokasi lokasi;
  Penambahan penambahan;

  factory ListDatum.fromJson(Map<String, dynamic> json) => ListDatum(
    key: json["key"] == null ? null : json["key"],
    docCount: json["doc_count"] == null ? null : json["doc_count"].toDouble(),
    jumlahKasus: json["jumlah_kasus"] == null ? null : json["jumlah_kasus"],
    jumlahSembuh: json["jumlah_sembuh"] == null ? null : json["jumlah_sembuh"],
    jumlahMeninggal: json["jumlah_meninggal"] == null ? null : json["jumlah_meninggal"],
    jumlahDirawat: json["jumlah_dirawat"] == null ? null : json["jumlah_dirawat"],
    jenisKelamin: json["jenis_kelamin"] == null ? null : List<JenisKelamin>.from(json["jenis_kelamin"].map((x) => JenisKelamin.fromJson(x))),
    kelompokUmur: json["kelompok_umur"] == null ? null : List<KelompokUmur>.from(json["kelompok_umur"].map((x) => KelompokUmur.fromJson(x))),
    lokasi: json["lokasi"] == null ? null : Lokasi.fromJson(json["lokasi"]),
    penambahan: json["penambahan"] == null ? null : Penambahan.fromJson(json["penambahan"]),
  );

  Map<String, dynamic> toJson() => {
    "key": key == null ? null : key,
    "doc_count": docCount == null ? null : docCount,
    "jumlah_kasus": jumlahKasus == null ? null : jumlahKasus,
    "jumlah_sembuh": jumlahSembuh == null ? null : jumlahSembuh,
    "jumlah_meninggal": jumlahMeninggal == null ? null : jumlahMeninggal,
    "jumlah_dirawat": jumlahDirawat == null ? null : jumlahDirawat,
    "jenis_kelamin": jenisKelamin == null ? null : List<dynamic>.from(jenisKelamin.map((x) => x.toJson())),
    "kelompok_umur": kelompokUmur == null ? null : List<dynamic>.from(kelompokUmur.map((x) => x.toJson())),
    "lokasi": lokasi == null ? null : lokasi.toJson(),
    "penambahan": penambahan == null ? null : penambahan.toJson(),
  };
}

class JenisKelamin {
  JenisKelamin({
    this.key,
    this.docCount,
  });

  String key;
  int docCount;

  factory JenisKelamin.fromJson(Map<String, dynamic> json) => JenisKelamin(
    key: json["key"] == null ? null : json["key"],
    docCount: json["doc_count"] == null ? null : json["doc_count"],
  );

  Map<String, dynamic> toJson() => {
    "key": key == null ? null : key,
    "doc_count": docCount == null ? null : docCount,
  };
}

class KelompokUmur {
  KelompokUmur({
    this.key,
    this.docCount,
    this.usia,
  });

  String key;
  int docCount;
  Usia usia;

  factory KelompokUmur.fromJson(Map<String, dynamic> json) => KelompokUmur(
    key: json["key"] == null ? null : json["key"],
    docCount: json["doc_count"] == null ? null : json["doc_count"],
    usia: json["usia"] == null ? null : Usia.fromJson(json["usia"]),
  );

  Map<String, dynamic> toJson() => {
    "key": key == null ? null : key,
    "doc_count": docCount == null ? null : docCount,
    "usia": usia == null ? null : usia.toJson(),
  };
}

class Usia {
  Usia({
    this.value,
  });

  double value;

  factory Usia.fromJson(Map<String, dynamic> json) => Usia(
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : value,
  };
}

class Lokasi {
  Lokasi({
    this.lon,
    this.lat,
  });

  double lon;
  double lat;

  factory Lokasi.fromJson(Map<String, dynamic> json) => Lokasi(
    lon: json["lon"] == null ? null : json["lon"].toDouble(),
    lat: json["lat"] == null ? null : json["lat"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lon": lon == null ? null : lon,
    "lat": lat == null ? null : lat,
  };
}

class Penambahan {
  Penambahan({
    this.positif,
    this.sembuh,
    this.meninggal,
  });

  int positif;
  int sembuh;
  int meninggal;

  factory Penambahan.fromJson(Map<String, dynamic> json) => Penambahan(
    positif: json["positif"] == null ? null : json["positif"],
    sembuh: json["sembuh"] == null ? null : json["sembuh"],
    meninggal: json["meninggal"] == null ? null : json["meninggal"],
  );

  Map<String, dynamic> toJson() => {
    "positif": positif == null ? null : positif,
    "sembuh": sembuh == null ? null : sembuh,
    "meninggal": meninggal == null ? null : meninggal,
  };
}
