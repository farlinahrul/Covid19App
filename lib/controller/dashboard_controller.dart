import 'package:covid19app/models/CovidIndonesia.dart';
import 'package:covid19app/network/network_helper.dart';
import 'package:covid19app/network/urls.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final NetworkHelper _helper = NetworkHelper();

  CovidIndonesia dataCovid = CovidIndonesia();

  Future<void> getDataCovid() async {
    await _helper.get(
      path: Urls.baseUrl + Urls.all,
      isRawResult: true,
      onSuccess: (data) {
        print('COVID: ${data}');
        dataCovid = CovidIndonesia.fromJson(data);
      },
      onError: (error) {
        print('ERROR REWARD DATA: $error');
      },
    );
  }
}
