import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilochanaa_app/Models/login_model.dart';
import '../Models/login.dart';
import '../Models/refreshtoken_model.dart';
import '../views/widget/bottom_nav.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import '/services/validators.dart';
import 'package:get/get.dart';

import 'global-controller.dart';

class AuthController extends GetxController {
  UserService userService = UserService();
  final Validators _validators = Validators();
  Server server = Server();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  bool obscureText = true;
  bool loader = false;

  changeVisibility() {
    obscureText = !obscureText;
    update();
  }

  /*loginOnTap({BuildContext? context, String? email, String? pass}) async {
    loader = true;
    update();

    var passValidator = _validators.validatePassword(value: pass);
    if (passValidator == null) {
      Map<String, dynamic> body = {'email': email, 'password': pass};
      String jsonBody = json.encode(body);

      server.postRequest(endPoint: APIList.login, body: jsonBody).then((response) {
        if (response != null && response.statusCode == 200) {
          final jsonResponse = json.decode(response.body);
          print('Response Body: $jsonResponse');

          var loginData = LoginModule.fromJson(jsonResponse);
          var bearerToken = 'Bearer ${loginData.token}';

          userService.saveBoolean(key: 'is_success', value: true);
          userService.saveString(key: 'token', value: loginData.token);
          userService.saveString(key: 'user-id', value: loginData.data?.id);
          userService.saveString(key: 'email', value: loginData.data?.email);
          userService.saveString(key: 'name', value: loginData.data?.name);
          userService.saveString(key: 'phone', value: loginData.data?.phone);

          Server.initClass(token: bearerToken);
          Get.put(GlobalController()).initController();
          emailController.clear();
          passwordController.clear();
          loader = false;
          update();
          Get.off(() => BottomNav());
          Get.rawSnackbar(
            message: loginData.message,
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP,
          );
        } else {
          loader = false;
          update();
          final jsonResponse = json.decode(response.body);
          Get.rawSnackbar(
            message: jsonResponse['message'],
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.TOP,
          );
        }
      });
    } else {
      loader = false;
      update();
      Get.rawSnackbar(
        message: 'Please enter email address and password',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
    }
  }*/
  loginOnTap({BuildContext? context, String? email, String? pass}) async {
    loader = true;
    update();

    var passValidator = _validators.validatePassword(value: pass);
    if (passValidator == null) {
      Map<String, dynamic> body = {'email': email, 'password': pass};
      String jsonBody = json.encode(body);

      server.postRequest(endPoint: APIList.login, body: jsonBody).then((response) {
        if (response != null && response.statusCode == 200) {
          final jsonResponse = json.decode(response.body);

          if (jsonResponse['status'] == '200') {
            var loginData = LoginModule.fromJson(jsonResponse);
            var bearerToken = 'Bearer ${loginData.token}';

            // Save session data
            saveSessionData(loginData);

            Server.initClass(token: bearerToken);
            Get.put(GlobalController()).initController();
            emailController.clear();
            passwordController.clear();
            loader = false;
            update();
            Get.off(() => BottomNav());
            Get.rawSnackbar(
              message: loginData.message,
              backgroundColor: Colors.green,
              snackPosition: SnackPosition.TOP,
            );
          } else {
            String errorMessage = jsonResponse.containsKey('message') ? jsonResponse['message'] : 'Invalid Email or password';
            print('Error message: $errorMessage');
            loader = false;
            update();
            Get.rawSnackbar(
              message: errorMessage,
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.TOP,
            );
          }
        } else {
          loader = false;
          update();
          final jsonResponse = json.decode(response.body);
          Get.rawSnackbar(
            message: jsonResponse['message'],
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.TOP,
          );
        }
      });
    } else {
      loader = false;
      update();
      Get.rawSnackbar(
        message: 'Please enter email address and password',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  // Save session data to SharedPreferences
  void saveSessionData(LoginModule loginData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', true);
    await prefs.setString('token', loginData.token);
    await prefs.setString('user_id', loginData.data!.id);
    await prefs.setString('email', loginData.data!.email);
    await prefs.setString('name', loginData.data!.name);
    await prefs.setString('phone', loginData.data!.phone);
  }


  refreshToken(context) async {
    server.getRequest(endPoint: APIList.refreshToken).then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        var refreshData = RefreshTokenModel.fromJson(jsonResponse);
        var newToken = 'Bearer ${refreshData.data?.token}';

        userService.saveBoolean(key: 'is_success', value: true);
        userService.saveString(key: 'token', value: refreshData.data?.token);

        Server.initClass(token: newToken);
        Get.put(GlobalController()).initController();
        Get.off(() => BottomNav());
        return true;
      } else {
        Get.find<GlobalController>().userLogout(context: context);
        return false;
      }
    });
  }

  updateFcmSubscribe(email) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    var deviceToken = storage.getString('deviceToken');
    Map<String, dynamic> body = {
      "device_token": deviceToken,
      "topic": email,
    };
    String jsonBody = json.encode(body);

    server.postRequest(endPoint: APIList.fcmSubscribe, body: jsonBody).then((response) {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print('responseBody===========>');
        print(jsonResponse);
      }
    });
  }
}
