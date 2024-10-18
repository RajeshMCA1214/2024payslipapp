import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.controller,
    required this.validatorTxt,
  }) : super(key: key);

  final TextEditingController controller;
  final String validatorTxt;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
        cursorColor: AppColor.primaryColor,
        validator: (value) => value!.isEmpty ? validatorTxt : null,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
                topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: AppColor.primaryColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            borderSide: BorderSide(width: 1, color: AppColor.borderColor),
          ),
        ),
        onFieldSubmitted: (value) {
          //add code
        },
      ),
    );
  }
}
