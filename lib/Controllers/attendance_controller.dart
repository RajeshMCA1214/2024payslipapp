import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trilochanaa_app/Models/attendance_model.dart';
//import 'package:trilochanaa_app/Models/attendance_model.dart';
import 'package:trilochanaa_app/SplashScreen/splash_screen.dart';

import '../constants/constants.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';

class AttendanceController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  TextEditingController workController = TextEditingController();
  bool commonLoader = true;
  bool loader = false;
  bool loaders = false;
  late Employee profileUser;
  String currentDate = '';
  String currentTime = '';
  String clockIN = '';
  String clockOut = '';
  String workFrom = '';
  bool showClockin = true;

  @override
  void onInit() {
    getAttendanceStatus();
    super.onInit();
  }

  getAttendanceStatus() {
    server.getRequest(endPoint: APIList.attendanceStatus).then((response) {
      if (response != null && response.statusCode == 200) {
        commonLoader = false;
        final jsonResponse = json.decode(response.body);
        var attData = AttendanceModel.fromJson(jsonResponse);
        profileUser = attData.data!.employee!;
        showClockin = attData.data!.showClockin!;
        currentDate = attData.data!.currentDate.toString();
        currentTime =  attData.data!.currentTime.toString();
        clockIN =  attData.data!.attendance == null?'':attData.data!.attendance!.checkinTime.toString();
        clockOut =  attData.data!.attendance == null?'':attData.data!.attendance!.checkoutTime == null ?'':attData.data!.attendance!.checkoutTime.toString();
        workFrom =  attData.data!.attendance == null ? '':attData.data!.attendance!.title.toString();
        print(clockOut);
        print(showClockin);
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
      } else {
        commonLoader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }

  clockInUpdate(context,work)  {
    loader = true;
    update();
    Map body = {
      'title': work,
    };
    String jsonBody = json.encode(body);
    server
        .postRequestWithToken(endPoint: APIList.attendanceClockin, body: jsonBody)
        .then((response) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response != null && response.statusCode == 200) {
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Clock In',
          message: 'Clocked In Successfully',
          backgroundColor: AppColor.greenColor.withOpacity(.9),
          maxWidth: ScreenSize(context!).mainWidth / 1.007,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        getAttendanceStatus();
      } else {
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }

  clockOutUpdate(context) async {
    loaders = true;
    update();
    server.getRequest(endPoint: APIList.attendanceClockout).then((response) {
      if (response != null && response.statusCode == 200) {
        Get.off(const SplashScreen());
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Clock Out',
          message: 'Clocked Out Successfully',
          backgroundColor: AppColor.greenColor.withOpacity(.9),
          maxWidth: ScreenSize(context!).mainWidth / 1.007,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
        loaders = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        getAttendanceStatus();
      } else {
        loaders = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }
}
