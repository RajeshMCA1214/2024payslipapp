// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trilochanaa_app/Controllers/visitor-controller.dart';
import '../../../Controllers/visitor_details_controller.dart';
import '../../shimmer/visitor_information_shimmer.dart';
import '../../../constants/constants.dart';

class VisitorInformationPage extends StatelessWidget {
  VisitorInformationPage(
      {Key? key,
      required this.id,
      this.status,
      this.visitorId,
      this.checkOutAt})
      : super(key: key);
  final String? id;
  final String? status;
  final String? visitorId;
  final String? checkOutAt;
  final VisitorController visitorController = Get.put(VisitorController());

  @override
  Widget build(BuildContext context) {
    final visitorDetailsController = Get.put(VisitorDetailsController(id));

    return GetBuilder<VisitorDetailsController>(
        init: VisitorDetailsController(id),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Employee Information'.tr,
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
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                margin: EdgeInsets.only(bottom: 20),
                child: controller.visitorDetails.status == "2"
                    ? controller.visitorDetails.checkoutAt?.length == 0
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(58),
                              backgroundColor: AppColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // <-- Radius
                              ),
                              // fromHeight use double.infinity as width and 40 is the height
                            ),
                            onPressed: () {
                              _checkOut(context, controller, visitorId);
                            },
                            child: Text(
                              "check_out".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          )
                        : SizedBox().marginZero
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (controller.visitorDetails.status == "1")
                            OutlinedButton(
                              onPressed: () {
                                _cancelAlert(context, controller, visitorId);
                              },
                              child: Text(
                                "reject".tr,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColor.nameColor,
                                padding: const EdgeInsets.only(
                                    left: 45.0,
                                    right: 45.0,
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
                          if (controller.visitorDetails.status == "1")
                            OutlinedButton(
                              onPressed: () {
                                _approveAlert(context, controller, visitorId);
                              },
                              child: Text(
                                "accept".tr,
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
                          // if (controller.visitorDetails.status == "2" &&
                          //     controller.visitorDetails.checkoutAt?.length == 0)
                        ],
                      ),
              ),
              body: visitorDetailsController.loader
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
                                      imageUrl: controller.visitorDetails.image
                                          .toString(),
                                      imageBuilder: (context, imageProvider) =>
                                          CircleAvatar(
                                            radius: 40.0,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: imageProvider,
                                          ),
                                      placeholder: (context, url) =>
                                          Shimmer.fromColors(
                                            child: const CircleAvatar(
                                                radius: 40.0),
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[400]!,
                                          ),
                                      errorWidget: (context, url, error) =>
                                          CircleAvatar(
                                            child: Image.asset(
                                              'assets/images/visitor.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ))),
                              SizedBox(
                                height: 15,
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
                                            InkWell(
                                              onTap: () {
                                                print(controller
                                                    .visitorDetails.name);
                                              },
                                              child: Text(
                                                "name".tr,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.hintColor),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller.visitorDetails.name
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
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
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller.visitorDetails.email
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
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
                                        const SizedBox(
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
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller.visitorDetails.phone
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
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
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller
                                                  .visitorDetails.genderName
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
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
                                          Images.company,
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
                                              'company'.tr,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller
                                                  .visitorDetails.companyName
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
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
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller.visitorDetails
                                                  .nationalIdentificationNo
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
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
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller.visitorDetails.address
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
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
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller.visitorDetails.employee
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
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
                                              'purpose'.tr,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller.visitorDetails.purpose
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
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
                                              'date'.tr,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller.visitorDetails.date
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
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
                                              'check_in'.tr,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller
                                                  .visitorDetails.checkinAt
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
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
                                              'check_out'.tr,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller
                                                  .visitorDetails.checkoutAt
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
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
                    ));
        });
  }

  _cancelAlert(context, controller, visitorID) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Decline",
      desc: "Are you sure, want to decline ?",
      buttons: [
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {
            controller.changeStatus(context, id, 3);
            Get.back();
          },
          color: AppColor.primaryColor,
        ),
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () => Navigator.pop(context),
          color: AppColor.redColor,
        )
      ],
    ).show();
  }

  _approveAlert(context, controller, visitorID) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Approve",
      desc: "Are you sure, want to approve ?",
      buttons: [
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {
            controller.changeStatus(context, id, 2);
            Get.back();
          },
          color: AppColor.primaryColor,
        ),
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () => Navigator.pop(context),
          color: AppColor.redColor,
        )
      ],
    ).show();
  }

  _checkOut(context, controller, visitorID) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Check Out",
      desc: "Are you sure, want to check out ?",
      buttons: [
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {
            controller.checkOut(context, visitorID);
            Get.back();
          },
          color: AppColor.primaryColor,
        ),
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () => Navigator.pop(context),
          color: AppColor.redColor,
        )
      ],
    ).show();
  }
}
