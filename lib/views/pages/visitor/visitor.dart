// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trilochanaa_app/Controllers/visitor-controller.dart';
import 'package:trilochanaa_app/views/shimmer/visitor-shimmer.dart';
import '../../../constants/constants.dart';
import '../../widget/precent_card.dart';
import '../../widget/visitor_card.dart';

class VisitorListPage extends StatefulWidget {
  VisitorListPage({Key? key}) : super(key: key);

  @override
  State<VisitorListPage> createState() => _VisitorListPageState();
}

class _VisitorListPageState extends State<VisitorListPage> {
  final TextEditingController searchTextController = TextEditingController();
  final TextEditingController clockInController = TextEditingController();

  final VisitorController visitorController = Get.put(VisitorController());
  bool validate = false;
  bool clockIn = true;
  bool clockingOut = true;

  Future<void> _onRefresh() {
    visitorController.onInit();
    Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _onRefresh();
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<VisitorController>(
          init: VisitorController(),
          builder: (controller) {
            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Presentee'.tr,
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: searchTextController,
                                textInputAction: TextInputAction.search,
                                keyboardType: TextInputType.text,
                                cursorColor: AppColor.primaryColor,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 0, left: 15, right: 15),
                                  hintText: 'search'.tr,
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColor.hintColor,
                                  ),
                                  fillColor: Colors.red,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: box.read('lang') == 'ar'
                                        ? BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(5))
                                        : BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5)),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColor.primaryColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: box.read('lang') == 'ar'
                                        ? BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(5))
                                        : BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5)),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColor.borderColor),
                                  ),
                                ),
                                onFieldSubmitted: (value) {
                                  visitorController.getSearchedVisitors(
                                      searchTextController.text);
                                  //add code
                                },
                                onChanged: (value) {
                                  setState(() {
                                    visitorController.getSearchedVisitors(
                                        searchTextController.text);
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: 45,
                              height: 45,
                              decoration: box.read('lang') == 'ar'
                                  ? BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)),
                                    )
                                  : BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5)),
                                    ),
                              child: Center(
                                  child: IconButton(
                                icon: SvgPicture.asset(
                                  Images.search,
                                  height: 16,
                                  width: 16,
                                ),
                                color: Colors.white,
                                onPressed: () {
                                  visitorController.getSearchedVisitors(
                                      searchTextController.text);
                                  //add code
                                },
                              )),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<VisitorController>(
                          init: VisitorController(),
                          builder: (controller) {
                            return SingleChildScrollView(
                              child: Container(
                                margin: const EdgeInsets.only(top: 18),
                                padding: const EdgeInsets.only(bottom: 90),
                                height: ScreenSize(context).mainHeight / 1.17,
                                child: ListView.builder(
                                  //Note: API ready hole ListView.spereted use korte hobe
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: 2,
                                 // itemCount: controller.visitorList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return controller.loader
                                        ? VisitorShimmer()
                                        : PrecentCard(
                                      //image:
                                     // controller.visitorList[index].image.toString(),
                                      // name: dashboard.visitorList[index].name.toString(),
                                      name: 'Imran ibrahim',
                                      employeecode: '352345',
                                      passno:'V008212300032',

                                      datetime:'26.02.2024/09.00 Am',
                                      //dashboard.visitorList[index].regNo.toString(),
                                    );
                                        /*VisitorCard(
                                            image: controller
                                                .visitorList[index].image
                                                .toString(),
                                            name: controller
                                                .visitorList[index].name
                                                .toString(),
                                            id: controller.visitorList[index].id
                                                .toString(),
                                            visitorID: controller
                                                .visitorList[index].regNo
                                                .toString(),
                                            status: controller
                                                .visitorList[index].status
                                                .toString(),
                                            statusName: controller
                                                .visitorList[index].statusName
                                                .toString(),
                                            checkInAt: controller
                                                .visitorList[index].checkInAt
                                                .toString(),
                                            checkOutAt: controller
                                                .visitorList[index].checkOutAt
                                                .toString(),
                                          );*/
                                  },
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget continueButton = TextButton(
      child: Container(
        height: 45,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColor.primaryColor,
        ),
        child: const Center(
          child: Text(
            "Yes, Sure",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onPressed: () {
        clockingOut = false;
        Get.back();
        (context as Element).markNeedsBuild();
      },
    );
    Widget cancelButton = TextButton(
      child: Container(
        height: 47,
        width: 102,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: AppColor.primaryColor)),
        child: const Center(
          child: Text(
            "No, Cancel",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ),
      onPressed: () {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: const Text(
        "Are you sure you want to clock out?",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColor.primaryColor,
        ),
      ),
      actions: [
        continueButton,
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
