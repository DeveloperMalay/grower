import 'package:flutter/material.dart';
import '../../theme/custom_theme.dart';

// ignore: must_be_immutable
class CustomTextFieldWidget extends StatelessWidget {
  CustomTextFieldWidget({
    super.key,
    required this.hinttext,
    this.onChanged,
    required this.ontap,
    required this.validator,
    required this.controller,
    this.maxline = 1,
    // this.maxlength,
    this.inputType,
  });
  final String hinttext;
  VoidCallback ontap;
  final FormFieldValidator<String> validator;
  ValueChanged<String>? onChanged;
  final TextEditingController controller;
  int? maxline;
  // int? maxlength;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxline,
      // maxLength: maxlength,
      keyboardType: inputType,
      cursorColor: CustomTheme.primaryColor,
      decoration: CustomTheme.textFieldStyle(hinttext),
      onTap: ontap,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
