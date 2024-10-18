// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trilochanaa_app/views/widget/image_size_chekcer.dart';

import '../../Controllers/profile_controller.dart';
import '../../constants/constants.dart';
import '../widget/form_title.dart';
import '../widget/loader.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({Key? key}) : super(key: key);

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  String? imagePath;
  File? file;
  String get routeName => 'update_page';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'update_profile'.tr,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColor.primaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset(
            Images.backArrow,
            height: 24,
            width: 24,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<ProfileController>(
                init: ProfileController(),
                builder: (profile) => Stack(children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: imagePath == null
                                        ? CachedNetworkImage(
                                            imageUrl: profile.profileUser.image
                                                .toString(),
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    CircleAvatar(
                                                      radius: 40.0,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      backgroundImage:
                                                          imageProvider,
                                                    ),
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                                  child: const CircleAvatar(
                                                      radius: 40.0),
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor:
                                                      Colors.grey[400]!,
                                                ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    CircleAvatar(
                                                      child: Image.asset(
                                                        'assets/images/visitor.png',
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ))
                                        : CircleAvatar(
                                            radius: 40.0,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: FileImage(
                                                File(imagePath.toString())),
                                          )), //Center
                                Positioned(
                                  top: 70,
                                  right: 0,
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Container(
                                        child: TextButton(
                                          onPressed: () {
                                            getImage();
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: SvgPicture.asset(
                                              Images.gallery,
                                              height: 14,
                                              width: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: FormTitle(
                                          title: 'first_name'.tr,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: profile.firstNameController,
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.text,
                                        cursorColor: AppColor.primaryColor,
                                        validator: (value) => value!.isEmpty
                                            ? 'Enter your first name'
                                            : null,
                                        decoration: InputDecoration(
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          fillColor: Colors.red,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: AppColor.dividerColor,
                                                width: 1.0),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: AppColor.borderColor),
                                          ),
                                        ),
                                        onFieldSubmitted: (value) {
                                          //add code
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: FormTitle(
                                          title: 'last_name'.tr,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: profile.lastNameController,
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.text,
                                        cursorColor: AppColor.primaryColor,
                                        validator: (value) => value!.isEmpty
                                            ? 'Enter your last name'
                                            : null,
                                        decoration: InputDecoration(
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          fillColor: Colors.red,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: AppColor.dividerColor,
                                                width: 1.0),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: AppColor.borderColor),
                                          ),
                                        ),
                                        onFieldSubmitted: (value) {
                                          //add code
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: FormTitle(
                                          title: 'phone'.tr,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: profile.phoneController,
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.phone,
                                        cursorColor: AppColor.primaryColor,
                                        validator: (value) => value!.isEmpty
                                            ? 'Enter your phone'
                                            : null,
                                        decoration: InputDecoration(
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          fillColor: Colors.red,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: AppColor.dividerColor,
                                                width: 1.0),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: AppColor.borderColor),
                                          ),
                                        ),
                                        onFieldSubmitted: (value) {
                                          //add code
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: FormTitle(
                                          title: 'email'.tr,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: profile.emailController,
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.text,
                                        cursorColor: AppColor.primaryColor,
                                        validator: (value) => value!.isEmpty
                                            ? 'Enter your email'
                                            : null,
                                        decoration: InputDecoration(
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          fillColor: Colors.red,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: AppColor.dividerColor,
                                                width: 1.0),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: AppColor.borderColor),
                                          ),
                                        ),
                                        onFieldSubmitted: (value) {
                                          //add code
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: FormTitle(
                                          title: 'user_name'.tr,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller:
                                            profile.userNameCurrentController,
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.text,
                                        cursorColor: AppColor.primaryColor,
                                        validator: (value) => value!.isEmpty
                                            ? 'Enter your username'
                                            : null,
                                        decoration: InputDecoration(
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          fillColor: Colors.red,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: AppColor.dividerColor,
                                                width: 1.0),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: AppColor.borderColor),
                                          ),
                                        ),
                                        onFieldSubmitted: (value) {
                                          //add code
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: FormTitle(
                                          title: 'address'.tr,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: profile.addressController,
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.text,
                                        cursorColor: AppColor.primaryColor,
                                        validator: (value) => value!.isEmpty
                                            ? 'Enter your address'
                                            : null,
                                        decoration: InputDecoration(
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          fillColor: Colors.red,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: AppColor.dividerColor,
                                                width: 1.0),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: AppColor.borderColor),
                                          ),
                                        ),
                                        onFieldSubmitted: (value) {
                                          //add code
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 18.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text(
                                              "cancel".tr,
                                              style: TextStyle(
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            style: OutlinedButton.styleFrom(
                                              foregroundColor:
                                                  AppColor.nameColor,
                                              padding: const EdgeInsets.only(
                                                  left: 45.0,
                                                  right: 45.0,
                                                  top: 15.0,
                                                  bottom: 15.0),
                                              side: const BorderSide(
                                                  color: AppColor.primaryColor,
                                                  width: 1),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 24,
                                          ),
                                          OutlinedButton(
                                            onPressed: () {
                                              final FormState? form =
                                                  _formKey.currentState;
                                              if (form!.validate()) {
                                                if (imagePath == null) {
                                                  profile.updateUserProfile(
                                                      '', false);
                                                } else {
                                                  profile.updateUserProfile(
                                                      imagePath!, true);
                                                }
                                              }
                                            },
                                            child: Text(
                                              "update".tr,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            style: OutlinedButton.styleFrom(
                                              foregroundColor:
                                                  AppColor.nameColor,
                                              padding: const EdgeInsets.only(
                                                  left: 45.0,
                                                  right: 45.0,
                                                  top: 15.0,
                                                  bottom: 15.0),
                                              backgroundColor:
                                                  AppColor.primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      profile.profileUpdateLoader
                          ? Positioned(
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white60,
                                child: const Center(
                                  child: LoaderCircle(),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    ]))),
      ),
    );
  }

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    double imageSize = await ImageSize.getImageSize(image!);
    file = File(image.path);
    if (imageSize > 2) {
      Get.rawSnackbar(
          message: "IMAGE_SHOULD_BE_LESS_THAN_2MB".tr,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      //updateUserProfile(image.path, true);
      setState(() {
        file = File(image.path);
        imagePath = image.path;
      });
    }
  }
}
