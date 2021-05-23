import 'package:covid19app/CovidIndonesiaProv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProvinceDetailPage extends StatelessWidget {
  final CovidIndonesiaProv data;
  final int index;

  const ProvinceDetailPage({Key key, this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = new NumberFormat("#,###");
    return Scaffold(
      backgroundColor: Color(0xeeffffff),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.redAccent,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Data COVID-19\n${data.listData[index].key}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 12),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 8, top: 12, left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Perkembangan COVID-19 di ${data.listData[index].key}',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 42, vertical: 12),
                    child: Column(
                      children: [
                        //data
                        Text(
                          'Total Data',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black26,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${formatter.format(data.listData[index].jumlahKasus)}',
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        'Positif',
                                        style: TextStyle(
                                            color: Colors.black26,
                                            // fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${formatter.format(data.listData[index].jumlahSembuh)}',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        'Sembuh',
                                        style: TextStyle(
                                            color: Colors.black26,
                                            // fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${formatter.format(data.listData[index].jumlahDirawat)}',
                                        style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        'Dirawat',
                                        style: TextStyle(
                                            color: Colors.black26,
                                            // fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${formatter.format(data.listData[index].jumlahMeninggal)}',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        'Meninggal',
                                        style: TextStyle(
                                            color: Colors.black26,
                                            // fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        // gender
                        Text(
                          'Jenis Kelamin',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black26,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${formatter.format(data.listData[index].jenisKelamin[0].docCount)}',
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        'Laki-Laki',
                                        style: TextStyle(
                                            color: Colors.black26,
                                            // fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${formatter.format(data.listData[index].jenisKelamin[1].docCount)}',
                                        style: TextStyle(
                                            color: Colors.pinkAccent,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        'Perempuan',
                                        style: TextStyle(
                                            color: Colors.black26,
                                            // fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        // umur
                        Text(
                          'Umur',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black26,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${formatter.format(data.listData[index].kelompokUmur[0].docCount)}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        '${data.listData[index].kelompokUmur[0].key}',
                                        style: TextStyle(
                                            color: Colors.black26,
                                            // fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${formatter.format(data.listData[index].kelompokUmur[1].docCount)}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        '${data.listData[index].kelompokUmur[1].key}',
                                        style: TextStyle(
                                            color: Colors.black26,
                                            // fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        // umur
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${formatter.format(data.listData[index].kelompokUmur[2].docCount)}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        '${data.listData[index].kelompokUmur[2].key}',
                                        style: TextStyle(
                                            color: Colors.black26,
                                            // fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${formatter.format(data.listData[index].kelompokUmur[3].docCount)}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        '${data.listData[index].kelompokUmur[3].key}',
                                        style: TextStyle(
                                            color: Colors.black26,
                                            // fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${formatter.format(data.listData[index].kelompokUmur[4].docCount)}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        '${data.listData[index].kelompokUmur[4].key}',
                                        style: TextStyle(
                                            color: Colors.black26,
                                            // fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${formatter.format(data.listData[index].kelompokUmur[5].docCount)}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        '${data.listData[index].kelompokUmur[5].key}',
                                        style: TextStyle(
                                            color: Colors.black26,
                                            // fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        // umur
                        ),
                        Text(
                          '${data.lastDate.day} / ${data.lastDate.month} / ${data.lastDate.year}',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black26,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
