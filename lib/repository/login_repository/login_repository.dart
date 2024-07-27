import 'package:mvvm_mvc/network/network_api_services.dart';
import 'package:mvvm_mvc/res/app_url/app_url.dart';

class LoginRepository{
  NetworkApiServices networkApiServices = NetworkApiServices();
  Future<dynamic> loginApi(var data) async{
    final response = networkApiServices.postApi(data, AppUrl.apiUrl);
    return response;
  }

}