import 'package:shared_preferences/shared_preferences.dart';
import 'package:stores/models/user_model.dart';

enum PrefKeys {
  phone,
  login,
  name,
  email,
  id,
}

class PrefController {
  static final PrefController _prefController = PrefController._();
  static late SharedPreferences _sharedPreferences;

  PrefController._();

  factory PrefController() => _prefController;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> save(UserModel user) async {
    await _sharedPreferences.setBool(PrefKeys.login.toString(), true);
    await _sharedPreferences.setString(PrefKeys.id.toString(), user.id);
    await _sharedPreferences.setString(PrefKeys.phone.toString(), user.phone);
    await _sharedPreferences.setString(PrefKeys.name.toString(), user.name);
    await _sharedPreferences.setString(PrefKeys.email.toString(), user.email);
  }

  static bool get login =>
      _sharedPreferences.getBool(PrefKeys.login.toString()) ?? false;

  static String get id =>
      _sharedPreferences.getString(PrefKeys.id.toString()) ?? '';

  static String get phone =>
      _sharedPreferences.getString(PrefKeys.phone.toString()) ?? '';

  static String get name =>
      _sharedPreferences.getString(PrefKeys.name.toString()) ?? '';

  static String get email =>
      _sharedPreferences.getString(PrefKeys.email.toString()) ?? '';
}
