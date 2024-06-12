import 'package:get_storage/get_storage.dart';

class PreferenceManagerUtils {
  static GetStorage getStorage = GetStorage();

  static String isLogin = 'isLogin';

  ///alreadyLogin
  static Future setLoginExist(String value) async {
    await getStorage.write(isLogin, value);
  }

  static String getLoginExist() {
    return getStorage.read(isLogin) ?? "";
  }

  static Future clearPreference() async {
    await getStorage.erase();
  }
}
