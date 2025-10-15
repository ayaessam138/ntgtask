



import 'package:ntgtask/core/localstorage/cache_helper.dart';

class SharedPreferenceHelper {

  static void saveLoignkey(String Loignkey) {
    CacheHelper.saveData(key: "Loignkey", value: Loignkey);
  }

  static String getLoignkey() {
    return CacheHelper.getData(key: "Loignkey") ?? "";
  }

  static Future<bool> removeLoignkey() {
    return CacheHelper.removeData(key: "Loignkey");
  }
}
