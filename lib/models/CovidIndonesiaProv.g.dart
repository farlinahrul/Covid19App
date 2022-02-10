// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CovidIndonesiaProv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidIndonesiaProv _$CovidIndonesiaProvFromJson(Map<String, dynamic> json) {
  return CovidIndonesiaProv(
    lastDate: json['last_date'] == null
        ? null
        : DateTime.parse(json['last_date'] as String),
    currentData: (json['current_data'] as num?)?.toDouble(),
    missingData: (json['missing_data'] as num?)?.toDouble(),
    tanpaProvinsi: json['tanpa_provinsi'] as int?,
    listData: (json['list_data'] as List<dynamic>?)
        ?.map((e) => ListData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CovidIndonesiaProvToJson(CovidIndonesiaProv instance) =>
    <String, dynamic>{
      'last_date': instance.lastDate?.toIso8601String(),
      'current_data': instance.currentData,
      'missing_data': instance.missingData,
      'tanpa_provinsi': instance.tanpaProvinsi,
      'list_data': instance.listData,
    };

ListData _$ListDataFromJson(Map<String, dynamic> json) {
  return ListData(
    key: json['key'] as String?,
    docCount: (json['doc_count'] as num?)?.toDouble(),
    jumlahKasus: json['jumlah_kasus'] as int?,
    jumlahSembuh: json['jumlah_sembuh'] as int?,
    jumlahMeninggal: json['jumlah_meninggal'] as int?,
    jumlahDirawat: json['jumlah_dirawat'] as int?,
    jenisKelamin: (json['jenis_kelamin'] as List<dynamic>?)
        ?.map((e) => JenisKelamin.fromJson(e as Map<String, dynamic>))
        .toList(),
    kelompokUmur: (json['kelompok_umur'] as List<dynamic>?)
        ?.map((e) => KelompokUmur.fromJson(e as Map<String, dynamic>))
        .toList(),
    lokasi: json['lokasi'] == null
        ? null
        : Lokasi.fromJson(json['lokasi'] as Map<String, dynamic>),
    penambahan: json['penambahan'] == null
        ? null
        : Penambahan.fromJson(json['penambahan'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListDataToJson(ListData instance) => <String, dynamic>{
      'key': instance.key,
      'doc_count': instance.docCount,
      'jumlah_kasus': instance.jumlahKasus,
      'jumlah_sembuh': instance.jumlahSembuh,
      'jumlah_meninggal': instance.jumlahMeninggal,
      'jumlah_dirawat': instance.jumlahDirawat,
      'jenis_kelamin': instance.jenisKelamin,
      'kelompok_umur': instance.kelompokUmur,
      'lokasi': instance.lokasi,
      'penambahan': instance.penambahan,
    };

JenisKelamin _$JenisKelaminFromJson(Map<String, dynamic> json) {
  return JenisKelamin(
    key: json['key'] as String?,
    docCount: json['doc_count'] as int?,
  );
}

Map<String, dynamic> _$JenisKelaminToJson(JenisKelamin instance) =>
    <String, dynamic>{
      'key': instance.key,
      'doc_count': instance.docCount,
    };

KelompokUmur _$KelompokUmurFromJson(Map<String, dynamic> json) {
  return KelompokUmur(
    key: json['key'] as String?,
    docCount: json['doc_count'] as int?,
    usia: json['usia'] == null
        ? null
        : Usia.fromJson(json['usia'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$KelompokUmurToJson(KelompokUmur instance) =>
    <String, dynamic>{
      'key': instance.key,
      'doc_count': instance.docCount,
      'usia': instance.usia,
    };

Usia _$UsiaFromJson(Map<String, dynamic> json) {
  return Usia(
    value: (json['value'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$UsiaToJson(Usia instance) => <String, dynamic>{
      'value': instance.value,
    };

Lokasi _$LokasiFromJson(Map<String, dynamic> json) {
  return Lokasi(
    lon: (json['lon'] as num?)?.toDouble(),
    lat: (json['lat'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$LokasiToJson(Lokasi instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

Penambahan _$PenambahanFromJson(Map<String, dynamic> json) {
  return Penambahan(
    positif: json['positif'] as int?,
    sembuh: json['sembuh'] as int?,
    meninggal: json['meninggal'] as int?,
  );
}

Map<String, dynamic> _$PenambahanToJson(Penambahan instance) =>
    <String, dynamic>{
      'positif': instance.positif,
      'sembuh': instance.sembuh,
      'meninggal': instance.meninggal,
    };
