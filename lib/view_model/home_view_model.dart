// بعد ال pagintaion

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masiaf/model/shop_model.dart';

import '../core/page_service.dart';
import '../model/ads_model.dart';

class HomeViewModel extends GetxController {
  ScrollController get scrollController => _scrollController;
  final ScrollController _scrollController = ScrollController();

  // List<DocumentSnapshot> markets = [];

  List<ShopModel> get shopmodel => _shopmodel;

  final List<ShopModel> _shopmodel = [];

  //دي علشان الداتا اللي جايه بتاخد وقت
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  // وياخد اسمه shoplist  هنا ببعت اسم المحل علشان لما ادوس عليه يديها لل

  //اسامي انواع المحلات مع الصور لكل واحده
  var imagesAndCaptions = [
    ['assets/images/hotels.png', 'Hotels'.tr],
    ['assets/images/flat.png', 'Apartments'.tr],
    ['assets/images/beach.png', 'Beaches'.tr],
    ['assets/images/خروجات.png', 'entertainment'.tr],
    ['assets/images/resturant.png', 'Restaurants'.tr],
    ['assets/images/icecream.png', 'Sweets and Icecream'.tr],
    ['assets/images/supermarket.png', 'supermarket'.tr],
    ['assets/images/pharmacy.png', 'Pharmacies'.tr],
    ['assets/images/delivery.png', 'delivery'.tr],
  ];

//دي علشان الاعلانات اللي تحت السرش
  List<AdsModel> get adsModel => _adsModel;
  final List<AdsModel> _adsModel = [];

  String? _nameOfShop;
  get nameofShop => _nameOfShop;

  @override
  void onInit() {
    super.onInit();
    adsImageList();
  }

  adsImageList() async {
    _loading.value = true;
    print(_loading.value);
    await PageService().getAdsImage().then((value) {
      for (int i = 0; i < value.length; i++) {
        _adsModel
            .add(AdsModel.fromJson(value[i].data() as Map<dynamic, dynamic>));

        _loading.value = false;
        print(_loading.value);
      }
      update();
    });
  }

  //home screen علشان لما ادوس ياخد القيمه اللي دوست عليها ودي بتيجي من ال
  changeSelectedValue(List<String> selectedValue) async {
    _shopmodel.clear();
    //if بتاعتها وكذلك اللي بعده احنا بنشوف داس علي اي علشان كده حاطين  list لما ادوس علي صيدليات ياخد الاسم منها ويروح علي ال
    if (selectedValue.contains('فنادق') || selectedValue.contains('Hotels')) {
      _nameOfShop = 'Hotels'.tr;
      print('Hotel'.tr);
      await PageService().getMarketListWithP(_shopmodel, nameofShop);

      _loading.value = false;

      Get.toNamed('shoplist');
      update();
    } else if (selectedValue.contains('شقق') ||
        selectedValue.contains('Apartments')) {
      _nameOfShop = 'شقق';

      await PageService().getMarketListWithP(_shopmodel, nameofShop);
      _loading.value = false;
      update();
      Get.toNamed('shoplist');
    } else if (selectedValue.contains('شواطئ') ||
        selectedValue.contains('Beaches')) {
      _nameOfShop = 'شواطئ';

      await PageService().getMarketListWithP(_shopmodel, nameofShop);
      _loading.value = false;
      update();
      return Get.toNamed('shoplist');
    } else if (selectedValue.contains('خروجات') ||
        selectedValue.contains('entertainment')) {
      _nameOfShop = 'خروجات';

      await PageService().getMarketListWithP(_shopmodel, nameofShop);
      _loading.value = false;
      update();
      return Get.toNamed('shoplist');
    } else if (selectedValue.contains('مطاعم') ||
        selectedValue.contains('Restaurants')) {
      _nameOfShop = 'مطاعم';

      await PageService().getMarketListWithP(_shopmodel, nameofShop);
      _loading.value = false;
      update();
      return Get.toNamed('shoplist');
    } else if (selectedValue.contains('حلويات وايس') ||
        selectedValue.contains('Sweets and Icecream')) {
      _nameOfShop = 'حلويات وايس';

      await PageService().getMarketListWithP(_shopmodel, nameofShop);
      _loading.value = false;
      update();
      return Get.toNamed('shoplist');
    } else if (selectedValue.contains('سوبر') ||
        selectedValue.contains('supermarket')) {
      _nameOfShop = 'سوبر';

      await PageService().getMarketListWithP(_shopmodel, nameofShop);
      _loading.value = false;
      update();
      return Get.toNamed('shoplist');
    } else if (selectedValue.contains('صيدليات') ||
        selectedValue.contains('Pharmacies')) {
      _nameOfShop = 'صيدليات';

      await PageService().getMarketListWithP(_shopmodel, nameofShop);
      _loading.value = false;
      update();
      return Get.toNamed('shoplist');
    }
    update();
  }

  getScroll(double delta) {
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      //  double delta = MediaQuery.of(c).size.height * 0.20;
      if (maxScroll - currentScroll <= delta) {
        PageService().getMarketListWithP(_shopmodel, nameofShop);
      }
      update();
    });
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:masiaf/model/shop_model.dart';

// import '../core/page_service.dart';
// import '../model/ads_model.dart';

