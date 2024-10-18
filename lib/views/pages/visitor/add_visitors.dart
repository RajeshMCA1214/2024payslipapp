// ignore_for_file: must_be_immutable
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import '../../widget/custom_form_field.dart';
import '../../widget/form_title.dart';

class AddVisitorPage extends StatelessWidget {
  AddVisitorPage({Key? key}) : super(key: key);
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text(
            "Male",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          value: "Male"),
      const DropdownMenuItem(
          child: Text(
            "Female",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          value: "Female"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItems1 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text(
            "Employee1",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          value: "Employee1"),
      const DropdownMenuItem(
          child: Text(
            "Employee2",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          value: "Employee2"),
    ];
    return menuItems;
  }

  String selectedValue = "Male";
  String selectedValue1 = "Employee1";
  bool validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'add_visitor'.tr,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
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
                  validatorTxt: 'enter_last_name'.tr,
                ),
                FormTitle(title: 'email'.tr),
                CustomFormField(
                  controller: emailController,
                  validatorTxt: 'enter_email'.tr,
                ),
                FormTitle(title: 'phone'.tr),
                CustomFormField(
                  controller: phoneController,
                  validatorTxt: 'enter_phone_no',
                ),
                FormTitle(title: 'select_gender'),
                dropdownItems.isEmpty
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                  isExpanded: true,
                                  menuMaxHeight:
                                      ScreenSize(context).mainHeight / 3,
                                  items: dropdownItems,
                                  value: selectedValue,
                                  onChanged: (String? newValue) {
                                    selectedValue = newValue!;
                                    (context as Element).markNeedsBuild();
                                  }),
                            ),
                          ),
                        ),
                      ),
                FormTitle(title: 'your_company'.tr),
                CustomFormField(
                  controller: companyController,
                  validatorTxt: 'enter_company_name'.tr,
                ),
                FormTitle(title: 'nid_no'.tr),
                CustomFormField(
                  controller: nidController,
                  validatorTxt: 'enter_nid'.tr,
                ),
                FormTitle(title: 'address'.tr),
                CustomFormField(
                  controller: addressController,
                  validatorTxt: 'enter_address'.tr,
                ),
                FormTitle(title: 'select_employee'.tr),
                dropdownItems.isEmpty
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                  isExpanded: true,
                                  menuMaxHeight:
                                      ScreenSize(context).mainHeight / 3,
                                  items: dropdownItems1,
                                  value: selectedValue1,
                                  onChanged: (String? newValue) {
                                    selectedValue1 = newValue!;
                                    (context as Element).markNeedsBuild();
                                  }),
                            ),
                          ),
                        ),
                      ),
                const FormTitle(title: 'purpose'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: purposeController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    cursorColor: AppColor.primaryColor,
                    validator: (value) =>
                        value!.isEmpty ? 'please_type_your_purpose'.tr : null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 50.0, horizontal: 10.0),
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
                        borderSide:
                            BorderSide(width: 1, color: AppColor.primaryColor),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        borderSide:
                            BorderSide(width: 1, color: AppColor.borderColor),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      //add code
                    },
                  ),
                ),
                FormTitle(title: 'image'.tr),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 120.0,
                    height: 120.0,
                    child: Card(
                      elevation: 0,
                      color: AppColor.imagebackground,
                      child: Center(
                          child: Image.asset(
                        'assets/images/gallery_edit.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ) //Text
                          ), //Center
                    ), //Card
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             VisitorInformationPage()));
                      },
                      child: Text(
                        "submit".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColor.nameColor,
                        padding: const EdgeInsets.only(
                            left: 130.0, right: 130.0, top: 18.0, bottom: 18.0),
                        backgroundColor: AppColor.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      if (kDebugMode) {
        print('validate');
      }
      //Get.off(() => const TakePhotoPage());
      validate = true;
    } else {
      if (kDebugMode) {
        print('not validate');
      }
      validate = false;
    }
  }
}
