import '../firebase/response_firebase.dart';
import '../../widgets/text_app.dart';
import '../firebase/firebase_auth.dart';
import '../../widgets/button_auth.dart';
import 'package:flutter/material.dart';
import '../constants/colors_app.dart';
import '../widgets/input_field.dart';
import '../constants/routers.dart';
import '../../utils/helpers.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with Helpers {
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
          TextApp(
            data: 'create_new_account'.tr,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          TextApp(
            data: 'create_account_to_start_app'.tr,
            color: Colors.black45,
            fontWeight: FontWeight.w300,
            fontSize: 17,
          ),
          sizeBoxHeight(40),
          InputFiled(
            controller: _nameController,
            prefixIcon: Icons.person,
            labelText: 'name'.tr,
          ),
          sizeBoxHeight(40),
          InputFiled(
            controller: _emailController,
            prefixIcon: Icons.email_outlined,
            labelText: 'email'.tr,
          ),
          sizeBoxHeight(40),
          InputFiled(
            controller: _phoneController,
            keyboard: TextInputType.phone,
            prefixIcon: Icons.phone_android,
            labelText: 'phone'.tr,
            maxLength: 7,
            prefixText: '059',
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
          sizeBoxHeight(40),
          ButtonAuth(
            onPressed: () async => await _performRegister(),
            text: 'create'.tr,
          ),
          sizeBoxHeight(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextApp(
                data: 'already_have_an_account'.tr,
                fontWeight: FontWeight.w400,
                color: ColorsApp.green,
                fontSize: 17,
              ),
              TextButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, login, (route) => false),
                child: TextApp(
                  data: 'login'.tr,
                  fontWeight: FontWeight.bold,
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

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _register() async {
    FbResponse fbResponse = await AuthFirebase.register(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      phone: '059${_phoneController.text}',
    );
    showSnackBar(message: fbResponse.message, error: !fbResponse.status);
    if (fbResponse.status) {
      navigator();
    }
  }

  void navigator() =>
      Navigator.pushNamedAndRemoveUntil(context, login, (route) => false);
}