// class HomeViewModel extends GetxController {
//   //دي علشان الداتا اللي جايه بتاخد وقت
//   ValueNotifier<bool> get loading => _loading;
//   ValueNotifier<bool> _loading = ValueNotifier(false);
//   // وياخد اسمه shoplist  هنا ببعت اسم المحل علشان لما ادوس عليه يديها لل

//   //اسامي انواع المحلات مع الصور لكل واحده
//   var imagesAndCaptions = [
//     [
//       'assets/images/zone.png',
//       'صيدليات',
//     ],
//     ['assets/images/zone.png', 'عيادات'],
//     ['assets/images/zone.png', 'كافيهات'],
//     ['assets/images/zone.png', 'مستحضرات تجميل'],
//     ['assets/images/zone.png', 'سوبر ماركت'],
//   ];

// //دي علشان الاعلانات اللي تحت السرش
//   List<AdsModel> get adsModel => _adsModel;
//   final List<AdsModel> _adsModel = [];

//   String? _nameOfShop;
//   get nameofShop => _nameOfShop;

//   List<ShopModel> get shopModel => _shopModel;
//   List<ShopModel> _shopModel = [];

//   HomeViewModel() {
//     adsImageList();
//   }

//   adsImageList() async {
//     _loading.value = true;

//     PageService().getAdsImage().then((value) {
//       for (int i = 0; i < value.length; i++) {
//         _adsModel
//             .add(AdsModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
//         // print(adsModel.length);
//         _loading.value = false;
//       }

//       update();
//     });
//   }

//   //home screen علشان لما ادوس ياخد القيمه اللي دوست عليها ودي بتيجي من ال
//   changeSelectedValue(List<String> selectedValue) {
//     //if بتاعتها وكذلك اللي بعده احنا بنشوف داس علي اي علشان كده حاطين  list لما ادوس علي صيدليات ياخد الاسم منها ويروح علي ال
//     if (selectedValue.contains('صيدليات')) {
//       _nameOfShop = 'صيدليات';
// // بنمسح كل اللي اللي في الشوب موديل وبننزله
//       _shopModel.clear();
//       // بنجيب من الفاير بيز
//       PageService().getPharmacyList().then((value) {
//         for (int i = 0; i < value.length; i++) {
//           _shopModel.add(
//               ShopModel.fromJson(value[i].data() as Map<dynamic, dynamic>));

//           _loading.value = false;
//         }
//         // print(_shopModel.length);
//         update();
//       });
// //shop view model علشان نبعتها ل ال  arhuments خلي بالك هام جدا جدا جدا احنا حاطين
// //انا مخليها ارقام ممكن تغيرها عادي ل استرنج بس الافضل ارقام
// //وكذلك مع اللي بعده
//       Get.toNamed('shoplist');
//     } else if (
//         // ممكن بلعنصر اللي موجود في اللييسته اللي في الهوم فيو موديل
//         // _nam.contains('assets/images/clinic.PNG')
//         selectedValue.contains('عيادات')) {
//       _nameOfShop = 'عيادات';
//       _shopModel.clear();
//       PageService().getMarketList().then((value) {
//         for (int i = 0; i < value.length; i++) {
//           _shopModel.add(
//               ShopModel.fromJson(value[i].data() as Map<dynamic, dynamic>));

//           _loading.value = false;
//         }
//         // print(_shopModel.length);
//         update();
//       });
//       Get.toNamed('shoplist');
//     } else if (selectedValue.contains('كافيهات')) {
//       _nameOfShop = 'كافيهات';
//       PageService().getMarketList().then((value) {
//         for (int i = 0; i < value.length; i++) {
//           _shopModel.add(
//               ShopModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
//           _loading.value = false;
//         }
//         _shopModel.clear();
//         PageService().getMarketList().then((value) {
//           for (int i = 0; i < value.length; i++) {
//             _shopModel.add(
//                 ShopModel.fromJson(value[i].data() as Map<dynamic, dynamic>));

//             _loading.value = false;
//           }
//           print(_shopModel.length);
//           update();
//         });
//         print(_shopModel.length);
//         update();
//       });
//       return Get.toNamed('shoplist');
//     } else if (selectedValue.contains('مستحضرات تجميل')) {
//       _nameOfShop = 'مستحضرات تجميل';
//       _shopModel.clear();
//       PageService().getMarketList().then((value) {
//         for (int i = 0; i < value.length; i++) {
//           _shopModel.add(
//               ShopModel.fromJson(value[i].data() as Map<dynamic, dynamic>));

//           _loading.value = false;
//         }
//         print(_shopModel.length);
//         update();
//       });
//       return Get.toNamed('shoplist');
//     } else if (selectedValue.contains('سوبر ماركت')) {
//       _nameOfShop = 'سوبر ماركت';
//       _shopModel.clear();
//       PageService().getMarketList().then((value) {
//         for (int i = 0; i < value.length; i++) {
//           _shopModel.add(
//               ShopModel.fromJson(value[i].data() as Map<dynamic, dynamic>));

//           _loading.value = false;
//         }
//         print(_shopModel.length);
//         update();
//       });
//       return Get.toNamed('shoplist');
//     }

//     update();
//   }
// }
