import 'package:get/get.dart';
import 'package:mvvm_mvc/data/response/status.dart';
import 'package:mvvm_mvc/models/home/home_model.dart';
import 'package:mvvm_mvc/repository/home/user_list_repository.dart';
class HomeControllerGet extends GetxController{
  UserListRepo userListRepo = UserListRepo();
  final RxRequestStatus = Status.LOADING.obs;
  final RxUserList = HomeModel().obs;

  void setRxRequestStatus(Status value) => RxRequestStatus.value = value;
  void setRxUserList(HomeModel value) => RxUserList.value = value;
  void userListApi(){
    userListRepo.getApi().then((value) {
      setRxRequestStatus(Status.COMPLETD);
      setRxUserList(value);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
    });
  }
}