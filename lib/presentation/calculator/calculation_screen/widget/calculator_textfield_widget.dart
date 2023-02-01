import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../theme/custom_theme.dart';

class CalculatorTextFieldWidget extends StatelessWidget {
  const CalculatorTextFieldWidget(
      {super.key,
      required this.title,
      required this.hintText,
      required this.controller});
  final String title;
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 54,
          width: 95,
          decoration: CustomTheme.calculatorContianerStyle,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style:
                      TextStyle(color: CustomTheme.primaryColor, fontSize: 14),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 3),
                  height: 2,
                  width: 50,
                  decoration: BoxDecoration(color: CustomTheme.primaryColor),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Container(
          width: 193.w,
          height: 54,
          decoration: CustomTheme.calculatorContianerStyle,
          child: TextFormField(
            controller: controller,
            textAlign: TextAlign.right,
            cursorColor: CustomTheme.primaryColor,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: CustomTheme.calculatorTextStyle(hintText),
          ),
        )
      ],
    );
  }
}
