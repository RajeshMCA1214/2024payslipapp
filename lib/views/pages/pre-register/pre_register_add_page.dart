// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trilochanaa_app/Controllers/profile_controller.dart';
import 'package:trilochanaa_app/Services/user-service.dart';
import 'package:trilochanaa_app/views/widget/loader.dart';

import '../../../Controllers/preRegister_add_controller.dart';
import '../../../constants/constants.dart';
import '../../widget/custom_form_field.dart';
import '../../widget/custom_large_form_field.dart';
import '../../widget/custom_phone_form_field copy.dart';
import '../../widget/form_title.dart';
import '../../widget/phone_form_tile.dart';

class PreRegisterAddPage extends StatefulWidget {
  PreRegisterAddPage({Key? key}) : super(key: key);
  final AddPreRegisterController addPreRegisterController =
      Get.put(AddPreRegisterController());

  UserService userService = UserService();
  @override
  State<PreRegisterAddPage> createState() => _PreRegisterAddPageState();
}

class _PreRegisterAddPageState extends State<PreRegisterAddPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _dateController;
  late TextEditingController _timeController;
  final AddPreRegisterController addPreRegisterController =
      Get.put(AddPreRegisterController());
  late String genderID = "5";

  ProfileController profile = Get.put(ProfileController());

  void initState() {
    super.initState();
    _dateController = TextEditingController(text: DateTime.now().toString());

    String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
    String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');
    _timeController = TextEditingController(text: '$lsHour:$lsMinute');

    profile.getUserProfile();
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text(
            "Male",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          value: "Male"),
      const DropdownMenuItem(
          child: Text(
            "Female",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          value: "Female"),
    ];
    return menuItems;
  }

  String selectedValue = "Male";

  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'add_pre_register'.tr,
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
      body: GetBuilder<AddPreRegisterController>(
          init: AddPreRegisterController(),
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
                            controller: firstNameController,
                            validatorTxt: 'enter_first_name'.tr,
                          ),
                          FormTitle(
                            title: 'last_name'.tr,
                          ),
                          CustomFormField(
                            controller: lastNameController,
                            validatorTxt: 'Enter Lastname'.tr,
                          ),
                          FormTitle(title: 'email'.tr),
                          CustomFormField(
                            controller: emailController,
                            validatorTxt: 'enter_email'.tr,
                          ),
                          PhoneFormTitle(title: 'phone'.tr),
                          CustomPhoneFormField(
                            controller: phoneController,
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
                                            value: selectedValue,
                                            onChanged: (String? newValue) {
                                              selectedValue = newValue!;
                                              (context as Element)
                                                  .markNeedsBuild();
                                            }),
                                      ),
                                    ),
                                  ),
                                ),
                          FormTitle(title: 'address'.tr),
                          CustomFormField(
                            controller: addressController,
                            validatorTxt: 'enter_address'.tr,
                          ),
                          FormTitle(title: 'nid_no'.tr),
                          CustomFormField(
                            controller: nidController,
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
                            controller: _dateController,
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
                            controller: _timeController,
                            use24HourFormat: true,
                          ),
                          FormTitle(title: 'comment'.tr),
                          CustomLargeFormField(
                            controller: purposeController,
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
                              validateAndSave(context);
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
                addPreRegisterController.loader
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

  Future<void> validateAndSave(context) async {
    profile.getUserProfile();
    setState(() {});
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      Map<String, String> preRegisterData = {
        'employee_id': profile.employeeID.toString(),
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'gender': genderID,
        'address': addressController.text,
        'national_identification_no': nidController.text,
        'expected_date': _dateController.text,
        'expected_time': _timeController.text,
        'comment': purposeController.text,
      };
      print(preRegisterData);
      addPreRegisterController.addPreRegisterVisitor(context, preRegisterData);

      validate = true;
    } else {
      validate = false;
    }
  }
}
