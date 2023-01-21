import 'package:flutter/material.dart';

import '../../theme/custom_theme.dart';

class SmallBtnWidget {
  static filledColorBtn(String btnTitle) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: CustomTheme.primaryColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: CustomTheme.primaryColor),
      ),
      child: Center(
        child:
            Text(btnTitle, style: TextStyle(color: Colors.white, fontSize: 14)),
      ),
    );
  }

  static whiteBtn(String btnTitle, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: 100,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: CustomTheme.primaryColor)),
      child: Center(
        child: Text(btnTitle,
            style: TextStyle(color: CustomTheme.primaryColor, fontSize: 14)),
      ),
    );
  }
}
