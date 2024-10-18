import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/constants.dart';

class AttendantCard extends StatelessWidget {
  const AttendantCard({
    Key? key,
    required this.name,
    required this.date,
    required this.clockIn,
    required this.clockOut,
    required this.image,
  }) : super(key: key);
  final String name;
  final String date;
  final String clockIn;
  final String clockOut;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Container(
        height: 96,
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
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 60,
                  width: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppColor.nameColor,
                        ),
                      ),
                      Text(
                        date,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColor.hintColor,
                        ),
                      ),
                      Text(
                        clockIn,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColor.hintColor,
                        ),
                      ),
                      Text(
                        clockOut,
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
            GestureDetector(
              onTap: () {
                //Delete function
                if (kDebugMode) {
                  print('deleted');
                }
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15, top: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.borderColor.withOpacity(.5),
                ),
                child: SvgPicture.asset(
                  Images.delete,
                  height: 15.5,
                  width: 15.5,
                ),
                height: 40,
                width: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
