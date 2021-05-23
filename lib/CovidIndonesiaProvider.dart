
import 'package:covid19app/CovidIndonesia.dart';
import 'package:http/http.dart' as http;

import 'CovidIndonesiaProv.dart';

class CovidIndonesiaProvider {
  Future<CovidIndonesia> getDataCovidIndonesia() async {
    final response = await http.get(Uri.https('data.covid19.go.id', '/public/api/update.json'));

    print('${response.body}');
    var covidIndonesiaData = covidIndonesiaFromJson(response.body);

    print('response code : ${response.statusCode}');
    return covidIndonesiaData;
  }

  Future<CovidIndonesiaProv> getDataCovidIndonesiaProv() async {
    final response = await http.get(Uri.https('data.covid19.go.id', '/public/api/prov.json'));

    // print('${response.body}');
    var covidIndonesiaData = covidIndonesiaProvFromJson(response.body);

    print('response code : ${response.statusCode}');

    return covidIndonesiaData;
  }

}