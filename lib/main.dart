import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  var initializationSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification: (int id, String title, String body, String payload) async {},
  );
  InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS);
  flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if(payload != null) {
      debugPrint('notification payload' + payload);
    }
  });

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Intl Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Intl Demo Home Page'),
    );
  }
}

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
      //body: 
      floatingActionButton: new FloatingActionButton(
        onPressed: ()=>{ scheduleAlarm()},
        tooltip: 'Refresh',
        child: new Icon(Icons.refresh),
      ),
    );
  }
}

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  DateFormat dateFormat;
  DateFormat timeFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = new DateFormat.MMMEd('ru');
    timeFormat = new DateFormat.Hms('ru');
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  

  @override
  Widget build(BuildContext context) {
    var dateTime = new DateTime.now();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            new Text(timeFormat.format(dateTime)),
            new Text(dateFormat.format(dateTime)),
          ],
      )
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