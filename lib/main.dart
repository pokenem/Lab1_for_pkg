import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_color_models/flutter_color_models.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:lab1/models/range_formatter.dart';

import 'models/color_classes.dart';

const List<String> list = <String>['RGB', 'CMYK', 'HSV', 'HLS', 'XYZ', 'LAB'];
const Map<String, dynamic> map = {
  'RGB': RgbClor(0, 0, 0),
  'CMYK': CmykClor(0, 0, 0, 0),
  'HSV': HsvClor(0, 0, 0),
  'HLS': HlsClor(0, 0, 0),
  'XYZ': XyzClor(0, 0, 0),
  'LAB': LabClor(0, 0, 0),
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
                child: InkWell(
                  onTap: () {
                    pickColor(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: crntColor,
                    ),
                  ),
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
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 64, left: 50),
                child: Text(
                  map[dropdownValue].names[0],
                ),
              ),
              SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 100),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    controller: _controller1,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                      NumericRangeFormatter(min: map[dropdownValue].leftLimit[0], max: map[dropdownValue].rightLimit[0]),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue1 = double.parse(value);
                        changeSliderColor();
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 250,
                  right: 100,
                  top: 50,
                ),
                child: Slider(
                  value: _currentSliderValue1,
                  min: map[dropdownValue].leftLimit[0],
                  max: map[dropdownValue].rightLimit[0],
                  divisions: map[dropdownValue].cntDiv,
                  label: _currentSliderValue1.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue1 = value;
                      _controller1.text = value.toString();
                      changeSliderColor();
                    });
                  },
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 64, left: 50),
                child: Text(
                  map[dropdownValue].names[1],
                ),
              ),
              SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 100),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    controller: _controller2,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                      NumericRangeFormatter(min: map[dropdownValue].leftLimit[1], max: map[dropdownValue].rightLimit[1]),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue2 = double.parse(value);
                        changeSliderColor();
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 250,
                  right: 100,
                  top: 50,
                ),
                child: Slider(
                  value: _currentSliderValue2,
                  min: map[dropdownValue].leftLimit[1],
                  max: map[dropdownValue].rightLimit[1],
                  divisions: map[dropdownValue].cntDiv,
                  label: _currentSliderValue2.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue2 = value;
                      _controller2.text = value.toString();
                      changeSliderColor();
                    });
                  },
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 64, left: 50),
                child: Text(
                  map[dropdownValue].names[2],
                ),
              ),
              SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 100),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    controller: _controller3,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                      NumericRangeFormatter(min: map[dropdownValue].leftLimit[2], max: map[dropdownValue].rightLimit[2]),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue3 = double.parse(value);
                        changeSliderColor();
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 250,
                  right: 100,
                  top: 50,
                ),
                child: Slider(
                  value: _currentSliderValue3,
                  min: map[dropdownValue].leftLimit[2],
                  max: map[dropdownValue].rightLimit[2],
                  divisions: map[dropdownValue].cntDiv,
                  label: _currentSliderValue3.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue3 = value;
                      _controller3.text = value.toString();
                      changeSliderColor();
                    });
                  },
                ),
              ),
            ],
          ),
          if (dropdownValue == 'CMYK')
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 64, left: 50),
                  child: Text(
                    map[dropdownValue].names[3],
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, left: 100),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: _controller4,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                        NumericRangeFormatter(min: map[dropdownValue].leftLimit[3], max: map[dropdownValue].rightLimit[3]),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _currentSliderValue4 = double.parse(value);
                          changeSliderColor();
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                    right: 100,
                    top: 50,
                  ),
                  child: Slider(
                    value: _currentSliderValue4,
                    min: map[dropdownValue].leftLimit[3],
                    max: map[dropdownValue].rightLimit[3],
                    divisions: map[dropdownValue].cntDiv,
                    label: _currentSliderValue4.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue4 = value;
                        _controller4.text = value.toString();
                        changeSliderColor();
                      });
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget buildColorPicker() => ColorPicker(
        pickerColor: crntColor,
        enableAlpha: false,
        showLabel: false,
        onColorChanged: (color) {
          setState(() {
            crntColor = color;
            changeColor();
          });
        },
      );

  void pickColor(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Pick Your Color'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildColorPicker(),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('SELECT'),
                ),
              ),
            ],
          ),
        ),
      );

  void changeSliderColor() {
    switch (dropdownValue) {
      case 'RGB':
        {
          RgbColor rgbColor = RgbColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3);
          crntColor = rgbColor.toColor();
        }
        break;
      case 'CMYK':
        {
          CmykColor cmykColor = CmykColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3, _currentSliderValue4);
          crntColor = cmykColor.toColor();
        }
        break;
      case 'HSV':
        {
          crntColor = HSVColor.fromAHSV(1, _currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
        }
        break;
      case 'HLS':
        {
          crntColor = HslColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
        }
        break;
      case 'XYZ':
        {
          crntColor = XyzColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
        }
        break;
      case 'LAB':
        {
          crntColor = LabColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
        }
        break;
    }
  }

  void changeColor() {
    switch (dropdownValue) {
      case 'RGB':
        {
          RgbColor rgbColor = RgbColor.fromColor(crntColor);
          _currentSliderValue1 = rgbColor.red.toDouble();
          _currentSliderValue2 = rgbColor.green.toDouble();
          _currentSliderValue3 = rgbColor.blue.toDouble();
          _controller1.text = rgbColor.red.toString();
          _controller2.text = rgbColor.green.toString();
          _controller3.text = rgbColor.blue.toString();
        }
        break;
      case 'CMYK':
        {
          CmykColor cmykColor = CmykColor.fromColor(crntColor);
          _currentSliderValue1 = cmykColor.cyan.toDouble();
          _currentSliderValue2 = cmykColor.magenta.toDouble();
          _currentSliderValue3 = cmykColor.yellow.toDouble();
          _currentSliderValue4 = cmykColor.black.toDouble();
          _controller1.text = cmykColor.cyan.toString();
          _controller2.text = cmykColor.magenta.toString();
          _controller3.text = cmykColor.yellow.toString();
          _controller4.text = cmykColor.black.toString();
        }
        break;
      case 'HSV':
        {
          HSVColor hsvColor = HSVColor.fromColor(crntColor);
          _currentSliderValue1 = hsvColor.hue.toDouble();
          _currentSliderValue2 = hsvColor.saturation.toDouble();
          _currentSliderValue3 = hsvColor.value.toDouble();
          _controller1.text = hsvColor.hue.toString();
          _controller2.text = hsvColor.saturation.toString();
          _controller3.text = hsvColor.value.toString();
        }
        break;
      case 'HLS':
        {
          HslColor hslColor = HslColor.fromColor(crntColor);
          _currentSliderValue1 = hslColor.hue.toDouble();
          _currentSliderValue2 = hslColor.saturation.toDouble();
          _currentSliderValue3 = hslColor.lightness.toDouble();
          _controller1.text = hslColor.hue.toString();
          _controller2.text = hslColor.saturation.toString();
          _controller3.text = hslColor.lightness.toString();
        }
        break;
      case 'XYZ':
        {
          XyzColor xyzColor = XyzColor.fromColor(crntColor);
          _currentSliderValue1 = xyzColor.x.toDouble();
          _currentSliderValue2 = xyzColor.y.toDouble();
          _currentSliderValue3 = xyzColor.z.toDouble();
          _controller1.text = xyzColor.x.toString();
          _controller2.text = xyzColor.y.toString();
          _controller3.text = xyzColor.z.toString();
        }
        break;
      case 'LAB':
        {
          LabColor labColor = LabColor.fromColor(crntColor);
          _currentSliderValue1 = labColor.lightness.toDouble();
          _currentSliderValue2 = labColor.a.toDouble();
          _currentSliderValue3 = labColor.b.toDouble();
          _controller1.text = labColor.lightness.toString();
          _controller2.text = labColor.a.toString();
          _controller3.text = labColor.b.toString();
        }
        break;
    }
  }
}
