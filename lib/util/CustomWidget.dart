import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomWidget {
  var textcontroller = TextEditingController();
  Widget textWid(data, colors, double fontsize, fontweight, fontfamily) {
    return Text(
      data,
      style: TextStyle(
          color: colors,
          fontSize: fontsize,
          fontWeight: fontweight,
          fontFamily: fontfamily),
    );
  }

  Widget paddingWid(padding, child) {
    return Padding(
      padding: padding,
      child: child,
    );
  }

  Widget alignmentWid(alignment, child) {
    return Align(
      alignment: alignment,
      child: child,
    );
  }

  Widget containerWid(double height, double width, bordervalue, colorbox, data,
      colorstext, double fontsizetext, fontweighttext, fontfamilytext) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: colorbox,
        borderRadius: bordervalue,
      ),
      child: Center(
        child: textWid(
            data, colorstext, fontsizetext, fontweighttext, fontfamilytext),
      ),
    );
  }

  Widget containerWid2(bordervalue, colorbox, data, colorstext,
      double fontsizetext, fontweighttext, fontfamilytext) {
    return Container(
      decoration: BoxDecoration(
        color: colorbox,
        borderRadius: bordervalue,
      ),
      child: Center(
        child: textWid(
            data, colorstext, fontsizetext, fontweighttext, fontfamilytext),
      ),
    );
  }

  Widget containerWid3(bordervalue, colorbox, child) {
    return Container(
      decoration: BoxDecoration(
        color: colorbox,
        borderRadius: bordervalue,
      ),
      child: Center(
        child: child,
      ),
    );
  }

  Widget containerWid1(
      double height, double width, bordervalue, colorbox, image) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fitWidth),
        color: colorbox,
        borderRadius: bordervalue,
      ),
    );
  }

  Widget fieldtextWid(double fontsize) {
    return TextField(
      textAlign: TextAlign.start,
      enabled: false,
      controller: textcontroller,
      style: TextStyle(
          color: Color(0xff10B7FF),
          fontSize: fontsize,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.roboto().fontFamily),
      decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.grey, width: 2))),
    );
  }

  Widget boxheight(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget boxwidth(double width) {
    return SizedBox(
      width: width,
    );
  }

  Widget inkwellWid(ontap, child) {
    return InkWell(
      onTap: ontap,
      child: child,
    );
  }

  Widget listResult(calc, resultcalc, length, double height, double calctext,
      double resultcalctext, vertical) {
    return Container(
      height: height,
      child: ListView.builder(
        reverse: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: vertical,
            child: Container(
              child: Column(
                children: [
                  alignmentWid(
                    Alignment.topLeft,
                    textWid("= ${calc[index]}", Colors.grey[500], calctext,
                        FontWeight.bold, GoogleFonts.roboto().fontFamily),
                  ),
                  boxheight(5),
                  alignmentWid(
                    Alignment.topLeft,
                    textWid(
                        " ${resultcalc[index]}",
                        Colors.grey[400],
                        resultcalctext,
                        FontWeight.bold,
                        GoogleFonts.roboto().fontFamily),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: length,
      ),
    );
  }

  Widget gridData1(
    ontapc,
    ontapsq,
    ontapdiv,
    ontapmul,
    ontap7,
    ontap8,
    ontap9,
    ontapminus,
    ontap4,
    ontap5,
    ontap6,
    ontapadd,
    ontap1,
    ontap2,
    ontap3,
    ontapfunctionx,
    ontap0,
    ontapdot,
    ontapfunctionsqrt,
    ontapfunction,
  ) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.only(bottom: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 55,
          crossAxisCount: 4, // Keep this fixed
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          if (index == 0) {
            return inkwellWid(
              ontapc,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "C",
                  Color(0xffA5A5A5),
                  28,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 1) {
            return inkwellWid(
              ontapsq,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff740076),
                  "x²",
                  Colors.white,
                  30,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 2) {
            return inkwellWid(
              ontapdiv,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff740076),
                  "÷",
                  Colors.white,
                  30,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 3) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontapmul,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff740076),
                  "×",
                  Colors.white,
                  30,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 4) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap7,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "7",
                  Color(0xff10B7FF),
                  28,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 5) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap8,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "8",
                  Color(0xff10B7FF),
                  30,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 6) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap9,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "9",
                  Color(0xff10B7FF),
                  30,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 7) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontapminus,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff740076),
                  "-",
                  Colors.white,
                  35,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 8) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap4,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "4",
                  Color(0xff10B7FF),
                  28,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 9) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap5,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "5",
                  Color(0xff10B7FF),
                  30,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 10) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap6,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "6",
                  Color(0xff10B7FF),
                  30,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 11) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontapadd,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff740076),
                  "+",
                  Colors.white,
                  30,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 12) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap1,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "1",
                  Color(0xff10B7FF),
                  28,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 13) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap2,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "2",
                  Color(0xff10B7FF),
                  30,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 14) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap3,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "3",
                  Color(0xff10B7FF),
                  30,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 15) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontapfunctionx,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff740076),
                  "x!",
                  Colors.white,
                  30,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 16) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap0,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "0",
                  Color(0xff10B7FF),
                  28,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 17) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontapdot,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  ".",
                  Color(0xff10B7FF),
                  35,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 18) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontapfunctionsqrt,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "√x",
                  Color(0xff10B7FF),
                  30,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 19) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontapfunction,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff740076),
                  "=",
                  Colors.white,
                  30,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          }
        },
      ),
    );
  }

  Widget gridData2(
      ontapc,
      ontapsq,
      ontapdiv,
      ontapmul,
      ontap7,
      ontap8,
      ontap9,
      ontapminus,
      ontap4,
      ontap5,
      ontap6,
      ontapadd,
      ontap1,
      ontap2,
      ontap3,
      ontapfunctionx,
      ontap0,
      ontapdot,
      ontapfunctionsqrt,
      ontapfunction,
      ontapcos,
      ontapsin,
      ontaptan,
      ontaplog,
      ontapabs,
      ontappi,
      ontapln,
      ontapex,
      ontapyx,
      ontape) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.only(bottom: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 30,
          crossAxisCount: 6, // Keep this fixed
          mainAxisSpacing: 10,
          crossAxisSpacing: 35,
        ),
        itemBuilder: (context, index) {
          if (index == 0) {
            return inkwellWid(
              ontapcos,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "cos",
                  Color(0xffA5A5A5),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 1) {
            return inkwellWid(
              ontapsin,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "sin",
                  Color(0xffA5A5A5),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 2) {
            return inkwellWid(
              ontapc,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "C",
                  Color(0xffA5A5A5),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 3) {
            return inkwellWid(
              ontapsq,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff740076),
                  "x²",
                  Colors.white,
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 4) {
            return inkwellWid(
              ontapdiv,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff740076),
                  "÷",
                  Colors.white,
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 5) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontapmul,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff740076),
                  "×",
                  Colors.white,
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 6) {
            return inkwellWid(
              ontaptan,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "tan",
                  Color(0xffA5A5A5),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 7) {
            return inkwellWid(
              ontaplog,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "log",
                  Color(0xffA5A5A5),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 8) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap7,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "7",
                  Color(0xff10B7FF),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 9) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap8,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "8",
                  Color(0xff10B7FF),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 10) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap9,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "9",
                  Color(0xff10B7FF),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 11) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontapminus,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff740076),
                  "-",
                  Colors.white,
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 12) {
            return inkwellWid(
              ontapabs,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "abs",
                  Color(0xffA5A5A5),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 13) {
            return inkwellWid(
              ontappi,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "π",
                  Color(0xffA5A5A5),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 14) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap4,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "4",
                  Color(0xff10B7FF),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 15) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap5,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "5",
                  Color(0xff10B7FF),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 16) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap6,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "6",
                  Color(0xff10B7FF),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 17) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontapadd,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff740076),
                  "+",
                  Colors.white,
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 18) {
            return inkwellWid(
              ontapln,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "ln",
                  Color(0xffA5A5A5),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 19) {
            return inkwellWid(
                ontapex,
                containerWid3(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  Wrap(direction: Axis.horizontal, children: [
                    Text(
                      'e',
                      style: TextStyle(
                          color: Color(0xffA5A5A5),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.roboto().fontFamily),
                    ),
                    Text(
                      'x',
                      style: TextStyle(
                          fontFeatures: [FontFeature.superscripts()],
                          color: Color(0xffA5A5A5),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.roboto().fontFamily),
                    ),
                  ]),
                ));
          } else if (index == 20) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap1,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "1",
                  Color(0xff10B7FF),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 21) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap2,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "2",
                  Color(0xff10B7FF),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 22) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap3,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "3",
                  Color(0xff10B7FF),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 23) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontapfunctionx,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff740076),
                  "x!",
                  Colors.white,
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 24) {
            return inkwellWid(
                ontapyx,
                containerWid3(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  Wrap(direction: Axis.horizontal, children: [
                    Text(
                      'x',
                      style: TextStyle(
                          color: Color(0xffA5A5A5),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.roboto().fontFamily),
                    ),
                    Text(
                      'y',
                      style: TextStyle(
                          fontFeatures: [FontFeature.superscripts()],
                          color: Color(0xffA5A5A5),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.roboto().fontFamily),
                    ),
                  ]),
                ));
          } else if (index == 25) {
            return inkwellWid(
              ontape,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "e",
                  Color(0xffA5A5A5),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 26) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontap0,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "0",
                  Color(0xff10B7FF),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 27) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontapdot,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  ".",
                  Color(0xff10B7FF),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 28) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontapfunctionsqrt,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff363035),
                  "√x",
                  Color(0xff10B7FF),
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          } else if (index == 29) {
            // Return the next button with adjusted size
            return inkwellWid(
              ontapfunction,
              containerWid2(
                  BorderRadius.all(Radius.circular(20)),
                  Color(0xff740076),
                  "=",
                  Colors.white,
                  20,
                  FontWeight.bold,
                  GoogleFonts.roboto().fontFamily),
            );
          }
        },
      ),
    );
  }
}
