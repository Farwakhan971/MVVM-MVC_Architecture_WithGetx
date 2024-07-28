import 'dart:async';
import 'package:get/get.dart';
import 'package:mvvm_mvc/res/routes/routes_name.dart';
import 'package:mvvm_mvc/view_model/shared_preferences/shared_preferences_controller.dart';

class SplashServices {
  void isLogin() {
    UserPreferences sp = UserPreferences();
    sp.getUser().then((value) {
      if (value.isLogin == false  || value.isLogin == null) {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RoutesName.loginScreen);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RoutesName.homeScreen);
        });
      }
    });
  }
}
