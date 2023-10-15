import 'package:flutter/material.dart';
import '../models/constarts.dart';

class optionCard extends StatelessWidget {
  const optionCard({
    Key? key,
    required this.option,
    required this.color,
    required this.imga,
  }) : super(key: key);
  final String option;
  final Color color;
  final String imga;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
        child: Center(
            child: Column(
          children: <Widget>[
            Container(
              child: Image.asset(option,
                  height: 90.0,
                  width: 90.0,
                  color: color.red != color.green
                      ? Colors.transparent
                      : Colors.transparent),
            ),
          ],
        )),
      ),
    );
  }
}
