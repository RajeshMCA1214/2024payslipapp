// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trilochanaa_app/Controllers/visitor-controller.dart';
import 'package:trilochanaa_app/constants/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../pages/visitor/visitor_information.dart';

class VisitorCard extends StatelessWidget {
  VisitorCard({
    Key? key,
    required this.name,
    required this.statusName,
    required this.id,
    required this.visitorID,
    required this.status,
    required this.image,
    required this.checkInAt,
    required this.checkOutAt,
  }) : super(key: key);
  final String name;
  final String id;
  final String visitorID;
  final String status;
  final String statusName;
  final String image;
  final String checkInAt;
  final String checkOutAt;

  final VisitorController visitorController = Get.put(VisitorController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            () => VisitorInformationPage(
                  status: status,
                  id: id,
                  visitorId: visitorID,
                  checkOutAt: checkOutAt,
                ),
            duration: Duration(milliseconds: 400),
            transition: Transition.rightToLeft);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14.0),
        child: Container(
          height: 102,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColor.borderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: image,
                    imageBuilder: (context, imageProvider) => Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 60,
                      width: 60,
                    ),
                    placeholder: (context, url) => Shimmer.fromColors(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/profile.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 60,
                        width: 60,
                      ),
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[400]!,
                    ),
                    errorWidget: (context, url, error) => Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(
                            //'assets/images/visitor.png',
                            'assets/images/profile.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColor.nameColor,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'id'.tr + ': ' + visitorID,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColor.hintColor,
                          ),
                        ),
                        Text(
                          'status'.tr + ': ' + statusName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColor.hintColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (status == "1")
                Padding(
                  padding: const EdgeInsets.only(top: 2, right: 10, left: 10),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _cancelAlert(context);
                        },
                        child: Text(
                          "reject".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.redColor,
                            minimumSize: Size(50, 25),
                            padding: EdgeInsets.only(
                                left: 20,
                                right: 20) // put the width and height you want
                            ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _approveAlert(context);
                        },
                        child: Text(
                          "approve".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor,
                            minimumSize:
                                Size(0, 25) // put the width and height you want
                            ),
                      ),
                    ],
                  ),
                ),
              if (status == "2" && checkOutAt.length == 0)
                Padding(
                  padding: const EdgeInsets.only(top: 0, right: 10, left: 10),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _checkOut(context);
                        },
                        child: Text(
                          "checkout".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor,
                            minimumSize:
                                Size(0, 25) // put the width and height you want
                            ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  _cancelAlert(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "reject".tr,
      desc: "are_you_sure_reject".tr,
      buttons: [
        DialogButton(
          child: Text(
            "yes".tr,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {
            visitorController.changeStatus(context, id, 3);
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

  _approveAlert(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "approve".tr,
      desc: "are_you_sure_approve".tr,
      buttons: [
        DialogButton(
          child: Text(
            "yes".tr,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {
            visitorController.changeStatus(context, id, 2);
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

  _checkOut(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "check_out".tr,
      desc: "are_you_sure_checkout".tr,
      buttons: [
        DialogButton(
          child: Text(
            "yes".tr,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {
            print(visitorID);
            visitorController.checkOut(context, visitorID);
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
