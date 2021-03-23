import 'package:flutter/material.dart';
import 'ClockView.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:test_app/main.dart';
import 'package:test_app/views/PillarAlarmView.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: ClockView(),
      ),
      body: PillarAlarm(),
      floatingActionButton: new FloatingActionButton(
        onPressed: ()=>{ scheduleAlarm()},
        tooltip: 'Refresh',
        child: new Icon(Icons.refresh),
      ),
    );
  }
}

void scheduleAlarm() async {
  //var dateTime = DateTime.now().add(Duration(seconds: 5));

/*await flutterLocalNotificationsPlugin.schedule(1, 'scheduled title', 'scheduled body',
        dateTime, const NotificationDetails(
        android: AndroidNotificationDetails( 'alarm_notif',
          'alarm_notif',
          'Channel for Alarm notification',
          importance: Importance.high),
        iOS: IOSNotificationDetails(
            //sound: 'a_long_cold_sting.wav',
            presentAlert: true,
            presentBadge: true,
            presentSound: true)));*/

await flutterLocalNotificationsPlugin.show(
    0, 'plain title', 'plain body', const NotificationDetails(
        android: AndroidNotificationDetails( 'alarm_notif',
          'alarm_notif',
          'Channel for Alarm notification', playSound: true, importance: Importance.max,priority: Priority.max),
        iOS: IOSNotificationDetails(
            //sound: 'a_long_cold_sting.wav',
            presentAlert: true,
            presentBadge: true,
            presentSound: true)),
    payload: 'item x');

    //flutterLocalNotificationsPlugin.cancelAll();
}