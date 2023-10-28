import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/translation/local_storage.dart';

class AppLanguage extends GetxController {
  var appLocale = 'ar';
  LocalStorage localStorage = LocalStorage();
  var _selectedRadio;
  get selectedRadio => _selectedRadio;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    LocalStorage localStorage = LocalStorage();
    _selectedRadio = await localStorage.getSelectedRadioButton ?? 'ar';
    appLocale = await localStorage.getAppLanguage ?? 'ar';

    update();
    Get.updateLocale(Locale(appLocale));
  }

  void changeLanguage(String type) async {
    if (appLocale == type) {
      return;
    }
    if (type == 'ar') {
      appLocale = 'ar';
      localStorage.saveLanguageToDisk('ar');
      localStorage.saveSelectedRadioButton('ar');
      _selectedRadio == 'ar';
    } else if (type == 'en') {
      appLocale = 'en';
      localStorage.saveLanguageToDisk('en');
      localStorage.saveSelectedRadioButton('en');
      _selectedRadio == 'en';
    }
    update();
  }

  void changeSelectedRadio(String type) async {
    if (type == 'ar') {
      localStorage.saveSelectedRadioButton('ar');
    } else {
      appLocale = 'en';
      localStorage.saveLanguageToDisk('en');
      localStorage.saveSelectedRadioButton('en');
      _selectedRadio == 'en';
    }
    update();
  }

  // Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(String val) {
    _selectedRadio = val;
    update();
  }

  selected() {
    localStorage.getSelectedRadioButton;
    update();
  }
}
