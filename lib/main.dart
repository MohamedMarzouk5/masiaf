import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:masiaf/helper/extension.dart';
import 'package:masiaf/view/control_view.dart';
import 'package:masiaf/view/images.dart';
import 'package:masiaf/view/shop_details.dart.dart';
import 'package:masiaf/view/shops_list.dart';

import 'core/translation/translations.dart';
import 'helper/binding.dart';

void main() async {
  Binding().dependencies();
  // تسعه علشان ارجع لاول السطر بستخدم رقم
  //علشان تسجيل الدخول
  //واستخدام ال firbase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (_, f) => GetMaterialApp(
        translations: Translation(),
        locale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Cairo',
          // لون الاب
          primarySwatch: Palette.kToDark,
        ),
        home: const Scaffold(
          body: ControlView(),
        ),
        routes: {
          'shoplist': (context) => const ShopList(),
          'shop': (context) => ShopDetailsView(),
          'images': (context) => Images(),
        },
        getPages: [
          GetPage(name: '/shoplist', page: () => const ShopList()),
          GetPage(name: '/shop', page: () => ShopDetailsView()),
          GetPage(name: '/images', page: () => Images()),
        ],
      ),
    );
  }
}
