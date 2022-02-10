import 'package:covid19app/models/CovidIndonesiaProv.dart';
import 'package:covid19app/network/network_helper.dart';
import 'package:covid19app/network/urls.dart';
import 'package:get/get.dart';

class ProvinceController extends GetxController {
  final NetworkHelper _helper = NetworkHelper();
  RxBool first = true.obs;

  CovidIndonesiaProv dataCovidProvince = CovidIndonesiaProv();

  Future<void> getDataCovidProvince() async {
    await _helper.get(
      path: Urls.baseUrl + Urls.province,
      isRawResult: true,
      onSuccess: (data) {
        print('COVID Prov: ${data}');
        dataCovidProvince = CovidIndonesiaProv.fromJson(data);
        print('data 1 : ${dataCovidProvince.listData![0].toString()}');
      },
      onError: (error) {
        print('ERROR REWARD DATA: $error');
      },
    );
  }
}
