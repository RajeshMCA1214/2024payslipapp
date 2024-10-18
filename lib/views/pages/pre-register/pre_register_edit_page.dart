// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trilochanaa_app/Services/user-service.dart';
import 'package:trilochanaa_app/views/widget/loader.dart';
import 'package:trilochanaa_app/views/widget/phone_form_tile.dart';

// import 'package:trilochanaa_app/views/pages/take_photo_page.dart';
import '../../../Controllers/preRegister_add_controller.dart';
import '../../../Controllers/pre_register_visitor_details_controller.dart';
import '../../../constants/constants.dart';
import '../../widget/custom_form_field.dart';
import '../../widget/custom_large_form_field.dart';
import '../../widget/custom_phone_form_field copy.dart';
import '../../widget/form_title.dart';

class PreRegisterEditPage extends StatefulWidget {
  PreRegisterEditPage({Key? key, this.id}) : super(key: key);
  String? id;

  UserService userService = UserService();
  @override
  State<PreRegisterEditPage> createState() => _PreRegisterEditPageState();
}

class _PreRegisterEditPageState extends State<PreRegisterEditPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AddPreRegisterController addPreRegisterController =
      Get.put(AddPreRegisterController());

  void initState() {
    super.initState();
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text(
            "Male",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColor.titleColor,
            ),
          ),
          value: "5"),
      const DropdownMenuItem(
          child: Text(
            "Female",
            style: TextStyle(
              color: AppColor.titleColor,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          value: "10"),
    ];
    return menuItems;
  }

  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'edit_pre_register'.tr,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColor.primaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset(
            Images.backArrow,
            height: 24,
            width: 24,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<PreVisitorDetailsController>(
          init: PreVisitorDetailsController(widget.id),
          builder: (controller) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          FormTitle(
                            title: 'first_name'.tr,
                          ),
                          CustomFormField(
                            controller: controller.firstNameController,
                            validatorTxt: 'enter_first_name'.tr,
                          ),
                          FormTitle(
                            title: 'last_name'.tr,
                          ),
                          CustomFormField(
                            controller: controller.lastNameController,
                            validatorTxt: 'Enter Lastname'.tr,
                          ),
                          FormTitle(title: 'email'.tr),
                          CustomFormField(
                            controller: controller.emailController,
                            validatorTxt: 'enter_email'.tr,
                          ),
                          PhoneFormTitle(title: 'phone'.tr),
                          CustomPhoneFormField(
                            controller: controller.phoneController,
                            validatorTxt: 'enter_phone_no'.tr,
                          ),
                          FormTitle(title: 'gender'.tr),
                          dropdownItems.isEmpty
                              ? Container()
                              : Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    height: 48,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: AppColor.borderColor,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            padding: EdgeInsets.only(right: 5),
                                            icon: SvgPicture.asset(
                                              Images.down,
                                              height: 8,
                                              width: 8,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5)),
                                            isExpanded: true,
                                            menuMaxHeight:
                                                ScreenSize(context).mainHeight /
                                                    3,
                                            items: dropdownItems,
                                            value: controller.genderID,
                                            onChanged: (String? newValue) {
                                              controller.genderID = newValue!;
                                              (context as Element)
                                                  .markNeedsBuild();
                                            }),
                                      ),
                                    ),
                                  ),
                                ),
                          FormTitle(title: 'address'.tr),
                          CustomFormField(
                            controller: controller.addressController,
                            validatorTxt: 'enter_address'.tr,
                          ),
                          FormTitle(title: 'nid_no'.tr),
                          CustomFormField(
                            controller: controller.nidController,
                            validatorTxt: 'enter_nid'.tr,
                          ),
                          FormTitle(title: 'expected_date'.tr),
                          SizedBox(
                            height: 10,
                          ),
                          DateTimePicker(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: AppColor.redColor,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: AppColor.redColor,
                                ),
                              ),
                              fillColor: Colors.red,
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                                borderSide: BorderSide(
                                    width: 1, color: AppColor.primaryColor),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                                borderSide: BorderSide(
                                    width: 1, color: AppColor.borderColor),
                              ),
                            ),
                            type: DateTimePickerType.date,
                            // dateMask: 'yyyy/MM/dd',
                            controller: controller.dateController,
                            //initialValue: _initialValue,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FormTitle(title: 'expected_time'.tr),
                          SizedBox(
                            height: 10,
                          ),
                          DateTimePicker(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: AppColor.redColor,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: AppColor.redColor,
                                ),
                              ),
                              fillColor: Colors.red,
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                                borderSide: BorderSide(
                                    width: 1, color: AppColor.primaryColor),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                                borderSide: BorderSide(
                                    width: 1, color: AppColor.borderColor),
                              ),
                            ),
                            type: DateTimePickerType.time,
                            controller: controller.timeController,
                            use24HourFormat: true,
                          ),
                          FormTitle(title: 'comment'.tr),
                          CustomLargeFormField(
                            controller: controller.purposeController,
                            validatorTxt: 'please_type_your_purpose'.tr,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(60),
                              backgroundColor: AppColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // <-- Radius
                              ),
                              // fromHeight use double.infinity as width and 40 is the height
                            ),
                            onPressed: () {
                              validateAndSave(context, controller, widget.id);
                            },
                            child: Text(
                              "submit".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                controller.loader
                    ? Positioned(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white60,
                          child: const Center(
                            child: LoaderCircle(),
                          ),
                        ),
                      )
                    : SizedBox.shrink()
              ],
            );
          }),
    );
  }

  Future<void> validateAndSave(context, controller, id) async {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      Map<String, String> preRegisterData = {
        'employee_id': widget.id.toString(),
        'first_name': controller.firstNameController.text,
        'last_name': controller.lastNameController.text,
        'email': controller.emailController.text,
        'phone': controller.phoneController.text,
        'gender': controller.genderID,
        'address': controller.addressController.text,
        'national_identification_no': controller.nidController.text,
        'expected_date': controller.dateController.text,
        'expected_time': controller.timeController.text,
        'comment': controller.purposeController.text,
      };
      controller.updatePreRegisterVisitor(context, preRegisterData, id);

      validate = true;
    } else {
      validate = false;
    }
  }
}
