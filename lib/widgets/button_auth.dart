import 'package:flutter/material.dart';
import '../widgets/text_app.dart';
import '../constants/colors_app.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          double.infinity,
          MediaQuery.of(context).textScaleFactor * 50,
        ),
        backgroundColor: ColorsApp.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: TextApp(
        data: text,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }
}
