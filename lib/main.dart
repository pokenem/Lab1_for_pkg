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
  double _currentSliderValue4 = 0;
  String dropdownValue = list.first;
  late TextEditingController _controller1;
  late TextEditingController _controller2;
  late TextEditingController _controller3;
  late TextEditingController _controller4;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Цветовые модели'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
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
            padding: const EdgeInsets.only(top: 20),
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
                  changeColor();

                });
              },
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(
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
                    changeSliderColor();
                  });
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(
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
                  changeSliderColor();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
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
                  changeSliderColor();
                });
              },
            ),
          ),
          if(dropdownValue == 'CMYK')
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 50,
              ),
              child: Slider(
                value: _currentSliderValue4,
                min: map[dropdownValue].leftLimit,
                max: map[dropdownValue].rightLimit,
                divisions: map[dropdownValue].cntDiv,
                label: _currentSliderValue4.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue4 = value;
                    changeSliderColor();
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
  void changeSliderColor() {
    switch(dropdownValue){
      case 'RGB' : {
        RgbColor rgbColor = RgbColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3);
        crntColor = rgbColor.toColor();
      }
      break;
      case 'CMYK' : {
        CmykColor cmykColor = CmykColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3, _currentSliderValue4);
        crntColor = cmykColor.toColor();
      }
      break;
      case 'HSV' : {
        crntColor = HSVColor.fromAHSV(1,_currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
      }
      break;
      case 'HLS' : {
        crntColor = HslColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
      }
      break;
      case 'XYZ' : {
        crntColor = XyzColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
      }
      break;
      case 'LAB' : {
        crntColor = LabColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
      }
      break;
    }
  }
  void changeColor(){
    switch(dropdownValue){
      case 'RGB' : {
        RgbColor.fromColor(crntColor);
      }
      break;
      case 'CMYK' : {
        CmykColor cmykColor = CmykColor.fromColor(crntColor);
        _currentSliderValue1 = cmykColor.cyan.toDouble();
        _currentSliderValue2 = cmykColor.magenta.toDouble();
        _currentSliderValue3 = cmykColor.yellow.toDouble();
        _currentSliderValue4 = cmykColor.black.toDouble();
      }
      break;
      case 'HSV' : {
        crntColor = HSVColor.fromAHSV(1,_currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
      }
      break;
      case 'HLS' : {
        crntColor = HslColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
      }
      break;
      case 'XYZ' : {
        crntColor = XyzColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
      }
      break;
      case 'LAB' : {
        crntColor = LabColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
      }
      break;
    }
  }
}
