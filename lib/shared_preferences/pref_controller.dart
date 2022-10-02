import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys {
  language,
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

  static Future<void> saveLogin() async {
    await _sharedPreferences.setBool(PrefKeys.login.toString(), true);
  }

  Future<bool> changeLanguage({required String language}) async {
    return await _sharedPreferences.setString(
        PrefKeys.language.toString(), language);
  }

  String get language =>
      _sharedPreferences.getString(PrefKeys.language.toString()) ?? 'en';

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
