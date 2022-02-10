import 'package:covid19app/controller/province_controller.dart';
import 'package:covid19app/models/CovidIndonesiaProv.dart';
import 'package:covid19app/module/province/ProvinceDetailPage.dart';
import 'package:covid19app/module/province/component/ProvinceTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProvincePage extends StatefulWidget {
  static const routeName = '/province';
  @override
  _ProvincePageState createState() => _ProvincePageState();
}

class _ProvincePageState extends State<ProvincePage> {
  ProvinceController controller = Get.put(ProvinceController());
  var filteredData = <Map>[];
  var temp = <Map>[];

  @override
  Widget build(BuildContext context) {
    print('awal: ${controller.dataCovidProvince.listData.toString()}');
    return Scaffold(
      backgroundColor: Color(0xe6ffffff),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(
                24,
              ),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.youtube_searched_for,
                    size: 22,
                    color: Colors.orange,
                  ),
                  labelText: 'Cari Provinsi',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: InputBorder.none,
                ),
                onChanged: (string) {
                  setState(() {
                    if (string != '') {
                      filteredData.clear();
                      for (int i = 0; i < temp.length; i++) {
                        if (temp[i]['provinceName']
                            .toString()
                            .toLowerCase()
                            .contains(string.toLowerCase())) {
                          var map = {};
                          map['provinceName'] = temp[i]['provinceName'];
                          map['index'] = temp[i]['index'];
                          filteredData.add(map);
                        }
                      }
                    } else {
                      for (int i = 0;
                          i < controller.dataCovidProvince.listData!.length;
                          i++) {
                        var map = {};
                        map['provinceName'] =
                            controller.dataCovidProvince.listData![i].key;
                        map['index'] = i;
                        filteredData.add(map);
                        temp.add(map);
                      }
                    }
                  });
                },
              ),
            ),
            FutureBuilder(
                future: controller.getDataCovidProvince(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('${snapshot.error}'),
                      ),
                    );
                  } else {
                    if (snapshot.hasError) {
                      return Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('${snapshot.error}'),
                        ),
                      );
                    } else {
                      CovidIndonesiaProv covid = controller.dataCovidProvince;
                      if (controller.first.value) {
                        for (int i = 0; i < covid.listData!.length; i++) {
                          var map = {};
                          map['provinceName'] = covid.listData![i].key;
                          map['index'] = i;
                          filteredData.add(map);
                          temp.add(map);
                        }

                        controller.first = false.obs;
                      }
                      print(
                          '${filteredData.length} : ${covid.listData!.length} : ${temp.length}');
                      return Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Container(
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.all(0),
                                      shrinkWrap: true,
                                      itemCount: filteredData.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProvinceDetailPage(
                                                          data: covid,
                                                          index: filteredData[
                                                              index]['index'])),
                                            );
                                          },
                                          child: ProvinceTile(
                                              title: covid
                                                  .listData![filteredData[index]
                                                      ['index']]
                                                  .key,
                                              widthKasus: (covid.listData![index].jumlahKasus! /
                                                      (covid.listData![index].jumlahKasus! +
                                                          covid.listData![index]
                                                              .jumlahSembuh! +
                                                          covid.listData![index]
                                                              .jumlahMeninggal! +
                                                          covid.listData![index]
                                                              .jumlahDirawat!)) *
                                                  (MediaQuery.of(context).size.width /
                                                      1.3),
                                              widthDirawat: (covid.listData![index].jumlahDirawat! /
                                                      (covid.listData![index].jumlahKasus! +
                                                          covid.listData![index].jumlahSembuh! +
                                                          covid.listData![index].jumlahMeninggal! +
                                                          covid.listData![index].jumlahDirawat!)) *
                                                  (MediaQuery.of(context).size.width / 1.3),
                                              widthMeninggal: (covid.listData![index].jumlahMeninggal! / (covid.listData![index].jumlahKasus! + covid.listData![index].jumlahSembuh! + covid.listData![index].jumlahMeninggal! + covid.listData![index].jumlahDirawat!)) * (MediaQuery.of(context).size.width / 1.3),
                                              widthSembuh: (covid.listData![index].jumlahSembuh! / (covid.listData![index].jumlahKasus! + covid.listData![index].jumlahSembuh! + covid.listData![index].jumlahMeninggal! + covid.listData![index].jumlahDirawat!)) * (MediaQuery.of(context).size.width / 1.3)),
                                        );
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                })
          ],
        ),
      ),
    );
  }
}

// class fungsi {
//   final BuildContext context;
//   final data;
//   final index;
//
//   fungsi(this.context, this.data, this.index);
//
//   getData() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) => ProvinceDetailPage(data: data, index: index)),
//     );
//   }
// }
