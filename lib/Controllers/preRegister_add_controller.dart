import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trilochanaa_app/Controllers/pre_register_controller.dart';
import '../constants/constants.dart';
import '/services/api-list.dart';
import '/services/server.dart';

class AddPreRegisterController extends GetxController {
  Server server = Server();
  bool loader = false;
  @override
  void onInit() {
    super.onInit();
  }

  addPreRegisterVisitor(context, preRegisterData) {
    loader = true;
    update();
    Map body = preRegisterData;
    String jsonBody = json.encode(body);
    print(jsonBody);
    server
        .postRequestWithToken(endPoint: APIList.preRegisterList, body: jsonBody)
        .then((response) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response != null && response.statusCode == 200) {
        Get.find<PreRegisterController>().onInit();
        Get.back();
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Pre Register',
          message: 'Successfully Added',
          backgroundColor: AppColor.greenColor.withOpacity(.9),
          maxWidth: ScreenSize(context!).mainWidth / 1.007,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
        loader = false;
        update();
      } else if (response != null && response.statusCode == 422) {
        if (jsonResponse['error']['first_name'] != null) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'First Name',
            message: jsonResponse['error']['first_name'].toString(),
            backgroundColor: AppColor.redColor.withOpacity(.9),
            maxWidth: ScreenSize(context!).mainWidth / 1.007,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        } else if (jsonResponse['error']['last_name'] != null) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'Last Name',
            message: jsonResponse['error']['last_name'].toString(),
            backgroundColor: AppColor.redColor.withOpacity(.9),
            maxWidth: ScreenSize(context!).mainWidth / 1.007,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        } else if (jsonResponse['error']['email'] != null) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'Email',
            message: jsonResponse['error']['email'].toString(),
            backgroundColor: AppColor.redColor.withOpacity(.9),
            maxWidth: ScreenSize(context!).mainWidth / 1.007,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        } else if (jsonResponse['error']['phone'] != null) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'Phone',
            message: jsonResponse['error']['phone'].toString(),
            backgroundColor: AppColor.redColor.withOpacity(.9),
            maxWidth: ScreenSize(context!).mainWidth / 1.007,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        } else if (jsonResponse['error']['national_identification_no'] !=
            null) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'NID NO.',
            message:
                jsonResponse['error']['national_identification_no'].toString(),
            backgroundColor: AppColor.redColor.withOpacity(.9),
            maxWidth: ScreenSize(context!).mainWidth / 1.007,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        } else if (jsonResponse['error']['expected_date'] != null) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'Expected Date',
            message: jsonResponse['error']['expected_date'].toString(),
            backgroundColor: AppColor.redColor.withOpacity(.9),
            maxWidth: ScreenSize(context!).mainWidth / 1.007,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        } else if (jsonResponse['error']['expected_time'] != null) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'Expected Time',
            message: jsonResponse['error']['expected_time'].toString(),
            backgroundColor: AppColor.redColor.withOpacity(.9),
            maxWidth: ScreenSize(context!).mainWidth / 1.007,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        }
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
      } else {
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Pre Register',
          message: 'Something Wrong',
          backgroundColor: AppColor.redColor.withOpacity(.9),
          maxWidth: ScreenSize(context!).mainWidth / 1.007,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
      }
    });
  }
}
