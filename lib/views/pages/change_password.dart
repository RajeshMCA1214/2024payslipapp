// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trilochanaa_app/views/widget/loader.dart';

import '../../Controllers/change_password_controller.dart';
import '../../constants/constants.dart';
import '../widget/form_title.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);

  String get routeName => 'change_password';
  final ChangePasswordController changePasswordController =
      ChangePasswordController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'change_password'.tr,
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
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: GetBuilder<ChangePasswordController>(
                  init: ChangePasswordController(),
                  builder: (changePassword) => Stack(children: [
                        SingleChildScrollView(
                          child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 48,
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: FormTitle(
                                        title: 'User Name'.tr,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: changePassword
                                          .passwordCurrentController,
                                      obscureText: true,
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.text,
                                      cursorColor: AppColor.primaryColor,
                                      validator: (value) => value!.isEmpty
                                          ? 'Enter old password'
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
                                        focusedErrorBorder: OutlineInputBorder(
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
                                        enabledBorder: const OutlineInputBorder(
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

                                  SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                      padding:
                                      const EdgeInsets.only(left: 10.0),
                                      child: FormTitle(
                                        title: 'old_password'.tr,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: changePassword
                                          .passwordCurrentController,
                                      obscureText: true,
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.text,
                                      cursorColor: AppColor.primaryColor,
                                      validator: (value) => value!.isEmpty
                                          ? 'Enter old password'
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
                                        focusedErrorBorder: OutlineInputBorder(
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
                                        enabledBorder: const OutlineInputBorder(
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
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: FormTitle(
                                        title: 'new_password'.tr,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller:
                                          changePassword.passwordController,
                                      obscureText: true,
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.text,
                                      cursorColor: AppColor.primaryColor,
                                      validator: (value) => value!.isEmpty
                                          ? 'Enter new password'
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
                                        focusedErrorBorder: OutlineInputBorder(
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
                                        enabledBorder: const OutlineInputBorder(
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
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: FormTitle(
                                        title: 'new_password_confirmation'.tr,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: changePassword
                                          .passwordConfirmController,
                                      obscureText: true,
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.text,
                                      cursorColor: AppColor.primaryColor,
                                      validator: (value) => value!.isEmpty
                                          ? 'Enter confirmation password'
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
                                        focusedErrorBorder: OutlineInputBorder(
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
                                        enabledBorder: const OutlineInputBorder(
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
                                  SizedBox(
                                    height: 36.0,
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
                                            foregroundColor: AppColor.nameColor,
                                            padding: EdgeInsets.only(
                                                left: 45.0,
                                                right: 45.0,
                                                top: 15.0,
                                                bottom: 15.0),
                                            side: BorderSide(
                                                color: AppColor.primaryColor,
                                                width: 1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 24,
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                            final FormState? form =
                                                _formKey.currentState;
                                            if (form!.validate()) {
                                              changePassword.updateUserPassword(
                                                  context: context);
                                            }
                                          },
                                          child: Text(
                                            "save".tr,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: AppColor.nameColor,
                                            padding: EdgeInsets.only(
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
                        ),
                        changePassword.passwordLoader
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
      ),
    );
  }
}
