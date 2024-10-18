// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Controllers/pre_register_visitor_details_controller.dart';
import '../../../constants/constants.dart';
import '../../shimmer/visitor_information_shimmer.dart';
import '../../widget/loader.dart';
import 'pre_register_edit_page.dart';

class PreRegisterVisitorDetails extends StatelessWidget {
  const PreRegisterVisitorDetails({Key? key, this.id}) : super(key: key);
  final String? id;

  @override
  Widget build(BuildContext context) {
    final preVisitorDetailsController =
        Get.put(PreVisitorDetailsController(id));

    return GetBuilder<PreVisitorDetailsController>(
        init: PreVisitorDetailsController(id),
        builder: (controller) {
          return Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text(
                    'Employee Attendance Info'.tr,
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
                bottomNavigationBar: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            _deleteConfirmation(context, controller);
                          },
                          child: Text(
                            "delete".tr,
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColor.nameColor,
                            padding: const EdgeInsets.only(
                                left: 36.0,
                                right: 36.0,
                                top: 15.0,
                                bottom: 15.0),
                            side: const BorderSide(
                                color: AppColor.primaryColor, width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Get.to(
                                () => PreRegisterEditPage(
                                      id: id,
                                    ),
                                duration: Duration(milliseconds: 400),
                                transition: Transition.downToUp);
                          },
                          child: Text(
                            "edit".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColor.nameColor,
                            padding: const EdgeInsets.only(
                                left: 45.0,
                                right: 45.0,
                                top: 15.0,
                                bottom: 15.0),
                            backgroundColor: AppColor.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    )),
                body: GetBuilder<PreVisitorDetailsController>(
                    init: PreVisitorDetailsController(id),
                    builder: (controller) {
                      return preVisitorDetailsController.loader
                          ? VisitorInformationShimmerPage()
                          : SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: CachedNetworkImage(
                                              imageUrl: controller
                                                  .preVisitor.image
                                                  .toString()
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
                                                    baseColor:
                                                        Colors.grey[300]!,
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
                                                      ))),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 21.0,
                                                right: 0,
                                                top: 0,
                                                bottom: 0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Images.name,
                                                  height: 18,
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'name'.tr,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .hintColor),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      controller.preVisitor.name
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .nameColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 21.0,
                                                right: 0,
                                                top: 0,
                                                bottom: 0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Images.email,
                                                  height: 18,
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'email'.tr,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .hintColor),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      controller
                                                          .preVisitor.email
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .nameColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 21.0,
                                                right: 0,
                                                top: 0,
                                                bottom: 0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Images.phone,
                                                  height: 18,
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'phone'.tr,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .hintColor),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      controller
                                                          .preVisitor.phone
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .nameColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 21.0,
                                                right: 0,
                                                top: 0,
                                                bottom: 0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Images.gender,
                                                  height: 18,
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'gender'.tr,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .hintColor),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      controller
                                                          .preVisitor.gender
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .nameColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 21.0,
                                                right: 0,
                                                top: 0,
                                                bottom: 0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Images.address,
                                                  height: 18,
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'address'.tr,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .hintColor),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      controller
                                                          .preVisitor.address
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .nameColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 21.0,
                                                right: 0,
                                                top: 0,
                                                bottom: 0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Images.name,
                                                  height: 18,
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'nid_no'.tr,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .hintColor),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      controller.preVisitor
                                                          .nationalIdentificationNo
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .nameColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 21.0,
                                                right: 0,
                                                top: 0,
                                                bottom: 0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Images.employee,
                                                  height: 18,
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'employee'.tr,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .hintColor),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      controller.preVisitor
                                                          .employeeName
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .nameColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 21.0,
                                                right: 0,
                                                top: 0,
                                                bottom: 0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Images.purpose,
                                                  height: 18,
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'comment'.tr,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .hintColor),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      controller
                                                          .preVisitor.comment
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .nameColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 21.0,
                                                right: 0,
                                                top: 0,
                                                bottom: 0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Images.date,
                                                  height: 18,
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'expected_date'.tr,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .hintColor),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      controller.preVisitor
                                                          .expectedDate
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .nameColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 21.0,
                                                right: 0,
                                                top: 0,
                                                bottom: 0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Images.clock,
                                                  height: 18,
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'expected_time'.tr,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .hintColor),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      controller.preVisitor
                                                          .expectedTime
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .nameColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 21.0,
                                                right: 0,
                                                top: 0,
                                                bottom: 0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Images.status,
                                                  height: 18,
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'status'.tr,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .hintColor),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      controller
                                                          .preVisitor.status
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .nameColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                    }),
              ),
              controller.loader
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
                  : SizedBox.shrink()
            ],
          );
        });
  }

  _deleteConfirmation(context, controller) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "delete".tr,
      desc: "are_you_sure_delete".tr,
      buttons: [
        DialogButton(
          child: Text(
            "yes".tr,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {
            controller.deletePreReg(context, id);
            Get.back();
          },
          color: AppColor.primaryColor,
        ),
        DialogButton(
          child: Text(
            "no".tr,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () => Navigator.pop(context),
          color: AppColor.redColor,
        )
      ],
    ).show();
  }
}
