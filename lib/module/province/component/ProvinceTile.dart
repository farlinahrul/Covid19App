import 'package:flutter/material.dart';

class ProvinceTile extends StatelessWidget {
  final title, widthKasus, widthSembuh, widthDirawat, widthMeninggal;

  const ProvinceTile({Key? key, this.title, this.widthKasus, this.widthSembuh, this.widthDirawat, this.widthMeninggal}) : super(key: key);


  @override
  Widget build(context) {
    return Container(
      padding:
      EdgeInsets.only(top: 24, bottom: 24, left: 12),
      margin: EdgeInsets.only(left: 8, right: 8, top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: widthKasus,
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Colors.white,
                                  width: 1)),
                          color: Colors.red),
                    ),
                    Container(
                      height: 10,
                      width: widthSembuh,
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Colors.white,
                                  width: 1)),
                          color: Colors.green),
                    ),
                    Container(
                      height: 10,
                      width: widthDirawat,
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Colors.white,
                                  width: 1)),
                          color: Colors.lightBlue),
                    ),
                    Container(
                      height: 10,
                      width: widthMeninggal,
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Colors.white,
                                  width: 1)),
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black26,
            ),
          ),
        ],
      ),
    );
  }
}
