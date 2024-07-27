import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_mvc/view_model/splash_services/splash_service.dart';
class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    splashServices.isLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Text('welcome'.tr),
       ),
    );
  }
}
