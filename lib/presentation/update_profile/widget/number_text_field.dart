import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../theme/custom_theme.dart';
import 'country_code_bottomsheet.dart';

// ignore: must_be_immutable
class NumberTextField extends StatelessWidget {
  NumberTextField({
    super.key,
    required this.controller,
    required this.isfocused,
    required this.inputType,
    required this.hinttext,
    required this.ontap,
    required this.validator,
    this.inputFormatter,
    required this.onChanged,
  });
  final TextEditingController controller;
  final bool isfocused;
  final TextInputType inputType;
  final String hinttext;
  final VoidCallback ontap;
  final FormFieldValidator<String> validator;
  ValueChanged<String>? onChanged;
  List<TextInputFormatter>? inputFormatter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Expanded(flex: 1, child: CountryCodeWidget()),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                boxShadow: isfocused
                    ? [
                        BoxShadow(
                          color: CustomTheme.seconderyColor.withOpacity(0.8),
                          offset: Offset(0, 0),
                          spreadRadius: 0.0,
                          blurRadius: 12,
                        ),
                      ]
                    : [],
              ),
              child: TextFormField(
                controller: controller,
                keyboardType: inputType,
                cursorColor: CustomTheme.primaryColor,
                decoration: CustomTheme.textFieldStyle(hinttext),
                onTap: ontap,
                validator: validator,
                onChanged: onChanged,
                inputFormatters: inputFormatter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
