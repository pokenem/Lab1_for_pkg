import 'package:flutter/material.dart';
import 'package:flutter_color_models/flutter_color_models.dart';

import 'models/color_classes.dart';

const List<String> list = <String>['RGB', 'CMYK', 'HSV', 'HLS', 'XYZ', 'LAB'];
const Map<String, dynamic> map = {
  'RGB': RgbClor(0, 0, 0),
  'CMYK': CmykClor(0, 0, 0, 0),
  'HSV': HsvClor(0, 0, 0),
};

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
  double _currentSliderValue1 = 0;
  double _currentSliderValue2 = 0;
  double _currentSliderValue3 = 0;
  String dropdownValue = list.first;

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
            padding: EdgeInsets.only(top: 20),
            child: DropdownButton(
              value: dropdownValue,
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
            ),
          ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 50,
              ),
              child: Slider(
                value: _currentSliderValue1,
                min: map[dropdownValue].leftLimit,
                max: map[dropdownValue].rightLimit,
                divisions: map[dropdownValue].cntDiv,
                label: _currentSliderValue1.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue1 = value;
                  });
                },
              ),
            ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 50,
            ),
            child: Slider(
              value: _currentSliderValue2,
              min: map[dropdownValue].leftLimit,
              max: map[dropdownValue].rightLimit,
              divisions: map[dropdownValue].cntDiv,
              label: _currentSliderValue2.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue2 = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 50,
            ),
            child: Slider(
              value: _currentSliderValue3,
              min: map[dropdownValue].leftLimit,
              max: map[dropdownValue].rightLimit,
              divisions: map[dropdownValue].cntDiv,
              label: _currentSliderValue3.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue3 = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
