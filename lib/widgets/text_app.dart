import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextApp extends StatelessWidget {
  const TextApp({
    Key? key,
    required this.data,
    this.fontSize = 26,
    this.color = Colors.red,
    this.fontWeight,
    this.decoration,
    this.maxLines,
    this.textAlign,
  }) : super(key: key);

  final String data;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      textAlign: textAlign,
      style: GoogleFonts.rubik(
        fontSize: MediaQuery.of(context).textScaleFactor * fontSize,
        color: color,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }
}
