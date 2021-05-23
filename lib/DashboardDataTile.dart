import 'package:flutter/material.dart';

class DashboardDataTile extends StatelessWidget {
  final value, title, color;

  const DashboardDataTile({Key key, this.value, this.title, this.color}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width:
      MediaQuery.of(context).size.width /
          2,
      // color: Colors.black,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
