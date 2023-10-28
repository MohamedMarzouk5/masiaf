// import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masiaf/view/home/grid_view.dart';
import 'package:masiaf/view/widgets/custom_text.dart';
import '../../view_model/home_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
// ال appbar مستخدمش علشان
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 46.h,
                child: Padding(
                  padding: const EdgeInsets.only(right: 19),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/pin.png',
                        height: 30,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      CustomText(
                        text: 'Marsa Matrouh'.tr,
                        color: const Color(0xfff6D538),
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 16,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 17.0, left: 14),
              //   child: SearchTextField(
              //     hint: 'ابحث عن اي مكان',
              //     onChanged: (value) {
              //       controller.filter(value);
              //     },
              //     controller: controller.searchEditController,
              //     suffixIcon: controller.clearButton,
              //   ),
              // ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                child: controller.loading.value
                    ? const Center(child: CircularProgressIndicator())
                    : const SizedBox(
                        child: Padding(
                            child: Slider(),
                            padding: EdgeInsets.only(right: 17.0, left: 14))),
                height: 204,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 17.0),
                child: CustomText(
                  text: 'Services'.tr,
                  alignment: Alignment.bottomRight,
                  color: const Color(0xff393A3A),
                  fontSize: 18,
                  fontWaight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 7,
              ),

              const ShopsWithName(),
              // TabIcon(),
            ]),
          ),
        ),
      ),
    );
  }
}

//دي اللي تحت السيرش علي طول وعباره عن اعلان وبجيبه من ال فاير بيز
class Slider extends StatelessWidget {
  const Slider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            // borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              imageUrl: '${controller.adsModel[index].image}',
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          );
        },
        // علشان النقط الخارجيه
        outer: true,
        // itemWidth: 100,
        itemCount: controller.adsModel.length,
        layout: SwiperLayout.DEFAULT,
        //ده الشكل بتاعها ومورهاش حاجه
        // layout: SwiperLayout.DEFAULT,
        //دي علشان يتحرك لوحده
        autoplay: true,
        // علشان يظهر علي الجانبين
        viewportFraction: 1,
        scale: 1,
        // physics: NeverScrollableScrollPhysics(),

        // ده علشان النقط
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
              color: Colors.grey,
              activeColor: Color(0xfff6D538),
              size: 12,
              activeSize: 12),
        ),
      ),
    );
  }
}

// itemCount: 10,
// scale: 0.9,
// pagination: new SwiperPagination(
//   alignment: Alignment.bottomCenter,
//   builder: new DotSwiperPaginationBuilder(
//       color: Colors.grey, activeColor: Color(0xff38547C)),
// ),
//علشان السهمين
// control: new SwiperControl(
//   color: Color(0xff38547C),
// ),
//       ),
//     );
//   }
// }

// class TabIcon extends StatelessWidget {
//   const TabIcon({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3, // length of tabs
//       initialIndex: 2,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           TabBar(
//             indicatorSize: TabBarIndicatorSize.label,
//             // indicatorSize: TabBarIndicatorSize.values,
//             // indicatorWeight: 5,
//             labelColor: const Color(0xff6461E2),
//             unselectedLabelColor: Colors.grey,
//             tabs: [
//               Tab(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: const [
//                     CustomText(
//                       text: 'العروض',
//                       alignment: Alignment.centerRight,
//                     ),
//                     // SizedBox(
//                     //   width: 5,
//                     // ),
//                     Icon(Icons.local_offer),
//                   ],
//                 ),
//               ),
//               Tab(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: const [
//                     CustomText(
//                       text: 'الاقرب لي',
//                       alignment: Alignment.center,
//                     ),
//                     // SizedBox(
//                     //   width: 5,
//                     // ),
//                     Icon(Icons.location_on),
//                   ],
//                 ),
//               ),
//               Tab(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: const [
//                     CustomText(
//                       text: 'الاقسام',
//                       alignment: Alignment.center,
//                     ),
//                     // SizedBox(
//                     //   width: 3,
//                     // ),
//                     Icon(Icons.menu),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             height: 400, //height of TabBarView
//             decoration: const BoxDecoration(
//               border: Border(
//                 top: BorderSide(color: Colors.grey, width: 0.5),
//               ),
//             ),
//             child: const TabBarView(
//               physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
//               children: <Widget>[
//                 Center(
//                   child: Text('لا يوجد معلومات',
//                       style:
//                           TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//                 ),
//                 Center(
//                   child: Text('لا يوجد معلومات',
//                       style:
//                           TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//                 ),
//                 Center(
//                   child: ShopsWithName(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
