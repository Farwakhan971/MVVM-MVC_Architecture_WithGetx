import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm_mvc/models/login/login_model.dart';
import 'package:mvvm_mvc/repository/login_repository/login_repository.dart';
import 'package:mvvm_mvc/res/routes/routes_name.dart';
import 'package:mvvm_mvc/utils/utils.dart';
import 'package:mvvm_mvc/view_model/shared_preferences/shared_preferences_controller.dart';

class LoginController extends GetxController {
  UserPreferences up = UserPreferences();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  void loginApi() {
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    LoginRepository loginRepository = LoginRepository();
    loginRepository.loginApi(data).then((value) {
      LoginModel loginModel = LoginModel(
        isLogin: true,
        token: value.toString()
      );
      up.saveUser(loginModel).then((value) {
        Get.toNamed(RoutesName.homeScreen);
      }).onError((error, stackTrace) {
        Utils.toastMessage(error.toString());
      });
      Utils.snakbar('Login', 'Successfully Login');
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });
  }
}
