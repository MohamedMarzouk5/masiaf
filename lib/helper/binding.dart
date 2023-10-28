//بنحط الكلاس اللي مسختدم فيها ال
//getcontroller
import 'package:get/get.dart';
import 'package:masiaf/view_model/auth_view_model.dart';

import '../view_model/control_view_model.dart';
import '../view_model/home_view_model.dart';
import 'local_store_data.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    //getx controller ل  extends  بحط الحاجات ال
    // Get.lazyPut(() => HomeViewModel());
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
    // Get.lazyPut(() => ShopViewModel());
    Get.lazyPut<ControlViewModel>(() => ControlViewModel());
    Get.lazyPut<AuthViewModel>(() => AuthViewModel());
    Get.lazyPut<LocalStorageData>(() => LocalStorageData());
  }
}
