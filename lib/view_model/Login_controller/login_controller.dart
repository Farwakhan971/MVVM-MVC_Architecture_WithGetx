import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm_mvc/repository/login_repository/login_repository.dart';
import 'package:mvvm_mvc/utils/utils.dart';

class LoginController extends GetxController {
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
      Utils.snakbar('Login', 'Successfully Login');
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });
  }
}
