import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is t he root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Card(
                child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Введите текст'
                        ),
                      ),
                    ),
              ),
              TextButton(
                style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () { },
                child: Text('Вызвать уведомление'),
              )
            ],
          ),
        ),
      ),
    );
  }
}