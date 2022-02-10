import 'package:covid19app/controller/dashboard_controller.dart';
import 'package:covid19app/module/dashboard/component/DashboardDataTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/CovidIndonesia.dart';
import '../province/ProvincePage.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DashboardController controller = Get.put(DashboardController());
  final formatter = new NumberFormat("#,###");

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
            FutureBuilder(
              future: controller.getDataCovid(),
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
                    CovidIndonesia covid = controller.dataCovid;
                    int total = covid.update!.total!.jumlahPositif! +
                        covid.update!.total!.jumlahSembuh! +
                        covid.update!.total!.jumlahDirawat! +
                        covid.update!.total!.jumlahMeninggal!;
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
                                  width: (covid.update!.total!.jumlahPositif! /
                                          total) *
                                      MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              color: Colors.white, width: 1)),
                                      color: Colors.red),
                                ),
                                Container(
                                  width: (covid.update!.total!.jumlahSembuh! /
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
                                  width: (covid.update!.total!.jumlahDirawat! /
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
                                  width:
                                      (covid.update!.total!.jumlahMeninggal! /
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
                                      covid.update!.total!.jumlahPositif),
                                  title: 'Positif',
                                  color: Colors.redAccent),
                              DashboardDataTile(
                                  value: formatter.format(
                                      covid.update!.total!.jumlahSembuh),
                                  title: 'Sembuh',
                                  color: Colors.green),
                            ],
                          ),
                          Row(
                            children: [
                              DashboardDataTile(
                                  value: formatter.format(
                                      covid.update!.total!.jumlahDirawat),
                                  title: 'Sedang dirawat',
                                  color: Colors.lightBlue),
                              DashboardDataTile(
                                  value: formatter.format(
                                      covid.update!.total!.jumlahMeninggal),
                                  title: 'Meninggal',
                                  color: Colors.blue),
                            ],
                          ),
                          Text(
                              'Terakhir diupdate  : ${covid.update!.penambahan!.tanggal!.day} / ${covid.update!.penambahan!.tanggal!.month} / ${covid.update!.penambahan!.tanggal!.year}'),
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
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
