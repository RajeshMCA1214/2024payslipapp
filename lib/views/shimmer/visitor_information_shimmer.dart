// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../constants/constants.dart';

class VisitorInformationShimmerPage extends StatelessWidget {
  VisitorInformationShimmerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    width: 100,
                    height: 100,
                    child: CachedNetworkImage(
                        imageUrl: '',
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                              radius: 40.0,
                              backgroundColor: Colors.transparent,
                              backgroundImage: imageProvider,
                            ),
                        placeholder: (context, url) => Shimmer.fromColors(
                              child: const CircleAvatar(radius: 40.0),
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[400]!,
                            ),
                        errorWidget: (context, url, error) =>
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[400]!,
                              child: CircleAvatar(
                                child: Image.asset(
                                  'assets/images/visitor.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ))),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 21.0, right: 0, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,
                            child: Image.asset(
                              'assets/images/personalcard.png',
                              width: 18,
                              height: 18,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[400]!,
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
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[400]!,
                                child: Text(
                                  '',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.nameColor),
                                ),
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
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,
                            child: Image.asset(
                              'assets/images/sms.png',
                              width: 18,
                              height: 18,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[400]!,
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.hintColor),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[400]!,
                                child: Text(
                                  '',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.nameColor),
                                ),
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
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,
                            child: Image.asset(
                              'assets/images/call1.png',
                              width: 18,
                              height: 18,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[400]!,
                                child: Text(
                                  'Phone',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.hintColor),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[400]!,
                                child: Text(
                                  '',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.nameColor),
                                ),
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
                          left: 21.0, right: 0, top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[400]!,
                            child: Image.asset(
                              'assets/images/gender.png',
                              width: 18,
                              height: 18,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[400]!,
                                child: Text(
                                  'Gender',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.hintColor),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[400]!,
                                child: Text(
                                  '',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.nameColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[400]!,
                      child: Padding(
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
                                  'Company',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.hintColor),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '',
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
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[400]!,
                      child: Padding(
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
                                  '',
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
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[400]!,
                      child: Padding(
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
                                  'Address',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.hintColor),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '',
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
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[400]!,
                      child: Padding(
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
                                  'Employee',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.hintColor),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '',
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
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[400]!,
                      child: Padding(
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
                                  'Purpose',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.hintColor),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '',
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
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[400]!,
                      child: Padding(
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
                                  'Status',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.hintColor),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '',
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
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[400]!,
                      child: Padding(
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
                                  'Date',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.hintColor),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '',
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
                    ),
                    SizedBox(
                      height: 40,
                    ),
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
