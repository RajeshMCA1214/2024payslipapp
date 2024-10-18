import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';

class LoaderCircle extends StatelessWidget {
  const LoaderCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: ScreenSize(context).block * 20,
          width: ScreenSize(context).block * 20,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              height: ScreenSize(context).block * 15,
              width: ScreenSize(context).block * 15,
              decoration: const BoxDecoration(
                color: AppColor.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: SvgPicture.asset(
                    Images.logo,
                    color: Colors.white,
                    height: ScreenSize(context).block * 20,
                    width: ScreenSize(context).block * 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          top: 2,
          left: 2,
          right: 2,
          bottom: 2,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            backgroundColor: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }
}
