import 'package:get/get_navigation/src/root/internacionalization.dart';

import '../../utils/ar.dart';
import '../../utils/en.dart';

class Translation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
