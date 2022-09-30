import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/colors_app.dart';
import '../constants/routers.dart';
import 'package:get/get.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20,
          end: 20,
          top: 84,
          bottom: 28,
        ),
        child: Column(
          children: [
            Text(
              'title_onBoarding'.tr,
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 34,
                color: ColorsApp.pink,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'sub_title_onBoarding'.tr,
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 20,
                color: ColorsApp.gray,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 69),
            SvgPicture.asset(
              'assets/images/onBoarding.svg',
              height: 260,
              width: double.infinity,
            ),
            const Spacer(),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, login),
                child: Text(
                  'start'.tr,
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    color: ColorsApp.pink,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
