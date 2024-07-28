import 'package:shared_preferences/shared_preferences.dart';
import 'package:mvvm_mvc/models/login/login_model.dart';

class UserPreferences {
   Future<bool> saveUser(LoginModel loginModel) async{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     sharedPreferences.setString('token', loginModel.token.toString());
     sharedPreferences.setBool('isLogin', loginModel.isLogin!);

     return true;
   }
   Future<LoginModel> getUser()async{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     final token = sharedPreferences.getString('token');
     final isLogin = sharedPreferences.getBool('isLogin');
     return LoginModel(
       token: token,
       isLogin: isLogin
     );
   }
   Future<bool> removeUser() async{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     sharedPreferences.clear();
     return true;
   }
}