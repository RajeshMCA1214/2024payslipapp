import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class AttendanceShimmer extends StatefulWidget {
  const AttendanceShimmer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AttendanceShimmerState();
  }
}

class _AttendanceShimmerState extends State<AttendanceShimmer> {
  var mainHeight, mainWidth;
  String? phone, name, address;

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;

    return   SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                    highlightColor: Colors.grey[400]!,
                    baseColor: Colors.grey[300]!,
                    child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        'good_morning'.tr,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        '',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  )),
                  Shimmer.fromColors(
                    highlightColor: Colors.grey[400]!,
                    baseColor: Colors.grey[300]!,
                    child:
                  SizedBox(
                      width: 50,
                      height: 50,
                      child:
                      CircleAvatar(
                        child: Image.asset(
                          'assets/images/visitor.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                  )),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              const Text(
               '10:00 AM',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primaryColor,
                ),
              )),

              const SizedBox(
                height: 6,
              ),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              const Text(
                'Date',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.hintColor,
                ),
              )),
              const SizedBox(height: 20),

              const SizedBox(height: 40),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
              Container(
                // height: ScreenSize(context).mainHeight / 4.5,
                // width: ScreenSize(context).mainWidth / 2.2,
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: <BoxShadow>[],
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'you_are_clocked_out'.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )),

            ],
          ),
        ),
      ),
    );
  }
}