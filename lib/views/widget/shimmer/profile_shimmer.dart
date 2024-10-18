import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatefulWidget {
  const ProfileShimmer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfileShimmerState();
  }
}

class _ProfileShimmerState extends State<ProfileShimmer> {
  var mainHeight, mainWidth;
  String? phone, name, address;

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;

    return  SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
          SizedBox(
              width: 100,
              height: 100,
              child: CircleAvatar(radius: 40.0),
          )),
          const SizedBox(
            height: 18,
          ),
          Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
          const Text(
            'Profile Name',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColor.primaryColor,
            ),
          )),
          const SizedBox(
            height: 40,
          ),
      Shimmer.fromColors(
        highlightColor: Colors.grey[400]!,
        baseColor: Colors.grey[300]!,
        child:
          Column(
            children: [
              ListTile(
                leading: Image.asset('assets/images/user_name.png',
                    color: AppColor.nameColor),
                title: Text(
                  'user_name'.tr,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.hintColor),
                ),
                subtitle: const Text(
                 '',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.nameColor),
                ),
              ),
              const Divider(
                height: 10,
                thickness: 1,
                indent: 70,
                endIndent: 0,
                color: AppColor.dividerColor,
              )
            ],
          )),
      Shimmer.fromColors(
        highlightColor: Colors.grey[400]!,
        baseColor: Colors.grey[300]!,
        child:Column(
            children: [
              ListTile(
                leading: Image.asset('assets/images/email.png',
                    color: AppColor.nameColor),
                title: Text(
                  'email'.tr,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.hintColor),
                ),
                subtitle: const Text(
                  '',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.nameColor),
                ),
              ),
              const Divider(
                height: 10,
                thickness: 1,
                indent: 70,
                endIndent: 0,
                color: AppColor.dividerColor,
              )
            ],
          )),
      Shimmer.fromColors(
        highlightColor: Colors.grey[400]!,
        baseColor: Colors.grey[300]!,
        child:Column(
            children: [
              ListTile(
                leading: Image.asset('assets/images/call.png',
                    color: AppColor.nameColor),
                title: Text(
                  'phone'.tr,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.hintColor),
                ),
                subtitle: const Text(
                  '',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.nameColor),
                ),
              ),
              const Divider(
                height: 10,
                thickness: 1,
                indent: 70,
                endIndent: 0,
                color: AppColor.dividerColor,
              )
            ],
          )),
      Shimmer.fromColors(
        highlightColor: Colors.grey[400]!,
        baseColor: Colors.grey[300]!,
        child: Column(
            children: [
              ListTile(
                leading: Image.asset(
                  'assets/images/address.png',
                  color: AppColor.nameColor,
                ),
                title: Text(
                  'address'.tr,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.hintColor),
                ),
                subtitle: const Text(
                  '',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.nameColor),
                ),
              ),
              const Divider(
                height: 10,
                thickness: 1,
                indent: 70,
                endIndent: 0,
                color: AppColor.dividerColor,
              )
            ],
          )),
      Shimmer.fromColors(
        highlightColor: Colors.grey[400]!,
        baseColor: Colors.grey[300]!,
        child:Column(
            children: [
              ListTile(
                onTap: () {

                },
                leading: Image.asset('assets/images/key.png',
                    color: AppColor.nameColor),
                //subtitle: Text('User Name'),
                title: Text(
                  'change_password'.tr,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.nameColor),
                ),
                trailing: Image.asset('assets/images/right.png',
                    color: AppColor.nameColor),
              ),
              const Divider(
                height: 10,
                thickness: 1,
                indent: 70,
                endIndent: 0,
                color: AppColor.dividerColor,
              )
            ],
          )),
      Shimmer.fromColors(
        highlightColor: Colors.grey[400]!,
        baseColor: Colors.grey[300]!,
        child:Column(
            children: [
              ListTile(
                onTap: () {

                },
                leading: Image.asset('assets/images/update.png',
                    color: AppColor.nameColor),
                title: Text(
                  'update_profile'.tr,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.nameColor),
                ),
                trailing: Image.asset('assets/images/right.png',
                    color: AppColor.nameColor),
              ),
              const Divider(
                height: 10,
                thickness: 1,
                indent: 70,
                endIndent: 0,
                color: AppColor.dividerColor,
              )
            ],
          )),
          const SizedBox(
            height: 18,
          ),
      Shimmer.fromColors(
        highlightColor: Colors.grey[400]!,
        baseColor: Colors.grey[300]!,
        child:Column(
            children: [
              ListTile(
                onTap: () => {

                },
                leading: Image.asset('assets/images/logout_icon.png',
                    width: 25, height: 25, color: AppColor.nameColor),
                //subtitle: Text('User Name'),
                title: Text(
                  'log_out'.tr,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.nameColor),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}