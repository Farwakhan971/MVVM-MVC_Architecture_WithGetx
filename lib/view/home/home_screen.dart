import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_mvc/data/response/status.dart';
import 'package:mvvm_mvc/res/routes/routes_name.dart';
import 'package:mvvm_mvc/view_model/home/home_controller.dart';
import 'package:mvvm_mvc/view_model/shared_preferences/shared_preferences_controller.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  UserPreferences up = UserPreferences();
  HomeControllerGet homeControllerGet = Get.put(HomeControllerGet());
  @override
  void initState() {
    super.initState();
    homeControllerGet.userListApi();
  }
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
      body: Obx((){
        switch(homeControllerGet.RxRequestStatus.value){
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.COMPLETD:
            return ListView.builder(
                itemCount: homeControllerGet.RxUserList.value.data!.length,
                itemBuilder: (context, index){
                      return Card(
                          child: ListTile(
                            title: Text(homeControllerGet.RxUserList.value.data![index].firstName.toString()),
                            subtitle: Text(homeControllerGet.RxUserList.value.data![index].lastName.toString()),
                            trailing: CircleAvatar(
                                backgroundImage: NetworkImage(homeControllerGet.RxUserList.value.data![index].avatar.toString())),
                          ),
                      );
            });
          case Status.ERROR:
          return Center(child: Text('Request not SucessFull. some error'));
        }
      })
    );
  }
}
