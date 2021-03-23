import 'package:flutter/material.dart';
import 'package:test_app/data.dart';

class PillarAlarm extends StatefulWidget {
  @override
  _PillarAlarmState createState() => _PillarAlarmState();
}

class _PillarAlarmState extends State<PillarAlarm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Text(
            'Alarm',
            style: TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 24),
          ),
          Expanded(
            child: ListView(
              children: notifications.map((alarm) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  //height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.blue],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.label,
                              color:  Colors.white,
                              size: 24,
                            ),
                            Text(
                              'Pillar1',
                              style: TextStyle(
                                color: Colors.white, fontFamily: 'avenir'
                              ),
                            )
                          ]
                        )
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            )
          )
        ]
      ),
    );
  }
}