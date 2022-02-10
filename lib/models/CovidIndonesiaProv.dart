import 'package:json_annotation/json_annotation.dart';

part 'CovidIndonesiaProv.g.dart';

@JsonSerializable()
class CovidIndonesiaProv {
  CovidIndonesiaProv({
    this.lastDate,
    this.currentData,
    this.missingData,
    this.tanpaProvinsi,
    this.listData,
  });
  @JsonKey(name: 'last_date')
  DateTime? lastDate;
  @JsonKey(name: 'current_data')
  double? currentData;
  @JsonKey(name: 'missing_data')
  double? missingData;
  @JsonKey(name: 'tanpa_provinsi')
  int? tanpaProvinsi;
  @JsonKey(name: 'list_data')
  List<ListData>? listData;

  factory CovidIndonesiaProv.fromJson(Map<String, dynamic> json) =>
      _$CovidIndonesiaProvFromJson(json);

  Map<String, dynamic> toJson() => _$CovidIndonesiaProvToJson(this);
}

@JsonSerializable()
class ListData {
  ListData({
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
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'doc_count')
  double? docCount;
  @JsonKey(name: 'jumlah_kasus')
  int? jumlahKasus;
  @JsonKey(name: 'jumlah_sembuh')
  int? jumlahSembuh;
  @JsonKey(name: 'jumlah_meninggal')
  int? jumlahMeninggal;
  @JsonKey(name: 'jumlah_dirawat')
  int? jumlahDirawat;
  @JsonKey(name: 'jenis_kelamin')
  List<JenisKelamin>? jenisKelamin;
  @JsonKey(name: 'kelompok_umur')
  List<KelompokUmur>? kelompokUmur;
  @JsonKey(name: 'lokasi')
  Lokasi? lokasi;
  @JsonKey(name: 'penambahan')
  Penambahan? penambahan;

  factory ListData.fromJson(Map<String, dynamic> json) =>
      _$ListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ListDataToJson(this);
}

@JsonSerializable()
class JenisKelamin {
  JenisKelamin({
    this.key,
    this.docCount,
  });
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'doc_count')
  int? docCount;

  factory JenisKelamin.fromJson(Map<String, dynamic> json) =>
      _$JenisKelaminFromJson(json);

  Map<String, dynamic> toJson() => _$JenisKelaminToJson(this);
}

@JsonSerializable()
class KelompokUmur {
  KelompokUmur({
    this.key,
    this.docCount,
    this.usia,
  });
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'doc_count')
  int? docCount;
  @JsonKey(name: 'usia')
  Usia? usia;

  factory KelompokUmur.fromJson(Map<String, dynamic> json) =>
      _$KelompokUmurFromJson(json);

  Map<String, dynamic> toJson() => _$KelompokUmurToJson(this);
}

@JsonSerializable()
class Usia {
  Usia({
    this.value,
  });

  @JsonKey(name: 'value')
  double? value;

  factory Usia.fromJson(Map<String, dynamic> json) => _$UsiaFromJson(json);

  Map<String, dynamic> toJson() => _$UsiaToJson(this);
}

@JsonSerializable()
class Lokasi {
  Lokasi({
    this.lon,
    this.lat,
  });
  @JsonKey(name: 'lon')
  double? lon;
  @JsonKey(name: 'lat')
  double? lat;

  factory Lokasi.fromJson(Map<String, dynamic> json) => _$LokasiFromJson(json);

  Map<String, dynamic> toJson() => _$LokasiToJson(this);
}

@JsonSerializable()
class Penambahan {
  Penambahan({
    this.positif,
    this.sembuh,
    this.meninggal,
  });
  @JsonKey(name: 'positif')
  int? positif;
  @JsonKey(name: 'sembuh')
  int? sembuh;
  @JsonKey(name: 'meninggal')
  int? meninggal;

  factory Penambahan.fromJson(Map<String, dynamic> json) =>
      _$PenambahanFromJson(json);

  Map<String, dynamic> toJson() => _$PenambahanToJson(this);
}
