import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trilochanaa_app/constants/constants.dart';
import 'package:get/get.dart';

import '../pages/pre-register/absentee.dart';
import '../pages/visitor/visitor.dart';

class DashboardCard extends StatelessWidget {
  DashboardCard(
      {Key? key,
      required this.page,
      required this.topic,
     // required this.tittle,
      required this.countTotal,

      required this.imgUrlTotal,
        required this.countPre,

        // required this.imgUrlPre,
        // required this.weekoff,
        //
        // required this.imgUrlweek,
      required this.cardColor,
      this.iconColor})
      : super(key: key);
  final bool page;
  final String topic;
 // final String tittle;
  final String countTotal;
  final String imgUrlTotal;


  final String countPre;
  // final String imgUrlPre;
  //
  // final String weekoff;
  // final String imgUrlweek;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              imgUrlTotal,
                              color: iconColor,
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                        Text(
                          countTotal,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize:18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Total',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(width: 8), // Added SizedBox for spacing
                  // Add other widgets here as needed
                ].map((widget) => Flexible(child: widget)).toList(),
              ),



              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     topic,
              //     overflow: TextOverflow.ellipsis,
              //     textAlign: TextAlign.end,
              //     maxLines: 2,
              //     style: const TextStyle(
              //       fontWeight: FontWeight.w900,
              //       fontSize: 10,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
            ],
          ),

        ),
    );

  }
}
