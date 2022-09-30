import '../../widgets/password_filed.dart';
import '../../widgets/view_details.dart';
import '../firebase/firebase_auth.dart';
import '../../widgets/button_auth.dart';
import 'package:flutter/material.dart';
import '../constants/colors_app.dart';
import '../widgets/input_field.dart';
import '../constants/fonts_app.dart';
import '../constants/routers.dart';
import '../../utils/helpers.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('register'.tr)),
      body: ListView(
        padding: const EdgeInsetsDirectional.all(20),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ViewDetails(
            data: 'create_new_account'.tr,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          ViewDetails(
            data: 'create_account_to_start_app'.tr,
            color: Colors.black45,
            fontWeight: FontWeight.w300,
            fontSize: 17,
          ),
          sizeBoxHeight(40),
          InputFiled(
            controller: _nameController,
            keyboard: TextInputType.name,
            prefixIcon: Icons.person,
            labelText: 'name'.tr,
            fontSizeLabel: 16,
            prefixText: '',
            maxLength: 8,
          ),
          sizeBoxHeight(40),
          InputFiled(
            controller: _emailController,
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
          sizeBoxHeight(40),
          ButtonAuth(
            onPressed: () async => await _register(),
            text: 'create'.tr,
          ),
          sizeBoxHeight(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ViewDetails(
                data: 'do_you_have_an_account'.tr,
                fontFamily: FontsApp.fontRegular,
                color: ColorsApp.green,
                fontSize: 17,
              ),
              TextButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, login, (route) => false),
                child: ViewDetails(
                  data: 'login'.tr,
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

  Future<void> _register() async {
    await AuthFirebase.register(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      phone: _phoneController.text,
    );
  }
}
