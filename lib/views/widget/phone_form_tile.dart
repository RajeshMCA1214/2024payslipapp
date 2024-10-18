import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class PhoneFormTitle extends StatelessWidget {
  const PhoneFormTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColor.titleColor,
            ),
          ),
          const Text(
            '*',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColor.redColor,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          const Text(
            '(With Country Code,Without + sign)',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: AppColor.titleColor,
            ),
          ),
        ],
      ),
    );
  }
}
