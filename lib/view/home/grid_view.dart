import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:masiaf/view/widgets/custom_text.dart';

import '../../view_model/home_view_model.dart';

class ShopsWithName extends StatelessWidget {
  const ShopsWithName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Padding(
            padding: const EdgeInsets.only(right: 17.0, left: 14),
            child: GridView.count(
              childAspectRatio: (182 / 137),
              // scrollabel  علشان الصفحه كلها تبقي
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              //عدد الاعمده
              crossAxisCount: 2,

              crossAxisSpacing: 15,
              mainAxisSpacing: 12,
              children: [
                //اللي هي الصوره مع الكلام view model  بجيب الل في ال
                ...controller.imagesAndCaptions.map(
                    // الصوره والكلام list  دي عباره عن ال i ال
                    (i) => GestureDetector(
                          child: Stack(
                            children: [
                              Image.asset(
                                i.first,
                                //شكل الصوره
                                fit: BoxFit.fitHeight,
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Positioned(
                                bottom: .0000001,
                                child: Container(
                                  color: Colors.white,
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: CustomText(
                                      text: i.last.tr,
                                      alignment: Alignment.bottomRight,
                                      color: const Color(0xff393A3A),
                                      fontSize: 18,
                                      fontWaight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            // Get.toNamed('shoplist');
                            //هنا ببعت المحل  اللي دوست عليه
                            controller.changeSelectedValue(i);

                            // Get.toNamed('pharmacy', arguments: i);
                          },
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
