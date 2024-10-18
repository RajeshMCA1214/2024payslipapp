import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trilochanaa_app/views/widget/shimmer/attendance_shimmer.dart';
import '../../../Controllers/attendance_controller.dart';
import '../../../constants/constants.dart';

// ignore: must_be_immutable
class AttendancePage extends StatelessWidget {
  AttendancePage({Key? key}) : super(key: key);
  final TextEditingController clockInController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AttendanceController attendanceController = AttendanceController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'attendance'.tr,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColor.primaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: GetBuilder<AttendanceController>(
            init: AttendanceController(),
            builder: (attendance) => attendance.commonLoader
                ? const AttendanceShimmer()
                : SingleChildScrollView(
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
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                    Text(
                                      attendance.profileUser.name.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CachedNetworkImage(
                                        imageUrl: attendance.profileUser.image
                                            .toString(),
                                        imageBuilder: (context,
                                                imageProvider) =>
                                            CircleAvatar(
                                              radius: 40.0,
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage: imageProvider,
                                            ),
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                              child: const CircleAvatar(
                                                  radius: 40.0),
                                              baseColor: Colors.grey[300]!,
                                              highlightColor: Colors.grey[400]!,
                                            ),
                                        errorWidget: (context, url, error) =>
                                            CircleAvatar(
                                              child: Image.asset(
                                                'assets/images/visitor.png',
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ))),
                              ],
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            Text(
                              attendance.currentTime.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              attendance.currentDate.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColor.hintColor,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: 190,
                              // height: 48,
                              child: attendance.showClockin
                                  ? Form(
                                      key: _formKey,
                                      child: TextFormField(
                                        controller: clockInController,
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.text,
                                        cursorColor: AppColor.primaryColor,
                                        validator: (value) => value!.isEmpty
                                            ? 'field_cant_be_empty'.tr
                                            : null,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 10.0),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: AppColor.redColor,
                                            ),
                                          ),
                                          hintText: 'work_from'.tr,
                                          hintStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: AppColor.hintColor,
                                          ),
                                          fillColor: Colors.red,
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomLeft: Radius.circular(5)),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: AppColor.primaryColor),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: AppColor.borderColor),
                                          ),
                                        ),
                                        onFieldSubmitted: (value) {
                                          //add code
                                        },
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                        'work_from'.tr +
                                            ': ${attendance.workFrom}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                    ),
                            ),
                            const SizedBox(height: 40),
                            Container(
                              // height: ScreenSize(context).mainHeight / 4.5,
                              // width: ScreenSize(context).mainWidth / 2.2,
                              height: 160,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: attendance.clockOut == ''
                                          ? attendance.showClockin
                                              ? AppColor.primaryColor
                                                  .withOpacity(0.7)
                                              : AppColor.redColor
                                                  .withOpacity(0.7)
                                          : Colors.black.withOpacity(.7),
                                      blurRadius: 15.0,
                                      offset: const Offset(0.0, 0.75))
                                ],
                              ),
                              child: attendance.clockOut == ''
                                  ? attendance.showClockin
                                      ? ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColor.primaryColor,
                                            shape: const StadiumBorder(),
                                          ),
                                          onPressed: () {
                                            final FormState? form =
                                                _formKey.currentState;
                                            if (form!.validate()) {
                                              attendance.clockInUpdate(context,
                                                  clockInController.text);
                                            }
                                            clockInController.clear();
                                            (context as Element)
                                                .markNeedsBuild();
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                Images.login,
                                                height: 42,
                                                width: 42,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right:
                                                        box.read('lang') == 'ar'
                                                            ? 15
                                                            : 0,
                                                    bottom:
                                                        box.read('lang') == 'ar'
                                                            ? 5
                                                            : 0),
                                                child: Text(
                                                  'clock_in'.tr,
                                                  style: const TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColor.redColor,
                                            shape: const StadiumBorder(),
                                          ),
                                          onPressed: () {
                                            showAlertDialog(context);
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                Images.menuLogout,
                                                height: 42,
                                                width: 42,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'clock_out'.tr,
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: const StadiumBorder(),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                    ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'clock_in'.tr,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: AppColor.primaryColor,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          attendance.showClockin
                                              ? const Text(
                                                  'N/A',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: 14,
                                                  ),
                                                )
                                              : Text(
                                                  attendance.clockIN,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'clock_out'.tr,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: AppColor.primaryColor,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          attendance.clockOut == ''
                                              ? const Text(
                                                  'N/A',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: 14,
                                                  ),
                                                )
                                              : Text(
                                                  attendance.clockOut
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          )),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget continueButton = TextButton(
      child: Container(
        height: 45,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColor.primaryColor,
        ),
        child: Center(
          child: Text(
            'yes_sure'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onPressed: () {
        attendanceController.clockOutUpdate(context);
        Get.back();
        (context as Element).markNeedsBuild();
      },
    );
    Widget cancelButton = TextButton(
      child: Container(
        height: 47,
        width: 102,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: AppColor.primaryColor)),
        child: Center(
          child: Text(
            "no_cancel".tr,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ),
      onPressed: () {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text(
        "sure_clock_out".tr,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColor.primaryColor,
        ),
      ),
      actions: [
        continueButton,
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
