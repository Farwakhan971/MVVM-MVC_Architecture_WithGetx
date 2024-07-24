import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mvvm_mvc/res/colors/app_color.dart';

class Utils{

   static void changeFieldFocus(BuildContext context, FocusNode current, FocusNode next){
     current.unfocus();
     FocusScope.of(context).requestFocus(next);
   }
   static void toastMessage(String message){
     Fluttertoast.showToast(
         msg: message,
       gravity: ToastGravity.BOTTOM_LEFT,
     );
   }
   static void snakbar(String title, String message){
     Get.snackbar(
         title, message,
       backgroundColor: AppColors.blackColor,
       colorText: AppColors.whiteColor,

     );

   }
}