import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';

class VisitorInformationCheckoutPage extends StatelessWidget {
  const VisitorInformationCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'visitor_information'.tr,
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: Text(
                "check_out".tr,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColor.nameColor,
                padding: const EdgeInsets.only(
                    left: 120.0, right: 120.0, top: 18.0, bottom: 18.0),
                backgroundColor: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    child: Image.asset(
                      'assets/images/visitor.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 21.0, right: 0, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/personalcard.png',
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'name'.tr,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.hintColor),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Maria Martinez',
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
                          left: 21.0, right: 0, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/sms.png',
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                'Martinez@gmail.com',
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
                          left: 21.0, right: 0, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/call1.png',
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                '1234567991',
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
                          left: 21.0, right: 0, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/gender.png',
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                'female'.tr,
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
                          left: 21.0, right: 0, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/sms.png',
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                'iNiLabs',
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
                          left: 21.0, right: 0, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/personalcard.png',
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'National Idenfication No',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.hintColor),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                '12345678912345678',
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
                          left: 21.0, right: 0, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/location1.png',
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                'Mirpur, Dhaka',
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
                          left: 21.0, right: 0, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/user_tick.png',
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                'Jonathon Doe',
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
                          left: 21.0, right: 0, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/airdrop.png',
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                'business_meeting'.tr,
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
                          left: 21.0, right: 0, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/edit2.png',
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'status'.tr,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.hintColor),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'check_in'.tr,
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
                          left: 21.0, right: 0, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/calendar.png',
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                '2022-12-23',
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
                          left: 21.0, right: 0, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/clock.png',
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                '10:00 AM',
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
                          left: 21.0, right: 0, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/clock.png',
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                '12:00 AM',
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
                      height: 28,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
