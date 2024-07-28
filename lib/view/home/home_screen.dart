import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_mvc/res/routes/routes_name.dart';
import 'package:mvvm_mvc/view_model/shared_preferences/shared_preferences_controller.dart';

class HomeScreen extends StatelessWidget {
  UserPreferences up = UserPreferences();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            up.removeUser().then((value) {
              Get.toNamed(RoutesName.loginScreen);
            });
          }, icon: Icon(Icons.logout))
        ],
        title: Text('Home'.tr),

      ),
    );
  }
}
