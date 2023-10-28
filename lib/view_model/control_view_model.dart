import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masiaf/view/home/home.dart';
import 'package:masiaf/view/shops_list.dart';

import '../core/translation/local_storage.dart';
import '../view/Favourite.dart';
import '../view/settings.dart';

class ControlViewModel extends GetxController {
  var _appLocale;
  @override
  void onInit() async {
    LocalStorage localStorage = LocalStorage();
    _appLocale = await localStorage.getAppLanguage ?? 'ar';

    update();
    Get.updateLocale(Locale(_appLocale));
    super.onInit();
  }

  //دي علشان نخلي ال الهوم فيو في النص ولما نتحرك يغيرها
  //لو صفر هتبدأ من الشمال
  int _navigatorValue = 3;
  Widget _currentScreen = const Home();

  int get navigatorValue => _navigatorValue;

  get currentScreen => _currentScreen;
  void changeSelectedValue(int selectedValue) {
    switch (selectedValue) {
      case 0:
        _currentScreen = Settings();
        //علشان تبقي اول واحده

        break;

      case 1:
        _currentScreen = const Favorite();

        break;
      case 2:
        _currentScreen = const ShopList();
        break;
      case 3:
        _currentScreen = const Home();
        break;
    }
    //هنا بنحط قيمه ال selected علشان يغير من قيمته
    _navigatorValue = selectedValue;
    update();
  }
}
