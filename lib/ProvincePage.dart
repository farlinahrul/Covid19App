import 'package:covid19app/CovidIndonesiaProv.dart';
import 'package:covid19app/CovidIndonesiaProvider.dart';
import 'package:covid19app/ProvinceDetailPage.dart';
import 'package:covid19app/ProvinceTile.dart';
import 'package:flutter/material.dart';

class ProvincePage extends StatefulWidget {
  @override
  _ProvincePageState createState() => _ProvincePageState();
}

class _ProvincePageState extends State<ProvincePage> {
  Future<CovidIndonesiaProv> covidIndonesiaProvData;
  var filteredData = <Map>[];
  var temp = <Map>[];

  bool first = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    covidIndonesiaProvData =
        CovidIndonesiaProvider().getDataCovidIndonesiaProv();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xe6ffffff),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            FutureBuilder<CovidIndonesiaProv>(
                future: covidIndonesiaProvData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('${snapshot.error}'),
                      ),
                    );
                  } else {
                    if (first) {
                      for (int i = 0; i < snapshot.data.listData.length; i++) {
                        var map = {};
                        map['provinceName'] = snapshot.data.listData[i].key;
                        map['index'] = i;
                        filteredData.add(map);
                        temp.add(map);
                      }

                      first = false;
                    }
                    print(
                        '${filteredData.length} : ${snapshot.data.listData.length} : ${temp.length}');
                    return Expanded(
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
                                  filteredData.clear();
                                  for (int i = 0; i < temp.length; i++) {
                                    if (temp[i]['provinceName']
                                        .toString()
                                        .toLowerCase()
                                        .contains(string.toLowerCase())) {
                                      var map = {};
                                      map['provinceName'] =
                                          temp[i]['provinceName'];
                                      map['index'] = temp[i]['index'];
                                      filteredData.add(map);
                                    }
                                  }
                                });
                              },
                            ),
                          ),
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
                                                builder: (context) => ProvinceDetailPage(data: snapshot.data, index: filteredData[index]['index'])),
                                          );
                                        },
                                        child: ProvinceTile(
                                            title: snapshot
                                                .data
                                                .listData[filteredData[index]
                                                    ['index']]
                                                .key,
                                            widthKasus: (snapshot.data.listData[index].jumlahKasus /
                                                    (snapshot.data.listData[index].jumlahKasus +
                                                        snapshot
                                                            .data
                                                            .listData[index]
                                                            .jumlahSembuh +
                                                        snapshot
                                                            .data
                                                            .listData[index]
                                                            .jumlahMeninggal +
                                                        snapshot
                                                            .data
                                                            .listData[index]
                                                            .jumlahDirawat)) *
                                                (MediaQuery.of(context).size.width /
                                                    1.3),
                                            widthDirawat: (snapshot
                                                        .data
                                                        .listData[index]
                                                        .jumlahDirawat /
                                                    (snapshot.data.listData[index].jumlahKasus +
                                                        snapshot.data.listData[index].jumlahSembuh +
                                                        snapshot.data.listData[index].jumlahMeninggal +
                                                        snapshot.data.listData[index].jumlahDirawat)) *
                                                (MediaQuery.of(context).size.width / 1.3),
                                            widthMeninggal: (snapshot.data.listData[index].jumlahMeninggal / (snapshot.data.listData[index].jumlahKasus + snapshot.data.listData[index].jumlahSembuh + snapshot.data.listData[index].jumlahMeninggal + snapshot.data.listData[index].jumlahDirawat)) * (MediaQuery.of(context).size.width / 1.3),
                                            widthSembuh: (snapshot.data.listData[index].jumlahSembuh / (snapshot.data.listData[index].jumlahKasus + snapshot.data.listData[index].jumlahSembuh + snapshot.data.listData[index].jumlahMeninggal + snapshot.data.listData[index].jumlahDirawat)) * (MediaQuery.of(context).size.width / 1.3)),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
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
