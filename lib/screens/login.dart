import 'package:google_fonts/google_fonts.dart';
import '../firebase/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants/colors_app.dart';
import '../firebase/response_firebase.dart';
import '../widgets/text_app.dart';
import '../widgets/button_auth.dart';
import '../widgets/input_field.dart';
import '../constants/routers.dart';
import '../utils/helpers.dart';
import 'package:get/get.dart';

import 'app_layout.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with Helpers {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login'.tr)),
      body: ListView(
        padding: const EdgeInsetsDirectional.all(20),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TextApp(
            data: 'welcome_back'.tr,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
          TextApp(
            data: 'login_to_start_using_app'.tr,
            color: ColorsApp.gery,
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
          sizeBoxHeight(40),
          InputFiled(
            controller: _emailController,
            prefixIcon: Icons.email_outlined,
            labelText: 'email'.tr,
          ),
          sizeBoxHeight(40),
          InputFiled(
            controller: _passwordController,
            obscureText: _obscureText,
            prefixIcon: Icons.lock_outline,
            labelText: 'password'.tr,
            suffixIcon: IconButton(
              onPressed: () => setState(() => _obscureText = !_obscureText),
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: ColorsApp.green,
              ),
            ),
          ),
          sizeBoxHeight(20),
          ButtonAuth(
            text: 'login'.tr,
            onPressed: () async => await _performLogin(),
          ),
          sizeBoxHeight(40),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, forgetPassword);
              },
              child: Text(
                'forgot_password'.tr,
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w400,
                  color: ColorsApp.green,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          sizeBoxHeight(100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextApp(
                fontSize: 17,
                color: ColorsApp.green,
                fontWeight: FontWeight.w400,
                data: 'do_not_have_an_account'.tr,
              ),
              TextButton(
                child: TextApp(
                  fontSize: 16,
                  data: 'sign_up'.tr,
                  color: ColorsApp.green,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
                onPressed: () => Navigator.pushNamed(context, register),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget sizeBoxHeight(double height) =>
      SizedBox(height: MediaQuery.of(context).size.height / height);

  Future<void> _performLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _login() async {
    FbResponse fbResponse = await AuthFirebase.login(
      email: _emailController.text,
      password: _passwordController.text,
    );
    showSnackBar(message: fbResponse.message, error: !fbResponse.status);
    if (fbResponse.status) {
      navigator();
    }
  }

  void navigator() =>
      Navigator.pushNamedAndRemoveUntil(context, appLayout, (route) => false);
}
