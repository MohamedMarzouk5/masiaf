import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masiaf/view_model/app_language_view_model.dart';

class Language extends StatelessWidget {
  const Language({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  RadioListTile(
                    selected: true,
                    title: Text(
                      'En'.tr,
                    ),
                    value: 'en',
                    groupValue: controller.selectedRadio,
                    onChanged: (value) {
                      print(value);
                      controller.changeLanguage(value.toString());
                      controller.setSelectedRadio(value.toString());
                      Get.updateLocale(Locale(value.toString()));
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      'Ar'.tr,
                    ),
                    value: "ar",
                    groupValue: controller.selectedRadio,
                    onChanged: (value) {
                      print(value);
                      controller.changeLanguage(value.toString());
                      controller.setSelectedRadio(value.toString());
                      Get.updateLocale(Locale(value.toString()));
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
