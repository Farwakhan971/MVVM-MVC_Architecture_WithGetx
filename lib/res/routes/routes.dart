import 'package:get/get.dart';
import 'package:mvvm_mvc/res/routes/routes_name.dart';
import 'package:mvvm_mvc/view/Login/login_screen.dart';
import 'package:mvvm_mvc/view/splash/splash_screen.dart';

class AppRoutes{
   static Approutes() => [
     GetPage(name: RoutesName.splashScreen, page: () => Splash_Screen()),
     GetPage(name: RoutesName.loginScreen, page: () =>  Login_screen()),
   ];
}