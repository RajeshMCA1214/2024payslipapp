import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import '../Models/profile_model.dart';

class ProfileController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController userNameCurrentController = TextEditingController();

  String? userID;
  String? employeeID;

  bool profileLoader = true;
  bool profileUpdateLoader = false;
  bool commonLoader = false;
  late Profile profileUser;

  @override
  void onInit() {
    getUserProfile();
    super.onInit();
  }

  getUserProfile() {
    server.getRequest(endPoint: APIList.profile).then((response) {
      if (response != null && response.statusCode == 200) {
        profileLoader = false;
        final jsonResponse = json.decode(response.body);
        var profileData = ProfileModel.fromJson(jsonResponse);
        profileUser = profileData.data!.profile!;
        emailController.text = profileUser.email.toString();
        firstNameController.text = profileUser.first_name.toString();
        lastNameController.text = profileUser.last_name.toString();
        phoneController.text = profileUser.phone.toString();
        addressController.text =
            profileUser.address == null ? "" : profileUser.address.toString();
        userNameCurrentController.text = profileUser.username.toString();

        employeeID = profileUser.id.toString();
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
      } else {
        profileLoader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
      }
    });
  }

  updateUserProfile(filepath, type) async {
    print(filepath);
    profileUpdateLoader = true;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });
    Map<String, String> body = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'address': addressController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'username': userNameCurrentController.text,
    };
    print(body);
    server
        .multipartRequest(
            endPoint: APIList.profileUpdate,
            body: body,
            filepath: filepath,
            type: type)
        .then((response) {
      if (response != null && response.statusCode == 200) {
        emailController.clear();
        firstNameController.clear();
        lastNameController.clear();
        addressController.clear();
        phoneController.clear();
        profileUpdateLoader = false;
        getUserProfile();
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.back();
        Get.rawSnackbar(
            message: "profile_updated".tr,
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP);
      } else {
        profileUpdateLoader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        Get.rawSnackbar(message: 'Please enter valid input');
      }
    });
  }
}
