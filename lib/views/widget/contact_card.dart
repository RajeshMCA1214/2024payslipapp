import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trilochanaa_app/constants/constants.dart';

class ContactCard extends StatelessWidget {
  const ContactCard(
      {Key? key,
      required this.name,
      required this.id,
      required this.status,
      required this.image})
      : super(key: key);
  final String name;
  final String id;
  final String status;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                'id'.tr + ': ' + '$id',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff4D5A66),
                ),
              ),
              Text(
                'status'.tr + ': ' + '${status}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff4D5A66),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 140),
          child: Icon(Icons.keyboard_arrow_right_outlined),
        ),
      ],
    );
  }
}
