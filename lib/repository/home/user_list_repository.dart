
import 'package:mvvm_mvc/models/home/home_model.dart';
import 'package:mvvm_mvc/network/network_api_services.dart';
import 'package:mvvm_mvc/res/app_url/app_url.dart';

class UserListRepo{
  NetworkApiServices nps = NetworkApiServices();
  Future<HomeModel> getApi() async{
    final response = await nps.getApi(AppUrl.getApiUrl);
    return HomeModel.fromJson(response);
  }
}