import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../constants/colors_app.dart';

class InputFiled extends StatelessWidget {
  const InputFiled({
    Key? key,
    required this.controller,
    required this.prefixIcon,
    this.onTap,
    this.hintText,
    this.maxLength,
    this.labelText,
    this.hintStyle,
    this.prefixText,
    this.suffixIcon,
    this.fontSizeLabel = 16,
    this.readOnly = false,
    this.obscureText = false,
    this.colorLabel = ColorsApp.gery,
    this.keyboard = TextInputType.emailAddress,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboard;
  final String? labelText;
  final String? prefixText;
  final IconData prefixIcon;
  final Color colorLabel;
  final double fontSizeLabel;
  final String? hintText;
  final TextStyle? hintStyle;
  final int? maxLength;
  final Function()? onTap;
  final bool readOnly;
  final bool obscureText;
  final IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      maxLength: maxLength,
      //maxLines: 3,
      //minLines: 1,
      onTap: onTap,
      readOnly: readOnly,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixText: prefixText,
        suffixIcon: suffixIcon,
        prefixStyle: TextStyle(
          color: Colors.black,
          fontSize: MediaQuery.of(context).textScaleFactor * 16,
        ),
        counterText: '',
        prefixIcon: Icon(prefixIcon, color: ColorsApp.green),
        labelStyle: GoogleFonts.rubik(
          fontWeight: FontWeight.w400,
          color: colorLabel,
          fontSize: MediaQuery.of(context).textScaleFactor * fontSizeLabel,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: ColorsApp.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: ColorsApp.green,
          ),
        ),
        helperStyle: const TextStyle(color: ColorsApp.gery),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: ColorsApp.red),
        ),
      ),
    );
  }
}
