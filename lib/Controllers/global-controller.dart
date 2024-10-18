
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilochanaa_app/Models/profile_model.dart';
import 'package:trilochanaa_app/views/pages/login.dart';
import '../Services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';

class GlobalController extends GetxController {
  Server server = Server();

  UserService userService = UserService();
  bool profileLoader = true;
  String? bearerToken, siteName, siteEmail, siteLogo, currencyCode, currencyName;

   bool isUser = false;
  String? userId;
  String? userImage;
  String? userName;
  String? userEmail;

  initController() async {
    final validUser = await userService.loginCheck();
    isUser = validUser;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });
    if (isUser) {
      final token = await userService.getToken();
      final myId = await userService.getUserId();
      bearerToken = token;
      userId = myId;
      Future.delayed(const Duration(milliseconds: 10), () {
        update();
      });
      Server.initClass(token: bearerToken);

    }
  }

  @override
  void onInit() {
    initController();
    super.onInit();
  }

  getUserProfile() {
    server.getRequest(endPoint: APIList.profile).then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        var profileData = ProfileModel.fromJson(jsonResponse);
        userName = profileData.data!.profile!.name;
        userEmail = profileData.data!.profile!.email;
        userImage = profileData.data!.profile!.image;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }


  userLogout({BuildContext? context}) async {
    getValue();
    await userService.removeSharedPreferenceData();
    await updateFcmUnSubscribe();
    isUser = false;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });
    Get.off(() => const LoginPage());
  }

  getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('token');

    return stringValue;
  }

  updateFcmUnSubscribe() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    var deviceToken = storage.getString('deviceToken');
    Map body = {
      "device_token": deviceToken,
      "topic": null,
    };
    String jsonBody = json.encode(body);
    server
        .postRequest(endPoint: APIList.fcmUnSubscribe, body: jsonBody)
        .then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print('responseBody===========>');
        print(jsonResponse);
      }
    });
  }
}
