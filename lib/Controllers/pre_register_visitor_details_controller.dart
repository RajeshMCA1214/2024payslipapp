import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trilochanaa_app/Controllers/pre_register_controller.dart';
import '../Models/pre_register_details_model.dart';
import '../Services/api-list.dart';
import '../constants/constants.dart';
import '../services/server.dart';

class PreVisitorDetailsController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  late TextEditingController dateController = TextEditingController();
  late TextEditingController timeController = TextEditingController();

  Server server = Server();
  bool loader = false;
  PreVisitor preVisitor = PreVisitor();
  String? visitorId;
  late String genderID = "5";

  PreVisitorDetailsController(this.visitorId);
  @override
  void onInit() {
    getVisitorDetails(visitorId);
    super.onInit();
  }

  getVisitorDetails(id) async {
    loader = true;
    update();
    server
        .getRequest(endPoint: (APIList.preVisitorDetails! + "$id" + "/show"))
        .then((response) {
      if (response != null && response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var preVisitorDetailsData = PreRegisterDetails.fromJson(jsonResponse);
        preVisitor = preVisitorDetailsData.data!.visitor!;
        firstNameController.text = preVisitor.firstName!.toString();
        lastNameController.text = preVisitor.lastName!.toString();
        emailController.text = preVisitor.email!.toString();
        phoneController.text = preVisitor.phone!.toString();
        genderID = preVisitor.genderId!.toString();
        addressController.text = preVisitor.address!.toString();
        nidController.text = preVisitor.nationalIdentificationNo!.toString();
        purposeController.text = preVisitor.comment!.toString();
        dateController.text =
            DateTime.parse(preVisitor.rawExpectedDate.toString()).toString();
        timeController.text = preVisitor.rawExpectedTime.toString();
        print(preVisitor.rawExpectedTime.toString());

        loader = false;
        update();
      } else {
        loader = false;
        update();
        return null;
      }
    });
  }

  updatePreRegisterVisitor(context, preRegisterData, id) {
    loader = true;
    update();
    Map body = preRegisterData;
    String jsonBody = json.encode(body);
    print(preRegisterData);
    server
        .postRequestWithToken(
            endPoint: (APIList.preRegUpdate! + "$id"), body: jsonBody)
        .then((response) {
      final jsonResponse = json.decode(response.body);
      if (response != null && response.statusCode == 200) {
        getVisitorDetails(id);
        Get.find<PreRegisterController>().onInit();
        Get.back();
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Pre Register',
          message: 'Successfully Updated',
          backgroundColor: AppColor.greenColor.withOpacity(.9),
          maxWidth: ScreenSize(context!).mainWidth / 1.007,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
        loader = false;
        update();
      } else if (response != null && response.statusCode == 422) {
        if (jsonResponse['data']['message']['email'] != null) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'Email',
            message: jsonResponse['data']['message']['email'].toString(),
            backgroundColor: AppColor.redColor.withOpacity(.9),
            maxWidth: ScreenSize(context!).mainWidth / 1.007,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        } else if (jsonResponse['data']['message']['phone'] != null) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'Phone',
            message: jsonResponse['data']['message']['phone'].toString(),
            backgroundColor: AppColor.redColor.withOpacity(.9),
            maxWidth: ScreenSize(context!).mainWidth / 1.007,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        } else if (jsonResponse['data']['message']['expected_date'] != null) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'Expected Date',
            message:
                jsonResponse['data']['message']['expected_date'].toString(),
            backgroundColor: AppColor.redColor.withOpacity(.9),
            maxWidth: ScreenSize(context!).mainWidth / 1.007,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        } else if (jsonResponse['data']['message']['expected_date'] != null) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'Expected Time',
            message:
                jsonResponse['data']['message']['expected_date'].toString(),
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

  deletePreReg(context, id) {
    loader = true;
    update();
    server
        .deleteRequest(endPoint: (APIList.preRegisterDelete! + "$id"))
        .then((response) {
      if (response != null && response.statusCode == 200) {
        getVisitorDetails(id);
        Get.find<PreRegisterController>().onInit();
        Get.back();
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Delete Pre Register',
          message: 'Successfully Deleted',
          backgroundColor: AppColor.greenColor.withOpacity(.9),
          maxWidth: ScreenSize(context!).mainWidth / 1.007,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
        loader = false;
        update();
      } else {
        loader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Delete Pre Register',
          message: 'Something Wrong',
          backgroundColor: AppColor.redColor.withOpacity(.9),
          maxWidth: ScreenSize(context!).mainWidth / 1.007,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
      }
    });
  }
}
