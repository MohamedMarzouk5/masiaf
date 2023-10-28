import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masiaf/model/shop_model.dart';

class Images extends StatelessWidget {
  Images({Key? key}) : super(key: key);
  final ShopModel _shopModel = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2, childAspectRatio: (155 / 100),
          // scrollabel  علشان الصفحه كلها تبقي
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            Image.network('${_shopModel.image}'),
            Image.network('${_shopModel.image}'),
            Image.network('${_shopModel.image}'),
            Image.network('${_shopModel.image}')
          ],
        ),
      ),
    );
  }
}
