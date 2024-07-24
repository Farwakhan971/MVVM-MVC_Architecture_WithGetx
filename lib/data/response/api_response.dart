import 'package:mvvm_mvc/data/response/status.dart';

class ApiResponse<T>{
  T? data;
  Status? status;
  String? message;
  ApiResponse(this.data, this.status, this.message);
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETD;
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString(){
    return 'Status: $status\n data: $data\n message: $message';
  }

}