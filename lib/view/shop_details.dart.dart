import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:masiaf/model/shop_model.dart';
import 'package:masiaf/view/widgets/custom_text.dart';

class ShopDetailsView extends StatelessWidget {
  ShopDetailsView({Key? key}) : super(key: key);
  final ShopModel _shopModel = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(children: [
          Stack(
            children: [
              SizedBox(
                height: 187,
                child: Image.network(
                  '${_shopModel.image}',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 55.0, right: 20),
                    child: Row(
                      children: const [
                        Icon(Icons.favorite_border),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 55.0, left: 20.0),
                        child: GestureDetector(
                          child: Image.asset('assets/images/back.png'),
                          onTap: () {
                            Get.offNamed('shoplist');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                child: Image.asset('assets/images/photo.png'),

                // Image.network('${_shopModel.image}'),
                top: 145,
                right: 17,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Positioned(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                color: Color(0xfff6D538),
                                shape: BoxShape.circle),
                          ),
                          const Positioned(
                            child: Icon(
                              Icons.call,
                              color: Colors.black,
                            ),
                            top: 16,
                            left: 16,
                            right: 16,
                            bottom: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 19,
                      ),
                      Stack(children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Color(0xfff6D538), shape: BoxShape.circle),
                        ),
                        Positioned(
                          child: Image.asset('assets/images/location.png'),
                          top: 16,
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                      ]),
                    ],
                  ),

                  // Image.network('${_shopModel.image}'),
                  top: 160,
                  left: 18,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 16.0, top: 212),
                child: CustomText(
                  text: 'مطعم مجدي',
                  color: Color(0xff393A3A),
                  fontSize: 20,
                  fontWaight: FontWeight.w900,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 250.0, right: 16),
                child: Row(
                  children: [
                    RatingBarIndicator(
                      itemSize: 20,
                      // هنا بقي تحط الرقم اللي هيظهر بس
                      rating: double.parse('3.5'),
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Color(0xfff6D538),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const CustomText(
                      text: '138',
                      color: Color(0xff75797B),
                      fontSize: 14,
                      fontWaight: FontWeight.w900,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 22.0),
            child: CustomText(
              text: 'مطعم أسماك',
              alignment: Alignment.centerRight,
              color: Color(0xff393A3A),
              // fontWaight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          // const SizedBox(
          //   height: 7,
          // ),
          // const Padding(
          //   padding: EdgeInsets.only(right: 22.0),
          //   child: CustomText(
          //     text: 'مفتوح',
          //     color: Color(0xff639152),
          //     fontSize: 14,
          //     alignment: Alignment.centerRight,
          //   ),
          // ),
          const SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 22.0),
            child: Row(
              children: [
                const CustomText(
                  text: 'وقت العمل',
                  color: Color(0xff393A3A),
                  fontSize: 14,
                  alignment: Alignment.centerRight,
                  fontWaight: FontWeight.w900,
                ),
                // const SizedBox(
                //   width: 3,
                // ),
                // const CustomText(
                //   text: 'كل يوم',
                //   color: Color(0xffA3A7AA),
                //   fontSize: 14,
                //   alignment: Alignment.centerRight,
                // ),
                const SizedBox(
                  width: 3,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomText(
                    text: '${_shopModel.date}',
                    color: const Color(0xfff6D538),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 23,
          ),

          DefaultTabController(
            length: 3, // length of tabs
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const TabBar(
                  indicatorPadding: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.label,
                  // indicatorSize: TabBarIndicatorSize.values,
                  // indicatorWeight: 5,
                  labelColor: Color(0xff75797B),
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      iconMargin: EdgeInsets.zero,
                      child: CustomText(
                        text: 'المنيو',
                        alignment: Alignment.center,
                      ),
                    ),
                    Tab(
                      iconMargin: EdgeInsets.zero,
                      child: CustomText(
                        text: 'الصور',
                        alignment: Alignment.center,
                      ),
                    ),
                    Tab(
                      child: CustomText(
                        text: 'التعليقات',
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .47,
                  //height of TabBarView
                  decoration: const BoxDecoration(
                      // border: Border(
                      //   top: BorderSide(color: Colors.white, width: 0.5),
                      // ),
                      ),
                  child: TabBarView(
                    // physics: const ScrollPhysics(
                    //     parent: NeverScrollableScrollPhysics()),
                    children: <Widget>[
                      // علشان اشيل المسافه اللي فوق
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (itemBuilder, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                color: Colors.white,
                                child: SizedBox(
                                  height: 152,
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(19)),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: Image.network(
                                            '${_shopModel.image}',
                                            width: 89,
                                            height: 89,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 20.0, top: 15),
                                            child: CustomText(
                                              text: 'سوبر كرانشي',
                                              fontSize: 14,
                                              fontWaight: FontWeight.w900,
                                              alignment: Alignment.topRight,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          CustomText(
                                            text: 'مطعم سمك  ',
                                            fontSize: 14,
                                            fontWaight: FontWeight.w400,
                                          ),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          CustomText(
                                            text: 'مطعم سمك',
                                            fontSize: 14,
                                            fontWaight: FontWeight.w400,
                                          ),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          CustomText(
                                            text: 'مطعم سمك',
                                            fontSize: 14,
                                            fontWaight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      const Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 35.0, bottom: 10),
                                          child: CustomText(
                                            text: '55.0 جنيه',
                                            alignment: Alignment.bottomLeft,
                                            fontSize: 20,
                                            fontWaight: FontWeight.w700,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 8,
                            children: [
                              Image.network(
                                '${_shopModel.image}',
                                fit: BoxFit.fill,
                              ),
                              Image.network(
                                '${_shopModel.image}',
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                      ),
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      height: 152,
                                      child: Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.topRight,
                                            child: Image.asset(
                                              'assets/images/resturant.png',
                                              height: 40,
                                              width: 40,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Column(
                                            children: const [
                                              CustomText(
                                                text: 'Mohamed',
                                                fontSize: 20,
                                                fontWaight: FontWeight.w500,
                                              ),
                                              CustomText(
                                                text: ' فبراير 28',
                                                fontSize: 12,
                                                fontWaight: FontWeight.w500,
                                              ),
                                              CustomText(
                                                text: 'mohamed',
                                              ),
                                              CustomText(
                                                text: 'mohamed',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: 85,
                                  color: const Color(0xfff6D538),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15.0,
                                            left: 77,
                                            top: 15,
                                            bottom: 15),
                                        child: Container(
                                          height: 55,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .6,
                                          color: Colors.white,
                                          child: TextFormField(
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Color(0xFF75797B),
                                              fontSize: 20,
                                            ),
                                            decoration: const InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 0.0),
                                              ),
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              filled: true,
                                              hintText: 'اضف تعليق',
                                              hintStyle: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color(0xFF75797B)),
                                              alignLabelWithHint: false,
                                              fillColor: Colors.white,
                                              labelStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Image.asset(
                                        'assets/images/send.png',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              // Padding(
              //   padding: const EdgeInsets.only(right: 38.0, left: 39),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Image.asset('assets/images/phone.png'),
              //           const SizedBox(
              //             height: 4,
              //           ),
              //           const CustomText(
              //             text: 'اتصل',
              //             fontSize: 16,
              //             color: Color(0xff393A3A),
              //           ),
              //         ],
              //       ),
              //       Column(
              //         children: [
              //           Image.asset('assets/images/location.png'),
              //           const SizedBox(
              //             height: 4,
              //           ),
              //           const CustomText(
              //             text: 'العنوان',
              //             fontSize: 16,
              //             color: Color(0xff393A3A),
              //           ),
              //         ],
              //       ),
              //       Column(
              //         children: [
              //           Image.asset('assets/images/worldwide.png'),
              //           const SizedBox(
              //             height: 4,
              //           ),
              //           const CustomText(
              //             text: 'الموقع',
              //             fontSize: 16,
              //             color: Color(0xff393A3A),
              //           ),
              //         ],
              //       ),
              //       Column(
              //         children: [
              //           Image.asset('assets/images/list.png'),
              //           const SizedBox(
              //             height: 4,
              //           ),
              //           const CustomText(
              //             text: 'منيو',
              //             fontSize: 16,
              //             color: Color(0xff393A3A),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),

              // const SizedBox(
              //   height: 20,
              // ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     const Padding(
              //       padding: EdgeInsets.only(right: 25.0),
              //       child: CustomText(
              //         text: 'الصور',
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(left: 20.0),
              //       child: GestureDetector(
              //         child: Image.asset('assets/images/forward.png'),
              //         onTap: () {
              //           Get.offNamed('images', arguments: _shopModel);
              //         },
              //       ),
              //     ),
              //   ],
              // ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 18.0, right: 23),
              //   child: GridView.count(
              //     crossAxisCount: 2, childAspectRatio: (155 / 100),
              //     // scrollabel  علشان الصفحه كلها تبقي
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),

              //     // crossAxisSpacing: 15,
              //     // mainAxisSpacing: 12,
              //     children: [
              //       Image.network('${_shopModel.image}'),
              //       Image.network('${_shopModel.image}')
              //     ],
              //   ),
              // ),
            ),
          ),
        ]),
      ),
    );
  }
}
// Padding(
//   padding: const EdgeInsets.only(top: 8.0, right: 8),
//   child: SizedBox(
//     height: 150,
//     child: Row(
//       children: [
//         Image.network(
//           '${_shopModel.image}',
//           width: 120,
//           fit: BoxFit.fill,
//           height: MediaQuery.of(context).size.height,
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.only(right: 20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CustomText(
//                       text: '${_shopModel.name}',
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 10),
//                       child: Icon(
//                         Icons.favorite_border,
//                         color: Color(0xff4AC1EF),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Icon(Icons.location_on),
//                 Row(
//                   children: [
//                     const CustomText(
//                       text: 'وقت العمل : ',
//                       fontSize: 25,
//                     ),
//                     CustomText(
//                       text: '${_shopModel.date}',
//                       color: const Color(0xffF1B15A),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     SizedBox(
//       width: 120,
//       child: ElevatedButton.icon(
//         onPressed: () {},
//         icon: const Icon(Icons.call),
//         label: const CustomText(
//           text: 'اتصل ',
//           color: Colors.white,
//         ),
//       ),
//     ),
//     SizedBox(
//       width: 120,
//       child: ElevatedButton.icon(
//         onPressed: () {},
//         icon: const Icon(Icons.location_on),
//         label: const CustomText(
//           text: 'الموقع',
//           color: Colors.white,
//         ),
//       ),
//     ),
//   ],
// ),

// DefaultTabController(
//   length: 2, // length of tabs
//   initialIndex: 0,
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       TabBar(
//         indicatorSize: TabBarIndicatorSize.label,
//         // indicatorSize: TabBarIndicatorSize.values,
//         // indicatorWeight: 5,
//         labelColor: const Color(0xff4AC1EF),
//         unselectedLabelColor: Colors.grey,
//         tabs: [
//           Tab(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: const [
//                 CustomText(
//                   text: 'صور المكان',
//                   alignment: Alignment.centerRight,
//                 ),
//                 // SizedBox(
//                 //   width: 5,
//                 // ),
//                 Icon(Icons.local_offer),
//               ],
//             ),
//           ),
//           Tab(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: const [
//                 CustomText(
//                   text: 'عروض المكان',
//                   alignment: Alignment.center,
//                 ),
//                 // SizedBox(
//                 //   width: 5,
//                 // ),
//                 Icon(Icons.location_on),
//               ],
//             ),
//           ),
//         ],
//       ),
//       Container(
//         height: 400, //height of TabBarView
//         decoration: const BoxDecoration(
//           border: Border(
//             top: BorderSide(color: Colors.grey, width: 0.5),
//           ),
//         ),
//         child: const TabBarView(
//           physics:
//               ScrollPhysics(parent: NeverScrollableScrollPhysics()),
//           children: <Widget>[
//             Center(
//               child: Text('لا يوجد معلومات',
//                   style: TextStyle(
//                       fontSize: 22, fontWeight: FontWeight.bold)),
//             ),
//             Center(
//               child: Text('لا يوجد معلومات',
//                   style: TextStyle(
//                       fontSize: 22, fontWeight: FontWeight.bold)),
//             ),
//           ],
//         ),
//       ),
//     ],
//   ),
// ),
