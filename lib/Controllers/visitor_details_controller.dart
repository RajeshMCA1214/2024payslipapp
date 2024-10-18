import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trilochanaa_app/Controllers/visitor-controller.dart';
import '../Models/visitor_details_model.dart';
import '../Services/api-list.dart';
import '../constants/constants.dart';
import '../services/server.dart';
import 'dashboard_controller.dart';

class VisitorDetailsController extends GetxController {
  Server server = Server();
  bool loader = false;
  VisitorDetails visitorDetails = VisitorDetails();
  String? visitorId;

  VisitorDetailsController(this.visitorId);
  @override
  void onInit() {
    getVisitorDetails(visitorId);
    super.onInit();
  }

  getVisitorDetails(id) async {
    print(id);
    loader = true;
    update();
    server
        .getRequest(endPoint: (APIList.visitorDetails! + "$id"))
        .then((response) {
      if (response != null && response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var visitorDetailsData = VisitorDetailsModel.fromJson(jsonResponse);
        visitorDetails = visitorDetailsData.data!.visitorDetails!;
        print(visitorDetailsData.data!.visitorDetails!.status);
        loader = false;
        update();
      } else {
        loader = false;
        update();
        return null;
      }
    });
  }

  changeStatus(context, id, status) {
    loader = false;
    update();
    server
        .getRequest(endPoint: (APIList.changeStatus! + "$id" + "/" + "$status"))
        .then((response) async {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        loader = true;
        getVisitorDetails(id);
        Get.find<DashboardController>().onInit();
        Get.find<VisitorController>().onInit();
        update();
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Check In Status',
          message: jsonResponse['data']['message'],
          backgroundColor: AppColor.greenColor.withOpacity(.9),
          maxWidth: ScreenSize(context!).mainWidth / 1.007,
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
        loader = false;
        update();
      } else {
        loader = false;
        update();
        return null;
      }
    });
  }

  checkOut(context, visitorId) {
    loader = false;
    update();
    server
        .getRequest(endPoint: (APIList.checkOut! + "$visitorId"))
        .then((response) async {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        getVisitorDetails(visitorId);
        Get.find<DashboardController>().onInit();
        Get.find<VisitorController>().onInit();
        update();
        Get.back();
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Check Out',
          message: jsonResponse['data']['message'],
          backgroundColor: AppColor.greenColor.withOpacity(.9),
          maxWidth: ScreenSize(context!).mainWidth / 1.007,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
        loader = false;
        update();
      } else if (response != null && response.statusCode == 404) {
        final jsonResponse = jsonDecode(response.body);
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Check Out',
          message: jsonResponse['data']['message'],
          backgroundColor: AppColor.greenColor.withOpacity(.9),
          maxWidth: ScreenSize(context!).mainWidth / 1.007,
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
        loader = false;
        update();
      } else {
        loader = false;
        update();
        return null;
      }
    });
  }
}
