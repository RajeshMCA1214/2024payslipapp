import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trilochanaa_app/constants/constants.dart';
import 'package:get/get.dart';

import '../pages/pre-register/absentee.dart';
import '../pages/visitor/visitor.dart';

class SecondDashboardCard extends StatelessWidget {
  SecondDashboardCard(
      {Key? key,
        required this.page,
       // required this.topic,
        // required this.tittle,
        // required this.countTotal,
        //
        // required this.imgUrlTotal,
         required this.countPre,

        required this.imgUrlPre,
        required this.weekoff,

        required this.imgUrlweek,
        required this.cardColor,
        this.iconColor})
      : super(key: key);
  final bool page;
 // final String topic;
  // final String tittle;
  // final String countTotal;
  // final String imgUrlTotal;
  //
  //
   final String countPre;
  final String imgUrlPre;

  final String weekoff;
  final String imgUrlweek;
  final Color cardColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (page) {
          Get.to(() => VisitorListPage(),
              duration: Duration(milliseconds: 400),
              transition: Transition.downToUp);
        } else {
          //   Get.to(() => PreRegisterListPage(),
          //       duration: Duration(milliseconds: 400),
          //       transition: Transition.downToUp);
        }
      },
      child: Container(
        height: ScreenSize(context).mainHeight / 4.8,
        width: ScreenSize(context).mainWidth / 2.60,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center( // Center the SVG within the container
                child: SvgPicture.asset(
                  imgUrlPre,
                  color: iconColor,
                  height: 40,
                  width: 40,
                ),
              ),
            ),
            const SizedBox(height: 8), // Add some spacing between the image and the count
            Text(
              countPre,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4), // Add some spacing between the count and the label
            Text(
              'Present',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),

    );

  }
}
