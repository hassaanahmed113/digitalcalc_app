import 'dart:async';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:Digicalc_App/util/CustomWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CustomWidget customWidget = CustomWidget();
  List<dynamic> calc = [];
  List<dynamic> resultcalc = [];
  var result = "";
  var data = "";
  late Future<bool> _imageLoaded;
  late ImageProvider _backgroundImage;
  int insertionIndex = 0;

  @override
  void initState() {
    super.initState();
    _backgroundImage = AssetImage("assets/Untitled design.png");
    _imageLoaded = _loadImage();
    _loadData();
  }

  // Load data from local storage
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      calc = (prefs.getStringList('calc') ?? []).cast<dynamic>();
      resultcalc = (prefs.getStringList('resultcalc') ?? []).cast<dynamic>();
    });
  }

  // Save data to local storage
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('calc', calc.map((item) => item.toString()).toList());
    prefs.setStringList(
        'resultcalc', resultcalc.map((item) => item.toString()).toList());
  }

  void _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      calc.clear();
      resultcalc.clear();
    });
  }

  String formatSciNotation(num value) {
    String valueStr = value.toString();
    if (valueStr.contains("e")) {
      List<String> parts = valueStr.split("e");
      double significand = double.parse(parts[0]);
      int exponent = int.parse(parts[1]);
      return "${significand.toStringAsFixed(1)}e+$exponent";
    } else if (value is double) {
      int intValue = value.toInt();
      return (value == intValue) ? intValue.toString() : value.toString();
    } else {
      return value.toString();
    }
  }

  Future<bool> _loadImage() async {
    final Completer<bool> completer = Completer<bool>();
    final ImageStream stream =
        _backgroundImage.resolve(const ImageConfiguration());

    stream.addListener(
        ImageStreamListener((ImageInfo info, bool synchronousCall) {
      completer.complete(true);
    }));

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      // Lock the screen orientation to portrait or landscape
      if (orientation == Orientation.portrait) {
        return FutureBuilder<bool>(
            future: _imageLoaded,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.pink[200],
                ));
              } else if (snapshot.hasError) {
                return Center(child: Text("Failed to load image"));
              } else {
                return SafeArea(
                  child: Scaffold(
                      body: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/Untitled design.png"),
                                  fit: BoxFit.cover)),
                          child: customWidget.paddingWid(
                            EdgeInsets.symmetric(horizontal: 20),
                            Column(
                              children: [
                                customWidget.alignmentWid(
                                  Alignment.topLeft,
                                  customWidget.listResult(
                                      calc,
                                      resultcalc,
                                      calc.length,
                                      150,
                                      19,
                                      22,
                                      EdgeInsets.symmetric(vertical: 10)),
                                ),
                                customWidget.alignmentWid(
                                  Alignment.topRight,
                                  customWidget.paddingWid(
                                    EdgeInsets.only(right: 10),
                                    TextButton(
                                        onPressed: () {
                                          _clearData();
                                        },
                                        child: customWidget.textWid(
                                            "Clear History",
                                            Colors.white,
                                            15,
                                            FontWeight.bold,
                                            GoogleFonts.roboto().fontFamily)),
                                  ),
                                ),

                                customWidget.boxheight(5),
                                customWidget.fieldtextWid(24),
                                customWidget.boxheight(15),
                                customWidget.alignmentWid(
                                  Alignment.topRight,
                                  customWidget.paddingWid(
                                    EdgeInsets.symmetric(horizontal: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomWidget().textWid(
                                            result,
                                            Colors.white,
                                            31,
                                            FontWeight.bold,
                                            GoogleFonts.roboto().fontFamily),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            customWidget.inkwellWid(
                                              () {
                                                //(
                                                setState(() {
                                                  var text = customWidget
                                                      .textcontroller.text;
                                                  var text1 = text == ""
                                                      ? ""
                                                      : text.substring(
                                                          0, text.length - 1);

                                                  customWidget.textcontroller
                                                      .text = text1;
                                                });
                                              },
                                              customWidget.containerWid1(
                                                  52,
                                                  50,
                                                  BorderRadius.all(
                                                      Radius.circular(12)),
                                                  Color(0xff363035),
                                                  "assets/Untitled design (1).png"),
                                            ),
                                            customWidget.boxwidth(15),
                                            customWidget.inkwellWid(
                                              () {
                                                //(
                                                setState(() {
                                                  customWidget.textcontroller
                                                          .text.isEmpty
                                                      ? customWidget
                                                          .textcontroller
                                                          .text = "("
                                                      : customWidget
                                                              .textcontroller
                                                              .text =
                                                          "${customWidget.textcontroller.text}(";
                                                });
                                              },
                                              customWidget.containerWid(
                                                  50,
                                                  48,
                                                  BorderRadius.all(
                                                      Radius.circular(12)),
                                                  Color(0xff740076),
                                                  "(",
                                                  Colors.white,
                                                  28,
                                                  FontWeight.bold,
                                                  GoogleFonts.roboto()
                                                      .fontFamily),
                                            ),
                                            customWidget.boxwidth(15),
                                            customWidget.inkwellWid(
                                              () {
                                                //)
                                                setState(() {
                                                  customWidget.textcontroller
                                                          .text.isEmpty
                                                      ? customWidget
                                                          .textcontroller
                                                          .text = ""
                                                      : customWidget
                                                              .textcontroller
                                                              .text =
                                                          "${customWidget.textcontroller.text})";
                                                });
                                              },
                                              customWidget.containerWid(
                                                  50,
                                                  48,
                                                  BorderRadius.all(
                                                      Radius.circular(12)),
                                                  Color(0xff740076),
                                                  ")",
                                                  Colors.white,
                                                  28,
                                                  FontWeight.bold,
                                                  GoogleFonts.roboto()
                                                      .fontFamily),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                customWidget.boxheight(30),
                                // grid 1 C % ÷ ×

                                customWidget.gridData1(() {
                                  setState(() {
                                    customWidget.textcontroller.clear();
                                  });
                                }, () {
                                  //x²
                                  if (customWidget
                                      .textcontroller.text.isNotEmpty) {
                                    setState(() {
                                      String expression =
                                          customWidget.textcontroller.text;
                                      Parser parser = Parser();
                                      Expression exp = parser.parse(expression);
                                      ContextModel contextModel =
                                          ContextModel();
                                      num eval = exp.evaluate(
                                          EvaluationType.REAL, contextModel);
                                      num dataa = eval * eval;
                                      if (eval % 1 == 0) {
                                        result = dataa.toInt().toString();
                                      } else {
                                        result = dataa.toStringAsFixed(1);
                                      }
                                      calc.add(
                                          customWidget.textcontroller.text);
                                      resultcalc.add(result);
                                      _saveData();
                                      print(result);
                                    });
                                  }
                                }, () {
                                  //÷
                                  setState(() {
                                    customWidget.textcontroller.text.isEmpty
                                        ? customWidget.textcontroller.text = ""
                                        : customWidget.textcontroller.text =
                                            "${customWidget.textcontroller.text}/";
                                  });
                                }, () {
                                  //x
                                  setState(() {
                                    customWidget.textcontroller.text.isEmpty
                                        ? customWidget.textcontroller.text = ""
                                        : customWidget.textcontroller.text =
                                            "${customWidget.textcontroller.text}*";
                                  });
                                }, () {
                                  //7
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "7"
                                        : "${customWidget.textcontroller.text}7";
                                  });
                                }, () {
                                  //8
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "8"
                                        : "${customWidget.textcontroller.text}8";
                                  });
                                }, () {
                                  //9
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "9"
                                        : "${customWidget.textcontroller.text}9";
                                  });
                                }, () {
                                  //minus
                                  setState(() {
                                    customWidget.textcontroller.text.isEmpty
                                        ? customWidget.textcontroller.text = "-"
                                        : customWidget.textcontroller.text =
                                            "${customWidget.textcontroller.text}-";
                                  });
                                }, () {
                                  //4
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "4"
                                        : "${customWidget.textcontroller.text}4";
                                  });
                                }, () {
                                  //5
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "5"
                                        : "${customWidget.textcontroller.text}5";
                                  });
                                }, () {
                                  //6
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "6"
                                        : "${customWidget.textcontroller.text}6";
                                  });
                                }, () {
                                  //plus
                                  setState(() {
                                    customWidget.textcontroller.text.isEmpty
                                        ? customWidget.textcontroller.text = ""
                                        : customWidget.textcontroller.text =
                                            "${customWidget.textcontroller.text}+";
                                  });
                                }, () {
                                  //1
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "1"
                                        : "${customWidget.textcontroller.text}1";
                                  });
                                }, () {
                                  //2
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "2"
                                        : "${customWidget.textcontroller.text}2";
                                  });
                                }, () {
                                  //3
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "3"
                                        : "${customWidget.textcontroller.text}3";
                                  });
                                }, () {
                                  //functionfactorial
                                  if (customWidget
                                      .textcontroller.text.isNotEmpty) {
                                    setState(() {
                                      String expression =
                                          customWidget.textcontroller.text;
                                      Parser parser = Parser();
                                      Expression exp = parser.parse(expression);
                                      ContextModel contextModel =
                                          ContextModel();
                                      num eval = exp.evaluate(
                                          EvaluationType.REAL, contextModel);

                                      for (num i = eval - 1; i > 0; i--) {
                                        eval *= i;
                                      }
                                      result = formatSciNotation(eval);
                                      calc.add(
                                          customWidget.textcontroller.text);
                                      resultcalc.add(result);
                                      _saveData();
                                      print(result);
                                    });
                                  }
                                }, () {
                                  //0
                                  setState(() {
                                    customWidget.textcontroller.text.isEmpty
                                        ? customWidget.textcontroller.text = ""
                                        : customWidget.textcontroller.text =
                                            "${customWidget.textcontroller.text}0";
                                  });
                                }, () {
                                  //dot
                                  setState(() {
                                    customWidget.textcontroller.text.isEmpty
                                        ? customWidget.textcontroller.text = ""
                                        : customWidget.textcontroller.text =
                                            "${customWidget.textcontroller.text}.";
                                  });
                                }, () {
                                  //functionsqrt
                                  if (customWidget
                                      .textcontroller.text.isNotEmpty) {
                                    setState(() {
                                      String expression =
                                          customWidget.textcontroller.text;
                                      Parser parser = Parser();
                                      Expression exp = parser.parse(expression);
                                      ContextModel contextModel =
                                          ContextModel();
                                      num eval = exp.evaluate(
                                          EvaluationType.REAL, contextModel);

                                      double exp1 = sqrt(eval);
                                      if (exp1 % 1 == 0) {
                                        result = exp1.toInt().toString();
                                      } else {
                                        result = exp1.toStringAsFixed(1);
                                      }
                                      calc.add(
                                          customWidget.textcontroller.text);
                                      resultcalc.add(result);
                                      _saveData();
                                      print(result);
                                    });
                                  }
                                }, () {
                                  //functionequaltoclick
                                  if (customWidget
                                      .textcontroller.text.isNotEmpty) {
                                    setState(() {
                                      String expression =
                                          customWidget.textcontroller.text;
                                      Parser parser = Parser();
                                      Expression exp = parser.parse(expression);
                                      ContextModel contextModel =
                                          ContextModel();
                                      num eval = exp.evaluate(
                                          EvaluationType.REAL, contextModel);
                                      if (eval % 1 == 0) {
                                        result = eval.toInt().toString();
                                      } else {
                                        result = eval.toStringAsFixed(1);
                                      }

                                      calc.add(
                                          customWidget.textcontroller.text);
                                      resultcalc.add(result);
                                      _saveData();

                                      print(result);
                                    });
                                  }
                                }),
                              ],
                            ),
                          ))),
                );
              }
            });
      } else {
        return FutureBuilder<bool>(
            future: _imageLoaded,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.pink[200],
                ));
              } else if (snapshot.hasError) {
                return Center(child: Text("Failed to load image"));
              } else {
                return SafeArea(
                  child: Scaffold(
                      body: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/Untitled design.png"),
                                  fit: BoxFit.cover)),
                          child: customWidget.paddingWid(
                            EdgeInsets.symmetric(horizontal: 20),
                            Column(
                              children: [
                                customWidget.alignmentWid(
                                  Alignment.topLeft,
                                  customWidget.listResult(
                                      calc,
                                      resultcalc,
                                      calc.length,
                                      30,
                                      13,
                                      15,
                                      EdgeInsets.symmetric(vertical: 5)),
                                ),
                                customWidget.alignmentWid(
                                  Alignment.topRight,
                                  customWidget.paddingWid(
                                    EdgeInsets.only(right: 10),
                                    TextButton(
                                        onPressed: () {
                                          _clearData();
                                        },
                                        child: customWidget.textWid(
                                            "Clear History",
                                            Colors.white,
                                            15,
                                            FontWeight.bold,
                                            GoogleFonts.roboto().fontFamily)),
                                  ),
                                ),

                                Container(
                                    height: 40,
                                    child: customWidget.fieldtextWid(17)),
                                customWidget.boxheight(10),
                                customWidget.alignmentWid(
                                  Alignment.topRight,
                                  customWidget.paddingWid(
                                    EdgeInsets.symmetric(horizontal: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomWidget().textWid(
                                            result,
                                            Colors.white,
                                            23,
                                            FontWeight.bold,
                                            GoogleFonts.roboto().fontFamily),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            customWidget.inkwellWid(
                                              () {
                                                //(
                                                setState(() {
                                                  var text = customWidget
                                                      .textcontroller.text;
                                                  var text1 = text == ""
                                                      ? ""
                                                      : text.substring(
                                                          0, text.length - 1);

                                                  customWidget.textcontroller
                                                      .text = text1;
                                                });
                                              },
                                              customWidget.containerWid1(
                                                  32,
                                                  30,
                                                  BorderRadius.all(
                                                      Radius.circular(12)),
                                                  Color(0xff363035),
                                                  "assets/Untitled design (1).png"),
                                            ),
                                            customWidget.boxwidth(15),
                                            customWidget.inkwellWid(
                                              () {
                                                //(
                                                setState(() {
                                                  customWidget.textcontroller
                                                          .text.isEmpty
                                                      ? customWidget
                                                          .textcontroller
                                                          .text = "("
                                                      : customWidget
                                                              .textcontroller
                                                              .text =
                                                          "${customWidget.textcontroller.text}(";
                                                });
                                              },
                                              customWidget.containerWid(
                                                  32,
                                                  30,
                                                  BorderRadius.all(
                                                      Radius.circular(12)),
                                                  Color(0xff740076),
                                                  "(",
                                                  Colors.white,
                                                  19,
                                                  FontWeight.bold,
                                                  GoogleFonts.roboto()
                                                      .fontFamily),
                                            ),
                                            customWidget.boxwidth(15),
                                            customWidget.inkwellWid(
                                              () {
                                                //)
                                                setState(() {
                                                  customWidget.textcontroller
                                                          .text.isEmpty
                                                      ? customWidget
                                                          .textcontroller
                                                          .text = ""
                                                      : customWidget
                                                              .textcontroller
                                                              .text =
                                                          "${customWidget.textcontroller.text})";
                                                });
                                              },
                                              customWidget.containerWid(
                                                  32,
                                                  30,
                                                  BorderRadius.all(
                                                      Radius.circular(12)),
                                                  Color(0xff740076),
                                                  ")",
                                                  Colors.white,
                                                  19,
                                                  FontWeight.bold,
                                                  GoogleFonts.roboto()
                                                      .fontFamily),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                customWidget.boxheight(15),
                                // grid 1 C % ÷ ×

                                customWidget.gridData2(() {
                                  setState(() {
                                    customWidget.textcontroller.clear();
                                  });
                                }, () {
                                  //x²
                                  if (customWidget
                                      .textcontroller.text.isNotEmpty) {
                                    setState(() {
                                      String expression =
                                          customWidget.textcontroller.text;
                                      Parser parser = Parser();
                                      Expression exp = parser.parse(expression);
                                      ContextModel contextModel =
                                          ContextModel();
                                      num eval = exp.evaluate(
                                          EvaluationType.REAL, contextModel);
                                      num dataa = eval * eval;
                                      if (eval % 1 == 0) {
                                        result = dataa.toInt().toString();
                                      } else {
                                        result = dataa.toStringAsFixed(1);
                                      }
                                      calc.add(
                                          customWidget.textcontroller.text);
                                      resultcalc.add(result);
                                      _saveData();
                                      print(result);
                                    });
                                  }
                                }, () {
                                  //÷
                                  setState(() {
                                    customWidget.textcontroller.text.isEmpty
                                        ? customWidget.textcontroller.text = ""
                                        : customWidget.textcontroller.text =
                                            "${customWidget.textcontroller.text}/";
                                  });
                                }, () {
                                  //x
                                  setState(() {
                                    customWidget.textcontroller.text.isEmpty
                                        ? customWidget.textcontroller.text = ""
                                        : customWidget.textcontroller.text =
                                            "${customWidget.textcontroller.text}*";
                                  });
                                }, () {
                                  //7
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "7"
                                        : "${customWidget.textcontroller.text}7";
                                  });
                                }, () {
                                  //8
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "8"
                                        : "${customWidget.textcontroller.text}8";
                                  });
                                }, () {
                                  //9
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "9"
                                        : "${customWidget.textcontroller.text}9";
                                  });
                                }, () {
                                  //minus
                                  setState(() {
                                    customWidget.textcontroller.text.isEmpty
                                        ? customWidget.textcontroller.text = "-"
                                        : customWidget.textcontroller.text =
                                            "${customWidget.textcontroller.text}-";
                                  });
                                }, () {
                                  //4
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "4"
                                        : "${customWidget.textcontroller.text}4";
                                  });
                                }, () {
                                  //5
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "5"
                                        : "${customWidget.textcontroller.text}5";
                                  });
                                }, () {
                                  //6
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "6"
                                        : "${customWidget.textcontroller.text}6";
                                  });
                                }, () {
                                  //plus
                                  setState(() {
                                    customWidget.textcontroller.text.isEmpty
                                        ? customWidget.textcontroller.text = "+"
                                        : customWidget.textcontroller.text =
                                            "${customWidget.textcontroller.text}+";
                                  });
                                }, () {
                                  //1
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "1"
                                        : "${customWidget.textcontroller.text}1";
                                  });
                                }, () {
                                  //2
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "2"
                                        : "${customWidget.textcontroller.text}2";
                                  });
                                }, () {
                                  //3
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "3"
                                        : "${customWidget.textcontroller.text}3";
                                  });
                                }, () {
                                  //functionfactorial
                                  if (customWidget
                                      .textcontroller.text.isNotEmpty) {
                                    setState(() {
                                      String expression =
                                          customWidget.textcontroller.text;
                                      Parser parser = Parser();
                                      Expression exp = parser.parse(expression);
                                      ContextModel contextModel =
                                          ContextModel();
                                      num eval = exp.evaluate(
                                          EvaluationType.REAL, contextModel);

                                      for (num i = eval - 1; i > 0; i--) {
                                        eval *= i;
                                      }
                                      result = formatSciNotation(eval);
                                      calc.add(
                                          customWidget.textcontroller.text);
                                      resultcalc.add(result);
                                      _saveData();
                                      print(result);
                                    });
                                  }
                                }, () {
                                  //0
                                  setState(() {
                                    customWidget.textcontroller.text.isEmpty
                                        ? customWidget.textcontroller.text = ""
                                        : customWidget.textcontroller.text =
                                            "${customWidget.textcontroller.text}0";
                                  });
                                }, () {
                                  //dot
                                  setState(() {
                                    customWidget.textcontroller.text.isEmpty
                                        ? customWidget.textcontroller.text = ""
                                        : customWidget.textcontroller.text =
                                            "${customWidget.textcontroller.text}.";
                                  });
                                }, () {
                                  //functionsqrt
                                  if (customWidget
                                      .textcontroller.text.isNotEmpty) {
                                    setState(() {
                                      String expression =
                                          customWidget.textcontroller.text;
                                      Parser parser = Parser();
                                      Expression exp = parser.parse(expression);
                                      ContextModel contextModel =
                                          ContextModel();
                                      num eval = exp.evaluate(
                                          EvaluationType.REAL, contextModel);

                                      double exp1 = sqrt(eval);
                                      if (exp1 % 1 == 0) {
                                        result = exp1.toInt().toString();
                                      } else {
                                        result = exp1.toStringAsFixed(1);
                                      }
                                      calc.add(
                                          customWidget.textcontroller.text);
                                      resultcalc.add(result);
                                      _saveData();
                                      print(result);
                                    });
                                  }
                                }, () {
                                  //functionequaltoclick
                                  if (customWidget
                                      .textcontroller.text.isNotEmpty) {
                                    setState(() {
                                      String expression =
                                          customWidget.textcontroller.text;
                                      Parser parser = Parser();
                                      Expression exp = parser.parse(expression);
                                      ContextModel contextModel =
                                          ContextModel();
                                      num eval = exp.evaluate(
                                          EvaluationType.REAL, contextModel);
                                      if (eval % 1 == 0) {
                                        result = eval.toInt().toString();
                                      } else {
                                        result = eval.toStringAsFixed(1);
                                      }

                                      calc.add(
                                          customWidget.textcontroller.text);
                                      resultcalc.add(result);
                                      _saveData();

                                      print(result);
                                    });
                                  }
                                }, () {
                                  //functioncos
                                  if (customWidget
                                      .textcontroller.text.isNotEmpty) {
                                    setState(() {
                                      String expression =
                                          customWidget.textcontroller.text;
                                      Parser parser = Parser();
                                      Expression exp = parser.parse(expression);
                                      ContextModel contextModel =
                                          ContextModel();
                                      num eval = exp.evaluate(
                                          EvaluationType.REAL, contextModel);

                                      double exp1 = cos(eval);

                                      result = exp1.toStringAsFixed(3);

                                      calc.add(
                                          customWidget.textcontroller.text);
                                      resultcalc.add(result);
                                      _saveData();
                                      print(result);
                                    });
                                  }
                                }, () {
                                  //functionsin
                                  if (customWidget
                                      .textcontroller.text.isNotEmpty) {
                                    setState(() {
                                      String expression =
                                          customWidget.textcontroller.text;
                                      Parser parser = Parser();
                                      Expression exp = parser.parse(expression);
                                      ContextModel contextModel =
                                          ContextModel();
                                      num eval = exp.evaluate(
                                          EvaluationType.REAL, contextModel);

                                      double exp1 = sin(eval);
                                      result = exp1.toStringAsFixed(3);
                                      calc.add(
                                          customWidget.textcontroller.text);
                                      resultcalc.add(result);
                                      _saveData();
                                      print(result);
                                    });
                                  }
                                }, () {
                                  //functiontan
                                  if (customWidget
                                      .textcontroller.text.isNotEmpty) {
                                    setState(() {
                                      String expression =
                                          customWidget.textcontroller.text;
                                      Parser parser = Parser();
                                      Expression exp = parser.parse(expression);
                                      ContextModel contextModel =
                                          ContextModel();
                                      num eval = exp.evaluate(
                                          EvaluationType.REAL, contextModel);

                                      double exp1 = tan(eval);
                                      result = exp1.toStringAsFixed(3);
                                      calc.add(
                                          customWidget.textcontroller.text);
                                      resultcalc.add(result);
                                      _saveData();
                                      print(result);
                                    });
                                  }
                                }, () {
                                  //functionlog
                                  if (customWidget
                                      .textcontroller.text.isNotEmpty) {
                                    setState(() {
                                      String expression =
                                          customWidget.textcontroller.text;
                                      Parser parser = Parser();
                                      Expression exp = parser.parse(expression);
                                      ContextModel contextModel =
                                          ContextModel();
                                      num eval = exp.evaluate(
                                          EvaluationType.REAL, contextModel);

                                      double base =
                                          10.0; // Replace with your desired base
                                      double exp1 = log(eval) /
                                          log(base); // Calculate the logarithm in radians
                                      if (exp1 % 1 == 0) {
                                        result = exp1.toInt().toString();
                                      } else {
                                        result = exp1.toStringAsFixed(3);
                                      }

                                      calc.add(
                                          customWidget.textcontroller.text);
                                      resultcalc.add(result);
                                      _saveData();
                                      print(result);
                                    });
                                  }
                                }, () {
                                  //functionabs
                                  if (customWidget
                                      .textcontroller.text.isNotEmpty) {
                                    setState(() {
                                      String expression =
                                          customWidget.textcontroller.text;
                                      Parser parser = Parser();
                                      Expression exp = parser.parse(expression);
                                      ContextModel contextModel =
                                          ContextModel();
                                      double eval = exp.evaluate(
                                          EvaluationType.REAL, contextModel);
                                      double number =
                                          eval; // Replace with your number
                                      double exp1 = number.abs();

                                      if (exp1 % 1 == 0) {
                                        result = exp1.toInt().toString();
                                      } else {
                                        result = exp1.toStringAsFixed(3);
                                      }

                                      calc.add(
                                          customWidget.textcontroller.text);
                                      resultcalc.add(result);
                                      _saveData();
                                      print(result);
                                    });
                                  }
                                }, () {
                                  //functionpi
                                  var pii = "${pi.toStringAsFixed(4)}";
                                  setState(() {
                                    customWidget
                                        .textcontroller.text = customWidget
                                                .textcontroller.text ==
                                            null
                                        ? "$pii"
                                        : "${customWidget.textcontroller.text}$pii";
                                  });
                                }, () {
                                  //functionln
                                  if (customWidget
                                      .textcontroller.text.isNotEmpty) {
                                    setState(() {
                                      String expression =
                                          customWidget.textcontroller.text;
                                      Parser parser = Parser();
                                      Expression exp = parser.parse(expression);
                                      ContextModel contextModel =
                                          ContextModel();
                                      double eval = exp.evaluate(
                                          EvaluationType.REAL, contextModel);

                                      double exp1 = log(eval);
                                      result = exp1.toStringAsFixed(3);
                                      calc.add(
                                          customWidget.textcontroller.text);
                                      resultcalc.add(result);
                                      _saveData();
                                      print(result);
                                    });
                                  }
                                }, () {
                                  //functionepowerx
                                  setState(() {
                                    customWidget.textcontroller.text.isEmpty
                                        ? customWidget.textcontroller.text =
                                            "e^("
                                        : customWidget.textcontroller.text =
                                            "${customWidget.textcontroller.text}e^(";
                                  });
                                }, () {
                                  setState(() {
                                    customWidget.textcontroller.text.isEmpty
                                        ? customWidget.textcontroller.text = ""
                                        : customWidget.textcontroller.text =
                                            "${customWidget.textcontroller.text}^(";
                                  });
                                }, () {
                                  var ee = "${e.toStringAsFixed(4)}";
                                  setState(() {
                                    customWidget.textcontroller.text.isEmpty
                                        ? customWidget.textcontroller.text =
                                            "$ee"
                                        : customWidget.textcontroller.text =
                                            "${customWidget.textcontroller.text} $ee";
                                  });
                                }),
                              ],
                            ),
                          ))),
                );
              }
            });
      }
    });
  }
}
