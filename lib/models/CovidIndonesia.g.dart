// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CovidIndonesia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidIndonesia _$CovidIndonesiaFromJson(Map<String, dynamic> json) {
  return CovidIndonesia(
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    update: json['update'] == null
        ? null
        : Update.fromJson(json['update'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CovidIndonesiaToJson(CovidIndonesia instance) =>
    <String, dynamic>{
      'data': instance.data,
      'update': instance.update,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as int?,
    jumlahOdp: json['jumlahOdp'] as int?,
    jumlahPdp: json['jumlahPdp'] as int?,
    totalSpesimen: json['totalSpesimen'] as int?,
    totalSpesimenNegatif: json['totalSpesimenNegatif'] as int?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'jumlahOdp': instance.jumlahOdp,
      'jumlahPdp': instance.jumlahPdp,
      'totalSpesimen': instance.totalSpesimen,
      'totalSpesimenNegatif': instance.totalSpesimenNegatif,
    };

Update _$UpdateFromJson(Map<String, dynamic> json) {
  return Update(
    penambahan: json['penambahan'] == null
        ? null
        : Penambahan.fromJson(json['penambahan'] as Map<String, dynamic>),
    harian: (json['harian'] as List<dynamic>?)
        ?.map((e) => Harian.fromJson(e as Map<String, dynamic>))
        .toList(),
    total: json['total'] == null
        ? null
        : Total.fromJson(json['total'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateToJson(Update instance) => <String, dynamic>{
      'penambahan': instance.penambahan,
      'harian': instance.harian,
      'total': instance.total,
    };

Harian _$HarianFromJson(Map<String, dynamic> json) {
  return Harian(
    keyAsString: json['key_as_string'] == null
        ? null
        : DateTime.parse(json['key_as_string'] as String),
    key: json['key'] as int?,
    docCount: json['doc_count'] as int?,
    jumlahMeninggal: json['jumlah_meninggal'] == null
        ? null
        : Jumlah.fromJson(json['jumlah_meninggal'] as Map<String, dynamic>),
    jumlahSembuh: json['jumlah_sembuh'] == null
        ? null
        : Jumlah.fromJson(json['jumlah_sembuh'] as Map<String, dynamic>),
    jumlahPositif: json['jumlah_positif'] == null
        ? null
        : Jumlah.fromJson(json['jumlah_positif'] as Map<String, dynamic>),
    jumlahDirawat: json['jumlah_dirawat'] == null
        ? null
        : Jumlah.fromJson(json['jumlah_dirawat'] as Map<String, dynamic>),
    jumlahPositifKum: json['jumlah_positif_kum'] == null
        ? null
        : Jumlah.fromJson(json['jumlah_positif_kum'] as Map<String, dynamic>),
    jumlahSembuhKum: json['jumlah_sembuh_kum'] == null
        ? null
        : Jumlah.fromJson(json['jumlah_sembuh_kum'] as Map<String, dynamic>),
    jumlahMeninggalKum: json['jumlah_meninggal_kum'] == null
        ? null
        : Jumlah.fromJson(json['jumlah_meninggal_kum'] as Map<String, dynamic>),
    jumlahDirawatKum: json['jumlah_dirawat_kum'] == null
        ? null
        : Jumlah.fromJson(json['jumlah_dirawat_kum'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HarianToJson(Harian instance) => <String, dynamic>{
      'key_as_string': instance.keyAsString?.toIso8601String(),
      'key': instance.key,
      'doc_count': instance.docCount,
      'jumlah_meninggal': instance.jumlahMeninggal,
      'jumlah_sembuh': instance.jumlahSembuh,
      'jumlah_positif': instance.jumlahPositif,
      'jumlah_dirawat': instance.jumlahDirawat,
      'jumlah_positif_kum': instance.jumlahPositifKum,
      'jumlah_sembuh_kum': instance.jumlahSembuhKum,
      'jumlah_meninggal_kum': instance.jumlahMeninggalKum,
      'jumlah_dirawat_kum': instance.jumlahDirawatKum,
    };

Jumlah _$JumlahFromJson(Map<String, dynamic> json) {
  return Jumlah(
    value: json['value'] as int?,
  );
}

Map<String, dynamic> _$JumlahToJson(Jumlah instance) => <String, dynamic>{
      'value': instance.value,
    };

Penambahan _$PenambahanFromJson(Map<String, dynamic> json) {
  return Penambahan(
    jumlahPositif: json['jumlah_positif'] as int?,
    jumlahMeninggal: json['jumlah_meninggal'] as int?,
    jumlahSembuh: json['jumlah_sembuh'] as int?,
    jumlahDirawat: json['jumlah_dirawat'] as int?,
    tanggal: json['tanggal'] == null
        ? null
        : DateTime.parse(json['tanggal'] as String),
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
  );
}

Map<String, dynamic> _$PenambahanToJson(Penambahan instance) =>
    <String, dynamic>{
      'jumlah_positif': instance.jumlahPositif,
      'jumlah_meninggal': instance.jumlahMeninggal,
      'jumlah_sembuh': instance.jumlahSembuh,
      'jumlah_dirawat': instance.jumlahDirawat,
      'tanggal': instance.tanggal?.toIso8601String(),
      'created': instance.created?.toIso8601String(),
    };

Total _$TotalFromJson(Map<String, dynamic> json) {
  return Total(
    jumlahPositif: json['jumlah_positif'] as int?,
    jumlahDirawat: json['jumlah_dirawat'] as int?,
    jumlahSembuh: json['jumlah_sembuh'] as int?,
    jumlahMeninggal: json['jumlah_meninggal'] as int?,
  );
}

Map<String, dynamic> _$TotalToJson(Total instance) => <String, dynamic>{
      'jumlah_positif': instance.jumlahPositif,
      'jumlah_dirawat': instance.jumlahDirawat,
      'jumlah_sembuh': instance.jumlahSembuh,
      'jumlah_meninggal': instance.jumlahMeninggal,
    };
