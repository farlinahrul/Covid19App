import 'package:covid19app/DashboardDataTile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'CovidIndonesia.dart';
import 'CovidIndonesiaProvider.dart';
import 'ProvincePage.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Future<CovidIndonesia> covidIndonesiaData;
  final formatter = new NumberFormat("#,###");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    covidIndonesiaData = CovidIndonesiaProvider().getDataCovidIndonesia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xeeffffff),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.redAccent,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 54),
                child: Text(
                  'Data COVID-19\nINDONESIA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            FutureBuilder<CovidIndonesia>(
              future: covidIndonesiaData,
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
                  int total = snapshot.data.update.total.jumlahPositif +
                      snapshot.data.update.total.jumlahSembuh +
                      snapshot.data.update.total.jumlahDirawat +
                      snapshot.data.update.total.jumlahMeninggal;
                  return Expanded(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          width: double.infinity,
                          height: 15,
                          color: Colors.black38,
                          child: Row(
                            children: [
                              // Persentase
                              Container(
                                width:
                                    (snapshot.data.update.total.jumlahPositif / total) * MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(color: Colors.white, width: 1)),
                                    color: Colors.red),
                              ),
                              Container(
                                width:
                                    (snapshot.data.update.total.jumlahSembuh /
                                            total) *
                                        MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border: Border.symmetric(
                                      vertical: BorderSide(
                                          color: Colors.white, width: 1)),
                                  color: Colors.green,
                                ),
                              ),
                              Container(
                                width:
                                    (snapshot.data.update.total.jumlahDirawat /
                                            total) *
                                        MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border: Border.symmetric(
                                      vertical: BorderSide(
                                          color: Colors.white, width: 1)),
                                  color: Colors.lightBlue,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                width: (snapshot
                                            .data.update.total.jumlahMeninggal /
                                        total) *
                                    MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          color: Colors.white, width: 1)),
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            DashboardDataTile(
                                value: formatter.format(
                                    snapshot.data.update.total.jumlahPositif),
                                title: 'Positif',
                                color: Colors.redAccent),
                            DashboardDataTile(
                                value: formatter.format(
                                    snapshot.data.update.total.jumlahSembuh),
                                title: 'Sembuh',
                                color: Colors.green),
                          ],
                        ),
                        Row(
                          children: [
                            DashboardDataTile(
                                value: formatter.format(
                                    snapshot.data.update.total.jumlahDirawat),
                                title: 'Sedang dirawat',
                                color: Colors.lightBlue),
                            DashboardDataTile(
                                value: formatter.format(
                                    snapshot.data.update.total.jumlahMeninggal),
                                title: 'Meninggal',
                                color: Colors.blue),
                          ],
                        ),
                        Text(
                            'Terakhir diupdate  : ${snapshot.data.update.penambahan.tanggal.day} / ${snapshot.data.update.penambahan.tanggal.month} / ${snapshot.data.update.penambahan.tanggal.year}'),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProvincePage()),
                            );
                          },
                          child: Text('Detail data per provinsi'),
                        )
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
