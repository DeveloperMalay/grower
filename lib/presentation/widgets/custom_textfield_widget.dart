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
  });
  final String hinttext;
  VoidCallback ontap;
  final FormFieldValidator<String> validator;
  ValueChanged<String>? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      cursorColor: CustomTheme.primaryColor,
      decoration: CustomTheme.textFieldStyle(hinttext),
      onTap: ontap,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
