import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors_app.dart';
import '../constants/fonts_app.dart';
import '../constants/routers.dart';
import '../firebase/firebase_auth.dart';
import '../utils/helpers.dart';
import '../widgets/View_details.dart';
import '../widgets/button_auth.dart';
import '../widgets/input_field.dart';
import '../widgets/password_filed.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with Helpers {
  late TextEditingController _mobileController;
  late TextEditingController _passwordController;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _mobileController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileController.dispose();
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
          ViewDetails(
            data: 'welcome_back'.tr,
            fontFamily: FontsApp.fontMedium,
            color: Colors.black,
            fontSize: 25,
          ),
          ViewDetails(
            data: 'login_to_start_using_app'.tr,
            fontFamily: FontsApp.fontRegular,
            color: ColorsApp.gery,
            fontSize: 17,
          ),
          sizeBoxHeight(40),
          InputFiled(
            controller: _mobileController,
            keyboard: TextInputType.phone,
            prefixIcon: Icons.phone_android,
            labelText: 'phone'.tr,
            fontSizeLabel: 16,
            maxLength: 9,
          ),
          sizeBoxHeight(40),
          PasswordFiled(
            controller: _passwordController,
            obscureText: _obscureText,
            labelText: 'password'.tr,
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          sizeBoxHeight(20),
          ButtonAuth(
            text: 'login'.tr,
            onPressed: () async => await _login(),
          ),
          sizeBoxHeight(40),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, forgetPassword);
              },
              child: Text(
                'forget_password_button'.tr,
                style: const TextStyle(
                  fontFamily: FontsApp.fontRegular,
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
              ViewDetails(
                data: 'no_have_an_account'.tr,
                fontFamily: FontsApp.fontRegular,
                color: ColorsApp.green,
                fontSize: 17,
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, registerScreen),
                child: ViewDetails(
                  data: 'create_now'.tr,
                  fontFamily: FontsApp.fontBold,
                  decoration: TextDecoration.underline,
                  color: ColorsApp.green,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget sizeBoxHeight(double height) =>
      SizedBox(height: MediaQuery.of(context).size.height / height);

  Future<void> _login() async {
    await AuthFirebase.login(
        email: _mobileController.text, password: _passwordController.text);
  }
}
