import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';

class ChangePasswordController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  TextEditingController passwordCurrentController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  bool passwordLoader = false;

  @override
  void onInit() {
    super.onInit();
  }


  updateUserPassword({BuildContext? context})  {
    passwordLoader = true;
     update();
    Map body = {
      'password_current': passwordCurrentController.text,
      'password': passwordController.text,
      'password_confirmation': passwordConfirmController.text,
    };
    String jsonBody = json.encode(body);
    print(jsonBody);
    server
        .postRequestWithToken(endPoint: APIList.changePassword, body: jsonBody)
        .then((response) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response != null && response.statusCode == 200) {
        Get.back();
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Change Password',
          message: 'Successfully Updated Password',
          backgroundColor: AppColor.greenColor.withOpacity(.9),
          maxWidth: ScreenSize(context!).mainWidth / 1.007,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
        passwordCurrentController.clear();
        passwordController.clear();
        passwordConfirmController.clear();
        passwordLoader = false;
        Future.delayed(Duration(milliseconds: 10), () {
          update();
        });
      } else if (response != null && response.statusCode == 422) {
        if (jsonResponse['data']['message']['password_current'] != null) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'Change Password',
            message: jsonResponse['data']['message']['password_current'].toString(),
            backgroundColor: AppColor.redColor.withOpacity(.9),
            maxWidth: ScreenSize(context!).mainWidth / 1.007,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );

        } else if (jsonResponse['data']['message']['password'] != null) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'Change Password',
            message: jsonResponse['data']['message']['password'].toString(),
            backgroundColor: AppColor.redColor.withOpacity(.9),
            maxWidth: ScreenSize(context!).mainWidth / 1.007,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );

        } else if (jsonResponse['data']['message']['password_confirmation'] != null) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'Change Password',
            message: jsonResponse['data']['message']['password_confirmation'].toString(),
            backgroundColor: AppColor.redColor.withOpacity(.9),
            maxWidth: ScreenSize(context!).mainWidth / 1.007,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        }
        passwordLoader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
      } else {
        passwordLoader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Change Password',
          message:  'Please enter valid input',
          backgroundColor: AppColor.redColor.withOpacity(.9),
          maxWidth: ScreenSize(context!).mainWidth / 1.007,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
      }
    });
  }
}
