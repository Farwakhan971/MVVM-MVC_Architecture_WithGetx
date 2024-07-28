import 'dart:async';
import 'dart:convert';
import 'package:mvvm_mvc/data/app_exceptions.dart';
import 'package:mvvm_mvc/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      dynamic responsejson = returnResponse(response);
      return responsejson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
  @override
  Future postApi(dynamic data, String url) async{
    try {
      http.Response response = await http.post(Uri.parse(url), body: data);
      dynamic responsejson = returnResponse(response);
      return responsejson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

  }
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException('Fetch data exception with status code ' + response.statusCode.toString());
    }
  }

}
