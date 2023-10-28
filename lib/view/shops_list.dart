// بعد ال pagintaion
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masiaf/view/widgets/custom_text.dart';
import 'package:masiaf/view/widgets/search_text_field.dart';
import 'package:masiaf/view_model/home_view_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShopList extends StatelessWidget {
  const ShopList({Key? key}) : super(key: key);

  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Column(
  //       children: <Widget>[
  //         Text("Past Trips", style: TextStyle(fontSize: 20)),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
  //           child: TextField(
  //             controller: _searchController,
  //             decoration: InputDecoration(
  //               prefixIcon: Icon(Icons.search)
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //           child: ListView.builder(
  //               itemCount: _resultsList.length,
  //               itemBuilder: (BuildContext context, int index) =>
  //                   buildTripCard(context, _resultsList[index]),
  //           )

  //         ),
  //       ],
  //     ),
  //   );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xfff6D538),
          // العنزان
          title: CustomText(
            text: '${controller.nameofShop}',
            alignment: Alignment.centerRight,
            color: const Color(0xff393A3A),
            fontSize: 20,
            fontWaight: FontWeight.w700,
          ),
        ),
        body:
            // controller.loading.value
            //     ? const Center(child: CircularProgressIndicator())
            SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(right: 19),
                //   child: SearchTextField(
                //     hint: 'ابحث عن اي مطعم',
                //   ),
                // ),
                // Padding(
                //   padding:

                //   child: Row(
                //     children: const [
                //       // Image.asset('assets/images/info.png'),
                //       // const SizedBox(
                //       //   width: 5,
                //       // ),
                //       // const CustomText(
                //       //   text: 'اعلان',
                //       //   alignment: Alignment.centerRight,
                //       //   fontSize: 20,
                //       //   color: Color(0xfff6D538),
                //       // ),
                //     ],
                //   ),
                // ),
                // const SizedBox(
                //   height: 3,
                // ),
                Padding(
                  padding: const EdgeInsets.only(right: 17.0, left: 14),
                  child: SearchTextField(
                    hint: 'ابحث عن اي مكان',
                    // controller: controller.searchController,
                    // suffixIcon: controller.clearButton,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 15.0, top: 20, left: 15),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          height: 259,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(8.0),
                                    topLeft: Radius.circular(8.0)),
                                child: Image.network(
                                  '${controller.shopmodel[index].image}',
                                  height: 99,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 22.0, top: 1, left: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text:
                                          '${controller.shopmodel[index].name}',
                                      color: const Color(0xff75797B),
                                      alignment: Alignment.centerRight,
                                      fontWaight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                    Row(
                                      children: [
                                        const CustomText(
                                          text: 'مفتوح',
                                          alignment: Alignment.centerLeft,
                                          fontWaight: FontWeight.w700,
                                          color: Color(0xff75797B),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Image.asset(
                                            'assets/images/correct.png'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 15.0,
                                  ),
                                  child: Row(
                                    children: [
                                      RatingBar.builder(
                                        itemSize: 20,
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Color(0xfff6D538),
                                        ),
                                        onRatingUpdate: (rating) {
                                          // print(rating);
                                        },
                                      ),
                                      const SizedBox(
                                        width: 9,
                                      ),
                                      const CustomText(
                                        text: '138',
                                        fontSize: 14,
                                        fontWaight: FontWeight.w900,
                                        color: Color(0xff75797B),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 22.0,
                                ),
                                child: CustomText(
                                  text:
                                      '${controller.shopmodel[index].location}',
                                  color: const Color(0xff75797B),
                                  alignment: Alignment.centerRight,
                                  fontWaight: FontWeight.w900,
                                  fontSize: 14,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  right: 22.0,
                                ),
                                child: CustomText(
                                  text: 'مطعم سمك',
                                  color: Color(0xffA3A7AA),
                                  alignment: Alignment.centerRight,
                                  fontSize: 14,
                                  fontFamily: 'Cairo',
                                  fontWaight: FontWeight.w400,
                                ),
                              ),
                              //     GridView.count(
                              //   shrinkWrap: true,
                              //   crossAxisCount: 1,
                              //   childAspectRatio: (1 / 1),
                              //   children: [
                              //     Image.network(
                              //       '${controller.shopmodel[index].image}',
                              //       height: 89,
                              //       width: 88,
                              //     ),
                              //   ],
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(right: 24.0),
                              //   child: Row(
                              //     children: [
                              //       // SizedBox(
                              //       //   width: 88,
                              //       //   height: 89,
                              //       //   child: Image.network(
                              //       //     '${controller.shopmodel[index].image}',
                              //       //   ),
                              //       // ),
                              //       // const SizedBox(
                              //       //   width: 8,
                              //       // ),
                              //       ClipRRect(
                              //         borderRadius: BorderRadius.circular(6.0),
                              //         child: GestureDetector(
                              //           child: Image.network(
                              //             '${controller.shopmodel[index].image}',
                              //             height: 89,
                              //             width:
                              //                 MediaQuery.of(context).size.width *
                              //                     .19,
                              //           ),
                              //           onTap: () {
                              //             showDialog(
                              //                 context: context,
                              //                 builder: (BuildContext context) {
                              //                   return Dialog(
                              //                     child: Image.network(
                              //                       '${controller.shopmodel[index].image}',
                              //                       fit: BoxFit.fill,
                              //                       width: MediaQuery.of(context)
                              //                               .size
                              //                               .width *
                              //                           .5,
                              //                       height: MediaQuery.of(context)
                              //                               .size
                              //                               .height *
                              //                           .25,
                              //                     ),
                              //                   );
                              //                 });
                              //           },
                              //         ),
                              //       ),
                              //       const SizedBox(
                              //         width: 8,
                              //       ),
                              //       ClipRRect(
                              //         borderRadius: BorderRadius.circular(6.0),
                              //         child: GestureDetector(
                              //           child: Image.network(
                              //             '${controller.shopmodel[index].image}',
                              //             height: 89,
                              //             width:
                              //                 MediaQuery.of(context).size.width *
                              //                     .19,
                              //           ),
                              //           onTap: () {
                              //             showDialog(
                              //                 context: context,
                              //                 builder: (BuildContext context) {
                              //                   return Dialog(
                              //                     child: Image.network(
                              //                       '${controller.shopmodel[index].image}',
                              //                       fit: BoxFit.fill,
                              //                       width: MediaQuery.of(context)
                              //                               .size
                              //                               .width *
                              //                           .5,
                              //                       height: MediaQuery.of(context)
                              //                               .size
                              //                               .height *
                              //                           .25,
                              //                     ),
                              //                   );
                              //                 });
                              //           },
                              //         ),
                              //       ),
                              //       const SizedBox(
                              //         width: 8,
                              //       ),
                              //       ClipRRect(
                              //         borderRadius: BorderRadius.circular(6.0),
                              //         child: GestureDetector(
                              //           child: Image.network(
                              //             '${controller.shopmodel[index].image}',
                              //             height: 89,
                              //             width:
                              //                 MediaQuery.of(context).size.width *
                              //                     .19,
                              //           ),
                              //           onTap: () {
                              //             showDialog(
                              //                 context: context,
                              //                 builder: (BuildContext context) {
                              //                   return Dialog(
                              //                     child: Image.network(
                              //                       '${controller.shopmodel[index].image}',
                              //                       fit: BoxFit.fill,
                              //                       width: MediaQuery.of(context)
                              //                               .size
                              //                               .width *
                              //                           .5,
                              //                       height: MediaQuery.of(context)
                              //                               .size
                              //                               .height *
                              //                           .25,
                              //                     ),
                              //                   );
                              //                 });
                              //           },
                              //         ),
                              //       ),
                              //       const SizedBox(
                              //         width: 8,
                              //       ),
                              //       ClipRRect(
                              //         borderRadius: BorderRadius.circular(6.0),
                              //         child: GestureDetector(
                              //           child: Image.network(
                              //             '${controller.shopmodel[index].image}',
                              //             height: 89,
                              //             width:
                              //                 MediaQuery.of(context).size.width *
                              //                     .19,
                              //           ),
                              //           onTap: () {
                              //             showDialog(
                              //                 context: context,
                              //                 builder: (BuildContext context) {
                              //                   return Dialog(
                              //                     child: Image.network(
                              //                       '${controller.shopmodel[index].image}',
                              //                       fit: BoxFit.fill,
                              //                       width: MediaQuery.of(context)
                              //                               .size
                              //                               .width *
                              //                           .5,
                              //                       height: MediaQuery.of(context)
                              //                               .size
                              //                               .height *
                              //                           .25,
                              //                     ),
                              //                   );
                              //                 });
                              //           },
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 44,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xfff6D538)),
                                    onPressed: () {},
                                    child: const CustomText(
                                      text: 'اتصل الان',
                                      fontWaight: FontWeight.w700,
                                      fontSize: 16,
                                    )),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Get.offNamed('shop',
                              arguments: controller.shopmodel[index]);
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: controller.shopmodel.length,
                    //  itemCount: _resultsList.length,

                    controller: controller
                        .getScroll(MediaQuery.of(context).size.height * 0.20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:masiaf/view/widgets/custom_text.dart';
// import 'package:masiaf/view_model/home_view_model.dart';
// import 'package:masiaf/view_model/shop_view_model.dart';

// import '../helper/extension.dart';

// class ShopList extends StatelessWidget {
//   const ShopList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeViewModel>(
//       init: Get.find<HomeViewModel>(),
//       builder: (controller) => Directionality(
//         textDirection: TextDirection.rtl,
//         child: Scaffold(
//           appBar: AppBar(
//             //العنزان
//             title: CustomText(
//               text: '${controller.nameofShop}',
//               alignment: Alignment.centerRight,
//               color: Colors.white,
//             ),
//           ),
//           body: ListView.separated(
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
//                 child: GestureDetector(
//                   child: Container(
//                     height: 100,
//                     decoration: const BoxDecoration(
//                       // border: Border(
//                       //   top: BorderSide(color: Colors.grey, width: 0.5),
//                       //   right: BorderSide(color: Colors.grey, width: 0.5),
//                       //   left: BorderSide(color: Colors.grey, width: 0.5),
//                       //   bottom: BorderSide(color: Colors.grey, width: 0.5),
//                       // ),
//                       borderRadius: BorderRadius.all(Radius.circular(50.0)),

//                       color: Color(0xffFAFAFA),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           decoration: const BoxDecoration(
//                             // border: Border(
//                             //   top: BorderSide(color: Colors.grey, width: 0.5),
//                             //   right: BorderSide(color: Colors.grey, width: 0.5),
//                             //   left: BorderSide(color: Colors.grey, width: 0.5),
//                             //   bottom: BorderSide(color: Colors.grey, width: 0.5),
//                             // ),
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(100.0),
//                                 bottomRight: Radius.circular(100.0)),
//                           ),
//                           child: Image.network(
//                             '${controller.shopModel[index].image}',
//                             width: 120,
//                             fit: BoxFit.fill,
//                             height: MediaQuery.of(context).size.height,
//                           ),
//                         ),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Row(
//                                 // crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(right: 20),
//                                     child: CustomText(
//                                       text:
//                                           '${controller.shopModel[index].name}',
//                                     ),
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.only(left: 8.0),
//                                     child: Icon(
//                                       Icons.favorite_border,
//                                       color: Color(0xff6461E2),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   ElevatedButton.icon(
//                                     onPressed: () {},
//                                     icon: const Icon(Icons.call),
//                                     label: const CustomText(
//                                       text: 'اتصل ',
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   ElevatedButton.icon(
//                                     onPressed: () {},
//                                     icon: const Icon(Icons.location_on),
//                                     label: const CustomText(
//                                       text: 'الموقع',
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   onTap: () {
//                     Get.toNamed('shop', arguments: controller.shopModel[index]);
//                   },
//                 ),
//               );
//             },
//             separatorBuilder: (context, index) => const SizedBox(height: 10),
//             itemCount: controller.shopModel.length,
//           ),
//         ),
//       ),
//     );
//   }
// }
 // Container(
                              //   decoration: const BoxDecoration(
                              //     // border: Border(
                              //     //   top: BorderSide(color: Colors.grey, width: 0.5),
                              //     //   right: BorderSide(color: Colors.grey, width: 0.5),
                              //     //   left: BorderSide(color: Colors.grey, width: 0.5),
                              //     //   bottom: BorderSide(color: Colors.grey, width: 0.5),
                              //     // ),
                              //     borderRadius: BorderRadius.only(
                              //         topRight: Radius.circular(100.0),
                              //         bottomRight: Radius.circular(100.0)),
                              //   ),
                              //   child: Image.network(
                              //     '${controller.shopmodel[index].image}',
                              //     width: 120,
                              //     fit: BoxFit.fill,
                              //     height: MediaQuery.of(context).size.height,
                              //   ),
                              // ),
                              // Expanded(
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceAround,
                              //     children: [
                              //       Row(
                              //         // crossAxisAlignment: CrossAxisAlignment.start,
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceBetween,
                              //         children: [
                              //           Padding(
                              //             padding:
                              //                 const EdgeInsets.only(right: 20),
                              //             child: CustomText(
                              //               text:
                              //                   '${controller.shopmodel[index].name}',
                              //             ),
                              //           ),
                              //           const Padding(
                              //             padding: EdgeInsets.only(left: 8.0),
                              //             child: Icon(
                              //               Icons.favorite_border,
                              //               color: Color(0xff4AC1EF),
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //       Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceAround,
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.center,
                              //         children: [
                              //           ElevatedButton.icon(
                              //             onPressed: () {},
                              //             icon: const Icon(Icons.call),
                              //             label: const CustomText(
                              //               text: 'اتصل ',
                              //               color: Colors.white,
                              //             ),
                              //           ),
                              //           ElevatedButton.icon(
                              //             onPressed: () {},
                              //             icon: const Icon(Icons.location_on),
                              //             label: const CustomText(
                              //               text: 'الموقع',
                              //               color: Colors.white,
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ],
                              //   ),
                              // ),