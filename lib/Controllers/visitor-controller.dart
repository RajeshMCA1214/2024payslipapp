import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trilochanaa_app/Controllers/dashboard_controller.dart';
import '../Models/visitor_model.dart';
import '../Models/visitor_details_model.dart';
import '../Services/api-list.dart';
import '../constants/constants.dart';
import '../services/server.dart';

class VisitorController extends GetxController {
  Server server = Server();
  bool loader = false;
  List<Visitor> visitorList = <Visitor>[];
  List<Visitor> visitorSearchList = <Visitor>[];
  VisitorDetails visitorDetails = VisitorDetails();

  @override
  void onInit() {
    super.onInit();
    getVisitors();
  }

  getVisitors() async {
    loader = true;
    update();
    visitorList = <Visitor>[];
    server.getRequest(endPoint: APIList.visitorList).then((response) {
      if (response != null && response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var visitorListData = VisitorListModel.fromJson(jsonResponse);
        visitorList = <Visitor>[];
        visitorList.addAll(visitorListData.data!.visitor!);
        loader = false;
        update();
      } else {
        loader = false;
        update();
        return null;
      }
    });
  }

  getSearchedVisitors(name) async {
    if (name.toString().isEmpty) {
      getVisitors();
    } else {
      loader = true;
      update();
      server
          .getRequest(endPoint: (APIList.visitorSearchList! + "$name"))
          .then((response) {
        if (response != null && response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          print(jsonResponse);
          var visitorSearchListData = VisitorListModel.fromJson(jsonResponse);
          visitorList = <Visitor>[];
          visitorList.addAll(visitorSearchListData.data!.visitor!);
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

  changeStatus(context, id, status) {
    loader = false;
    update();
    server
        .getRequest(endPoint: (APIList.changeStatus! + "$id" + "/" + "$status"))
        .then((response) async {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        loader = true;
        getVisitors();
        Get.find<DashboardController>().onInit();
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
        loader = true;
        getVisitors();
        Get.find<DashboardController>().onInit();

        update();
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
      } else if (response != null && response.statusCode == 404) {
        final jsonResponse = jsonDecode(response.body);
        loader = true;
        update();
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
