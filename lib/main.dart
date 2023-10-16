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

String roundA(String a)
{
  if (a.contains(".") && a.split(".")[1].length > 3) {
    return a.split(".")[0] + "." + a.split('.')[1].substring(0,3);
  }
  return a;
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange >= 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String newString = newValue.text;
    if (newString.contains(".") && newString.split(".")[1].length > decimalRange) {
      return oldValue;
    } else {
      return newValue;
    }
  }
}

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
  double _currentSliderValue5 = 0;
  double _currentSliderValue6 = 0;
  double _currentSliderValue7 = 0;
  double _currentSliderValue8 = 0;
  double _currentSliderValue9 = 0;
  double _currentSliderValue10 = 0;
  double _currentSliderValue11 = 0;
  double _currentSliderValue12 = 0;
  String dropdownValue = list.first;
  String dropdownValue1 = list.first;
  String dropdownValue2 = list.first;
  late TextEditingController _controller1;
  late TextEditingController _controller2;
  late TextEditingController _controller3;
  late TextEditingController _controller4;
  late TextEditingController _controller5;
  late TextEditingController _controller6;
  late TextEditingController _controller7;
  late TextEditingController _controller8;
  late TextEditingController _controller9;
  late TextEditingController _controller10;
  late TextEditingController _controller11;
  late TextEditingController _controller12;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();
    _controller5 = TextEditingController();
    _controller6 = TextEditingController();
    _controller7 = TextEditingController();
    _controller8 = TextEditingController();
    _controller9 = TextEditingController();
    _controller10 = TextEditingController();
    _controller11 = TextEditingController();
    _controller12 = TextEditingController();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _controller7.dispose();
    _controller8.dispose();
    _controller9.dispose();
    _controller10.dispose();
    _controller11.dispose();
    _controller12.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Цветовые модели'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
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
                        changeColor(1);
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
                            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*' )),
                            NumericRangeFormatter(min: map[dropdownValue].leftLimit[0], max: map[dropdownValue].rightLimit[0]),
                            DecimalTextInputFormatter(decimalRange: 3),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _currentSliderValue1 = double.parse(value);
                              changeSliderColor(1);
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
                            _controller1.text = roundA(value.toString());
                            changeSliderColor(1);
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
                            DecimalTextInputFormatter(decimalRange: 3),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _currentSliderValue2 = double.parse(value);
                              changeSliderColor(1);
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
                            _controller2.text = roundA(value.toString());
                            changeSliderColor(1);
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
                            DecimalTextInputFormatter(decimalRange: 3),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _currentSliderValue3 = double.parse(value);
                              changeSliderColor(1);
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
                            _controller3.text = roundA(value.toString());
                            changeSliderColor(1);
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
                              DecimalTextInputFormatter(decimalRange: 3),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _currentSliderValue4 = double.parse(value);
                                changeSliderColor(1);
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
                              _controller4.text = roundA(value.toString());
                              changeSliderColor(1);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: DropdownButton(
                    value: dropdownValue1,
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue1 = value!;
                        changeColor(2);
                      });
                    },
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 64, left: 50),
                      child: Text(
                        map[dropdownValue1].names[0],
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
                          controller: _controller5,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                            NumericRangeFormatter(min: map[dropdownValue1].leftLimit[0], max: map[dropdownValue1].rightLimit[0]),
                            DecimalTextInputFormatter(decimalRange: 3),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _currentSliderValue5 = double.parse(value);
                              changeSliderColor(2);
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
                        value: _currentSliderValue5,
                        min: map[dropdownValue1].leftLimit[0],
                        max: map[dropdownValue1].rightLimit[0],
                        divisions: map[dropdownValue1].cntDiv,
                        label: _currentSliderValue5.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue5 = value;
                            _controller5.text = roundA(value.toString());
                            changeSliderColor(2);
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
                        map[dropdownValue1].names[1],
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
                          controller: _controller6,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                            NumericRangeFormatter(min: map[dropdownValue1].leftLimit[1], max: map[dropdownValue1].rightLimit[1]),
                            DecimalTextInputFormatter(decimalRange: 3),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _currentSliderValue6 = double.parse(value);
                              changeSliderColor(2);
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
                        value: _currentSliderValue6,
                        min: map[dropdownValue1].leftLimit[1],
                        max: map[dropdownValue1].rightLimit[1],
                        divisions: map[dropdownValue1].cntDiv,
                        label: _currentSliderValue6.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue6 = value;
                            _controller6.text = roundA(value.toString());
                            changeSliderColor(2);
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
                        map[dropdownValue1].names[2],
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
                          controller: _controller7,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                            NumericRangeFormatter(min: map[dropdownValue1].leftLimit[2], max: map[dropdownValue1].rightLimit[2]),
                            DecimalTextInputFormatter(decimalRange: 3),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _currentSliderValue7 = double.parse(value);
                              changeSliderColor(2);
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
                        value: _currentSliderValue7,
                        min: map[dropdownValue1].leftLimit[2],
                        max: map[dropdownValue1].rightLimit[2],
                        divisions: map[dropdownValue1].cntDiv,
                        label: _currentSliderValue7.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue7 = value;
                            _controller7.text = roundA(value.toString());
                            changeSliderColor(2);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                if (dropdownValue1 == 'CMYK')
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 64, left: 50),
                        child: Text(
                          map[dropdownValue1].names[3],
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
                            controller: _controller8,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                              NumericRangeFormatter(min: map[dropdownValue1].leftLimit[3], max: map[dropdownValue1].rightLimit[3]),
                              DecimalTextInputFormatter(decimalRange: 3),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _currentSliderValue8 = double.parse(value);
                                changeSliderColor(2);
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
                          value: _currentSliderValue8,
                          min: map[dropdownValue1].leftLimit[3],
                          max: map[dropdownValue1].rightLimit[3],
                          divisions: map[dropdownValue1].cntDiv,
                          label: _currentSliderValue8.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue8 = value;
                              _controller8.text = roundA(value.toString());
                              changeSliderColor(2);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: DropdownButton(
                    value: dropdownValue2,
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue2 = value!;
                        changeColor(3);
                      });
                    },
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 64, left: 50),
                      child: Text(
                        map[dropdownValue2].names[0],
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
                          controller: _controller9,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                            NumericRangeFormatter(min: map[dropdownValue2].leftLimit[0], max: map[dropdownValue2].rightLimit[0]),
                            DecimalTextInputFormatter(decimalRange: 3),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _currentSliderValue9 = double.parse(value);
                              changeSliderColor(3);
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
                        value: _currentSliderValue9,
                        min: map[dropdownValue2].leftLimit[0],
                        max: map[dropdownValue2].rightLimit[0],
                        divisions: map[dropdownValue2].cntDiv,
                        label: _currentSliderValue9.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue9 = value;
                            _controller9.text = roundA(value.toString());
                            changeSliderColor(3);
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
                        map[dropdownValue2].names[1],
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
                          controller: _controller10,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                            NumericRangeFormatter(min: map[dropdownValue2].leftLimit[1], max: map[dropdownValue2].rightLimit[1]),
                            DecimalTextInputFormatter(decimalRange: 3),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _currentSliderValue10 = double.parse(value);
                              changeSliderColor(3);
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
                        value: _currentSliderValue10,
                        min: map[dropdownValue2].leftLimit[1],
                        max: map[dropdownValue2].rightLimit[1],
                        divisions: map[dropdownValue2].cntDiv,
                        label: _currentSliderValue10.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue10 = value;
                            _controller10.text = roundA(value.toString());
                            changeSliderColor(3);
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
                        map[dropdownValue2].names[2],
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
                          controller: _controller11,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                            NumericRangeFormatter(min: map[dropdownValue2].leftLimit[2], max: map[dropdownValue2].rightLimit[2]),
                            DecimalTextInputFormatter(decimalRange: 3),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _currentSliderValue11 = double.parse(value);
                              changeSliderColor(3);
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
                        value: _currentSliderValue11,
                        min: map[dropdownValue2].leftLimit[2],
                        max: map[dropdownValue2].rightLimit[2],
                        divisions: map[dropdownValue2].cntDiv,
                        label: _currentSliderValue11.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue11 = value;
                            _controller11.text = roundA(value.toString());
                            changeSliderColor(3);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                if (dropdownValue2 == 'CMYK')
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 64, left: 50),
                        child: Text(
                          map[dropdownValue2].names[3],
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
                            controller: _controller12,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                              NumericRangeFormatter(min: map[dropdownValue2].leftLimit[3], max: map[dropdownValue2].rightLimit[3]),
                              DecimalTextInputFormatter(decimalRange: 3),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _currentSliderValue12 = double.parse(value);
                                changeSliderColor(3);
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
                          value: _currentSliderValue12,
                          min: map[dropdownValue2].leftLimit[3],
                          max: map[dropdownValue2].rightLimit[3],
                          divisions: map[dropdownValue2].cntDiv,
                          label: _currentSliderValue12.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue12 = value;
                              _controller12.text = roundA(value.toString());
                              changeSliderColor(3);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
              ],
            ),
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
            changeColor(4);
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

  void changeSliderColor(int i) {
    if(i == 1) {
      switch (dropdownValue) {
        case 'RGB':
          {
            RgbColor rgbColor = RgbColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3);
            crntColor = rgbColor.toColor();
            changeColor(2);
            changeColor(3);
          }
          break;
        case 'CMYK':
          {
            CmykColor cmykColor = CmykColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3, _currentSliderValue4);
            crntColor = cmykColor.toColor();
            changeColor(2);
            changeColor(3);
          }
          break;
        case 'HSV':
          {
            crntColor = HSVColor.fromAHSV(1, _currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
            changeColor(2);
            changeColor(3);
          }
          break;
        case 'HLS':
          {
            crntColor = HslColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
            changeColor(2);
            changeColor(3);
          }
          break;
        case 'XYZ':
          {
            crntColor = XyzColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
            changeColor(2);
            changeColor(3);
          }
          break;
        case 'LAB':
          {
            crntColor = LabColor(_currentSliderValue1, _currentSliderValue2, _currentSliderValue3).toColor();
            changeColor(2);
            changeColor(3);
          }
          break;
      }
    } else if(i == 2)
      {
        switch (dropdownValue1) {
          case 'RGB':
            {
              RgbColor rgbColor = RgbColor(_currentSliderValue5, _currentSliderValue6, _currentSliderValue7);
              crntColor = rgbColor.toColor();
              changeColor(1);
              changeColor(3);
            }
            break;
          case 'CMYK':
            {
              CmykColor cmykColor = CmykColor(_currentSliderValue5, _currentSliderValue6, _currentSliderValue7, _currentSliderValue8);
              crntColor = cmykColor.toColor();
              changeColor(1);
              changeColor(3);
            }
            break;
          case 'HSV':
            {
              crntColor = HSVColor.fromAHSV(1, _currentSliderValue5, _currentSliderValue6, _currentSliderValue7).toColor();
              changeColor(1);
              changeColor(3);
            }
            break;
          case 'HLS':
            {
              crntColor = HslColor(_currentSliderValue5, _currentSliderValue6, _currentSliderValue7).toColor();
              changeColor(1);
              changeColor(3);
            }
            break;
          case 'XYZ':
            {
              crntColor = XyzColor(_currentSliderValue5, _currentSliderValue6, _currentSliderValue7).toColor();
              changeColor(1);
              changeColor(3);
            }
            break;
          case 'LAB':
            {
              crntColor = LabColor(_currentSliderValue5, _currentSliderValue6, _currentSliderValue7).toColor();
              changeColor(1);
              changeColor(3);
            }
            break;
        }
      } else if(i == 3)
        {
          switch (dropdownValue2) {
            case 'RGB':
              {
                RgbColor rgbColor = RgbColor(_currentSliderValue9, _currentSliderValue10, _currentSliderValue11);
                crntColor = rgbColor.toColor();
                changeColor(1);
                changeColor(2);
              }
              break;
            case 'CMYK':
              {
                CmykColor cmykColor = CmykColor(_currentSliderValue9, _currentSliderValue10, _currentSliderValue11, _currentSliderValue12);
                crntColor = cmykColor.toColor();
                changeColor(1);
                changeColor(2);
              }
              break;
            case 'HSV':
              {
                crntColor = HSVColor.fromAHSV(1, _currentSliderValue9, _currentSliderValue10, _currentSliderValue11).toColor();
                changeColor(1);
                changeColor(2);
              }
              break;
            case 'HLS':
              {
                crntColor = HslColor(_currentSliderValue9, _currentSliderValue10, _currentSliderValue11).toColor();
                changeColor(1);
                changeColor(2);
              }
              break;
            case 'XYZ':
              {
                crntColor = XyzColor(_currentSliderValue9, _currentSliderValue10, _currentSliderValue11).toColor();
                changeColor(1);
                changeColor(2);
              }
              break;
            case 'LAB':
              {
                crntColor = LabColor(_currentSliderValue9, _currentSliderValue10, _currentSliderValue11).toColor();
                changeColor(1);
                changeColor(2);
              }
              break;
          }
        }
    _controller1.text = roundA(_controller1.text);
    _controller2.text = roundA(_controller2.text);
    _controller3.text = roundA(_controller3.text);
    _controller4.text = roundA(_controller4.text);
    _controller5.text = roundA(_controller5.text);
    _controller6.text = roundA(_controller6.text);
    _controller7.text = roundA(_controller7.text);
    _controller8.text = roundA(_controller8.text);
    _controller9.text = roundA(_controller9.text);
    _controller10.text = roundA(_controller10.text);
    _controller11.text = roundA(_controller11.text);
    _controller12.text = roundA(_controller12.text);
  }

  void changeColor(int i) {
    if(i == 4)
      {
        changeColor(1);
        changeColor(2);
        changeColor(3);
      }
    if(i == 1) {
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
    } else if(i == 2) {
      switch (dropdownValue1) {
        case 'RGB':
          {
            RgbColor rgbColor = RgbColor.fromColor(crntColor);
            _currentSliderValue5 = rgbColor.red.toDouble();
            _currentSliderValue6 = rgbColor.green.toDouble();
            _currentSliderValue7 = rgbColor.blue.toDouble();
            _controller5.text = rgbColor.red.toString();
            _controller6.text = rgbColor.green.toString();
            _controller7.text = rgbColor.blue.toString();
          }
          break;
        case 'CMYK':
          {
            CmykColor cmykColor = CmykColor.fromColor(crntColor);
            _currentSliderValue5 = cmykColor.cyan.toDouble();
            _currentSliderValue6 = cmykColor.magenta.toDouble();
            _currentSliderValue7 = cmykColor.yellow.toDouble();
            _currentSliderValue8 = cmykColor.black.toDouble();
            _controller5.text = cmykColor.cyan.toString();
            _controller6.text = cmykColor.magenta.toString();
            _controller7.text = cmykColor.yellow.toString();
            _controller8.text = cmykColor.black.toString();
          }
          break;
        case 'HSV':
          {
            HSVColor hsvColor = HSVColor.fromColor(crntColor);
            _currentSliderValue5 = hsvColor.hue.toDouble();
            _currentSliderValue6 = hsvColor.saturation.toDouble();
            _currentSliderValue7 = hsvColor.value.toDouble();
            _controller5.text = hsvColor.hue.toString();
            _controller6.text = hsvColor.saturation.toString();
            _controller7.text = hsvColor.value.toString();
          }
          break;
        case 'HLS':
          {
            HslColor hslColor = HslColor.fromColor(crntColor);
            _currentSliderValue5 = hslColor.hue.toDouble();
            _currentSliderValue6 = hslColor.saturation.toDouble();
            _currentSliderValue7 = hslColor.lightness.toDouble();
            _controller5.text = hslColor.hue.toString();
            _controller6.text = hslColor.saturation.toString();
            _controller7.text = hslColor.lightness.toString();
          }
          break;
        case 'XYZ':
          {
            XyzColor xyzColor = XyzColor.fromColor(crntColor);
            _currentSliderValue5 = xyzColor.x.toDouble();
            _currentSliderValue6 = xyzColor.y.toDouble();
            _currentSliderValue7 = xyzColor.z.toDouble();
            _controller5.text = xyzColor.x.toString();
            _controller6.text = xyzColor.y.toString();
            _controller7.text = xyzColor.z.toString();
          }
          break;
        case 'LAB':
          {
            LabColor labColor = LabColor.fromColor(crntColor);
            _currentSliderValue5 = labColor.lightness.toDouble();
            _currentSliderValue6 = labColor.a.toDouble();
            _currentSliderValue7 = labColor.b.toDouble();
            _controller5.text = labColor.lightness.toString();
            _controller6.text = labColor.a.toString();
            _controller7.text = labColor.b.toString();
          }
          break;
      }
    } else if(i == 3)
      {
        switch (dropdownValue2) {
          case 'RGB':
            {
              RgbColor rgbColor = RgbColor.fromColor(crntColor);
              _currentSliderValue9 = rgbColor.red.toDouble();
              _currentSliderValue10 = rgbColor.green.toDouble();
              _currentSliderValue11 = rgbColor.blue.toDouble();
              _controller9.text = rgbColor.red.toString();
              _controller10.text = rgbColor.green.toString();
              _controller11.text = rgbColor.blue.toString();
            }
            break;
          case 'CMYK':
            {
              CmykColor cmykColor = CmykColor.fromColor(crntColor);
              _currentSliderValue9 = cmykColor.cyan.toDouble();
              _currentSliderValue10 = cmykColor.magenta.toDouble();
              _currentSliderValue11 = cmykColor.yellow.toDouble();
              _currentSliderValue12 = cmykColor.black.toDouble();
              _controller9.text = cmykColor.cyan.toString();
              _controller10.text = cmykColor.magenta.toString();
              _controller11.text = cmykColor.yellow.toString();
              _controller12.text = cmykColor.black.toString();
            }
            break;
          case 'HSV':
            {
              HSVColor hsvColor = HSVColor.fromColor(crntColor);
              _currentSliderValue9 = hsvColor.hue.toDouble();
              _currentSliderValue10 = hsvColor.saturation.toDouble();
              _currentSliderValue11 = hsvColor.value.toDouble();
              _controller9.text = hsvColor.hue.toString();
              _controller10.text = hsvColor.saturation.toString();
              _controller11.text = hsvColor.value.toString();
            }
            break;
          case 'HLS':
            {
              HslColor hslColor = HslColor.fromColor(crntColor);
              _currentSliderValue9 = hslColor.hue.toDouble();
              _currentSliderValue10 = hslColor.saturation.toDouble();
              _currentSliderValue11 = hslColor.lightness.toDouble();
              _controller9.text = hslColor.hue.toString();
              _controller10.text = hslColor.saturation.toString();
              _controller11.text = hslColor.lightness.toString();
            }
            break;
          case 'XYZ':
            {
              XyzColor xyzColor = XyzColor.fromColor(crntColor);
              _currentSliderValue9 = xyzColor.x.toDouble();
              _currentSliderValue10 = xyzColor.y.toDouble();
              _currentSliderValue11 = xyzColor.z.toDouble();
              _controller9.text = xyzColor.x.toString();
              _controller10.text = xyzColor.y.toString();
              _controller11.text = xyzColor.z.toString();
            }
            break;
          case 'LAB':
            {
              LabColor labColor = LabColor.fromColor(crntColor);
              _currentSliderValue9 = labColor.lightness.toDouble();
              _currentSliderValue10 = labColor.a.toDouble();
              _currentSliderValue11 = labColor.b.toDouble();
              _controller9.text = labColor.lightness.toString();
              _controller10.text = labColor.a.toString();
              _controller11.text = labColor.b.toString();
            }
            break;
        }
      }
    _controller1.text = roundA(_controller1.text);
    _controller2.text = roundA(_controller2.text);
    _controller3.text = roundA(_controller3.text);
    _controller4.text = roundA(_controller4.text);
    _controller5.text = roundA(_controller5.text);
    _controller6.text = roundA(_controller6.text);
    _controller7.text = roundA(_controller7.text);
    _controller8.text = roundA(_controller8.text);
    _controller9.text = roundA(_controller9.text);
    _controller10.text = roundA(_controller10.text);
    _controller11.text = roundA(_controller11.text);
    _controller12.text = roundA(_controller12.text);
  }

}
