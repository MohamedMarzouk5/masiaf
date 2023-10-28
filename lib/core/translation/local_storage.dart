import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  /// Write
  void saveLanguageToDisk(String langusage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', langusage);
  }

  /// Read
  Future<String?> get getAppLanguage async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('lang');
  }

  void saveSelectedRadioButton(String aroren) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('ar', aroren);
  }

  /// Read
  Future<String?> get getSelectedRadioButton async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('ar');
  }
}
