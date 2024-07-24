import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'email_hint'.tr,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'password_hint'.tr,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('login_button'.tr),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('signup_button'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
