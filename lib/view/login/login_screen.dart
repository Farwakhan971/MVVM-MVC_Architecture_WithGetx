import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_mvc/repository/login_repository/login_repository.dart';
import 'package:mvvm_mvc/res/components/round_button.dart';
import 'package:mvvm_mvc/utils/utils.dart';
import 'package:mvvm_mvc/view_model/Login_controller/login_controller.dart';
import 'package:get/get.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  final LoginController loginController = Get.put(LoginController());
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: formkey, // Assign form key here
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      Utils.snakbar('Failed', 'Please Enter Email');
                      return null;
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    Utils.changeFieldFocus(
                      context,
                      loginController.emailFocusNode.value,
                      loginController.passwordFocusNode.value,
                    );
                  },
                  focusNode: loginController.emailFocusNode.value,
                  controller: loginController.emailController.value,
                  decoration: const InputDecoration(
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(),
                  ),
                )),
                const SizedBox(height: 30),
                Obx(() => TextFormField(
                  focusNode: loginController.passwordFocusNode.value,
                  controller: loginController.passwordController.value,
                  decoration: const InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      Utils.snakbar('Failed', 'Please Enter Password');
                      return null;
                    }
                    return null;
                  },
                )),
                const SizedBox(height: 30),
                RoundButton(buttonText: 'Login', onPress: () {
                  if (formkey.currentState!.validate()) {
                    loginController.loginApi();
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
