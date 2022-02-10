import 'package:json_annotation/json_annotation.dart';
part 'CovidIndonesia.g.dart';

@JsonSerializable()
class CovidIndonesia {
  CovidIndonesia({
    this.data,
    this.update,
  });

  @JsonKey(name: 'data')
  Data? data;
  @JsonKey(name: 'update')
  Update? update;

  factory CovidIndonesia.fromJson(Map<String, dynamic> json) =>
      _$CovidIndonesiaFromJson(json);

  Map<String, dynamic> toJson() => _$CovidIndonesiaToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.id,
    this.jumlahOdp,
    this.jumlahPdp,
    this.totalSpesimen,
    this.totalSpesimenNegatif,
  });
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'jumlahOdp')
  int? jumlahOdp;
  @JsonKey(name: 'jumlahPdp')
  int? jumlahPdp;
  @JsonKey(name: 'totalSpesimen')
  int? totalSpesimen;
  @JsonKey(name: 'totalSpesimenNegatif')
  int? totalSpesimenNegatif;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Update {
  Update({
    this.penambahan,
    this.harian,
    this.total,
  });
  @JsonKey(name: 'penambahan')
  Penambahan? penambahan;
  @JsonKey(name: 'harian')
  List<Harian>? harian;
  @JsonKey(name: 'total')
  Total? total;

  factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateToJson(this);
}

@JsonSerializable()
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
  @JsonKey(name: 'key_as_string')
  DateTime? keyAsString;
  @JsonKey(name: 'key')
  int? key;
  @JsonKey(name: 'doc_count')
  int? docCount;
  @JsonKey(name: 'jumlah_meninggal')
  Jumlah? jumlahMeninggal;
  @JsonKey(name: 'jumlah_sembuh')
  Jumlah? jumlahSembuh;
  @JsonKey(name: 'jumlah_positif')
  Jumlah? jumlahPositif;
  @JsonKey(name: 'jumlah_dirawat')
  Jumlah? jumlahDirawat;
  @JsonKey(name: 'jumlah_positif_kum')
  Jumlah? jumlahPositifKum;
  @JsonKey(name: 'jumlah_sembuh_kum')
  Jumlah? jumlahSembuhKum;
  @JsonKey(name: 'jumlah_meninggal_kum')
  Jumlah? jumlahMeninggalKum;
  @JsonKey(name: 'jumlah_dirawat_kum')
  Jumlah? jumlahDirawatKum;

  factory Harian.fromJson(Map<String, dynamic> json) => _$HarianFromJson(json);

  Map<String, dynamic> toJson() => _$HarianToJson(this);
}

@JsonSerializable()
class Jumlah {
  Jumlah({
    this.value,
  });
  @JsonKey(name: 'value')
  int? value;

  factory Jumlah.fromJson(Map<String, dynamic> json) => _$JumlahFromJson(json);

  Map<String, dynamic> toJson() => _$JumlahToJson(this);
}

@JsonSerializable()
class Penambahan {
  Penambahan({
    this.jumlahPositif,
    this.jumlahMeninggal,
    this.jumlahSembuh,
    this.jumlahDirawat,
    this.tanggal,
    this.created,
  });
  @JsonKey(name: 'jumlah_positif')
  int? jumlahPositif;
  @JsonKey(name: 'jumlah_meninggal')
  int? jumlahMeninggal;
  @JsonKey(name: 'jumlah_sembuh')
  int? jumlahSembuh;
  @JsonKey(name: 'jumlah_dirawat')
  int? jumlahDirawat;
  @JsonKey(name: 'tanggal')
  DateTime? tanggal;
  @JsonKey(name: 'created')
  DateTime? created;

  factory Penambahan.fromJson(Map<String, dynamic> json) =>
      _$PenambahanFromJson(json);

  Map<String, dynamic> toJson() => _$PenambahanToJson(this);
}

@JsonSerializable()
class Total {
  Total({
    this.jumlahPositif,
    this.jumlahDirawat,
    this.jumlahSembuh,
    this.jumlahMeninggal,
  });
  @JsonKey(name: 'jumlah_positif')
  int? jumlahPositif;
  @JsonKey(name: 'jumlah_dirawat')
  int? jumlahDirawat;
  @JsonKey(name: 'jumlah_sembuh')
  int? jumlahSembuh;
  @JsonKey(name: 'jumlah_meninggal')
  int? jumlahMeninggal;

  factory Total.fromJson(Map<String, dynamic> json) => _$TotalFromJson(json);

  Map<String, dynamic> toJson() => _$TotalToJson(this);
}
