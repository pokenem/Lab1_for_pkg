import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color crntColor = Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Цветовые модели'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 150,
                width: 150,
                child: Container(
                  color: crntColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 50,
            ),
          )
        ],
      ),
    );
  }
}
