/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masiaf/helper/local_store_data.dart';
import 'package:masiaf/model/user_model.dart';
import 'package:masiaf/view/language.dart';
import 'package:masiaf/view_model/auth_view_model.dart';

class Settings extends StatelessWidget {
  static const String path = "lib/src/pages/settings/settings2.dart";
  final TextStyle whiteText = const TextStyle(
    color: Colors.white,
  );
  final TextStyle greyTExt = TextStyle(
    color: Colors.grey.shade400,
  );

  Settings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
        init: Get.find<AuthViewModel>(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.blueGrey,
            body: Theme(
              data: Theme.of(context).copyWith(
                brightness: Brightness.dark,
                primaryColor: Colors.purple,
              ),
              child: DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 30.0),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                image: AssetImage('assets/images/avater.jpg'),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${controller.userName}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      ListTile(
                        title: Text(
                          "Languages".tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        subtitle: Text(
                          "English US".tr,
                          style: greyTExt,
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey.shade400,
                        ),
                        onTap: () {
                          Get.to(const Language());
                        },
                      ),
                      ListTile(
                        title: Text(
                          "Profile Settings".tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        subtitle: Text(
                          "Jane Doe",
                          style: greyTExt,
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey.shade400,
                        ),
                        onTap: () {},
                      ),
                      SwitchListTile(
                        title: Text(
                          "Notifications".tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        subtitle: Text(
                          "On".tr,
                          style: greyTExt,
                        ),
                        value: controller.value,
                        onChanged: (val) {
                          controller.switchListTile(val);
                        },
                      ),
                      ListTile(
                        title: Text(
                          "Logout".tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        onTap: () {
                          controller.logout();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
