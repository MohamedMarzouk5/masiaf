import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masiaf/view_model/control_view_model.dart';

import '../view_model/auth_view_model.dart';
import 'login/login_screen.dart';

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);

// bottom navigation bar دي علشان اظهر الصفحه مع ال
  @override
  Widget build(BuildContext context) {
    //زي ال get builder بس من غير ال controller
    return Obx(
      () {
        return (Get.find<AuthViewModel>().user != null)
            ? GetBuilder<ControlViewModel>(
                //init بديها الكنترولر بتاعي
                init: ControlViewModel(),
                builder: (controller) => Scaffold(
                  bottomNavigationBar: _bottomNavigationBar(),
                  body: controller.currentScreen,
                ),
              )
            : LoginScreen();
      },
    );
  }

  //   GetBuilder<ControlViewModel>(
  //     //init بديها الكنترولر بتاعي
  //     init: ControlViewModel(),
  //     builder: (controller) => Scaffold(
  //       bottomNavigationBar: _BottomNavigationBar(),
  //       body: controller.currentScreen,
  //     ),
  //   );
  // }

//bottom navigation bar دي شكل ال
//flutter tips هتلاقي الافضل علي الفيس في العناصر المخفوظه في  method الاحسن انها متبقاش علي شكل

  // Widget? bottomNavigationBar() {
  //   return GetBuilder<ControlViewModel>(
  //     init: ControlViewModel(),
  //     builder: (controller) => CurvedNavigationBar(
  //       index: controller.navigatorValue,
  //       height: 60.0,
  //       items: <Widget>[
  //         Icon(Icons.shopping_cart, size: 30),
  //         Icon(Icons.home, size: 30),
  //         Icon(Icons.person, size: 30),
  //       ],
  //       color: Colors.white,
  //       buttonBackgroundColor: Colors.white,
  //       backgroundColor: Colors.black,
  //       animationCurve: Curves.easeInOut,
  //       animationDuration: Duration(milliseconds: 600),
  //       onTap: (index) {
  //         //علشان لما ادوس يغير المكان
  //         controller.changeSelectedValue(index);
  //       },
  //       letIndexChange: (index) => true,
  //     ),
  //   );
  // }
}

//ده الافضل

class _bottomNavigationBar extends StatelessWidget {
  // const bottomNavigationBar();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => Directionality(
        textDirection: TextDirection.ltr,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xfff6D538),
          currentIndex: controller.navigatorValue,
          // height: 60.0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.grey,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: '',
            ),
          ],
          // fixedColor: Colors.white,
          // selectedItemColor: Colors.white,
          // backgroundColor: Colors.black,

          onTap: (index) {
            //علشان لما ادوس يغير المكان
            controller.changeSelectedValue(index);
          },

          // letIndexChange: (index) => true,
        ),
      ),
    );
  }
}


// class _BottomNavigationBar extends StatelessWidget {
//   // const bottomNavigationBar();
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ControlViewModel>(
//       init: ControlViewModel(),
//       builder: (controller) => Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black,
//             ),
//           ],
//         ),
//         child: BottomNavigationBar(
//           currentIndex: 0,
//           items: [
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.android), label: 'Android'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.desktop_windows), label: 'Android'),
//           ],
//           backgroundColor: Colors.white,
//           elevation: 0,
//           onTap: (index) {
//             //علشان لما ادوس يغير المكان
//             controller.changeSelectedValue(index);
//           },
//         ),
//       ),
//     );
//   }
// }
