import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/custom_theme.dart';

class CustomBackgroundWidget extends StatelessWidget {
  const CustomBackgroundWidget(
      {super.key, required this.widget, required this.isLogin});
  final Widget widget;
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: CustomTheme.primaryColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 87.h,
                ),
                Center(
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: CustomTheme.seconderyColor,
                    ),
                    child: Center(
                      child: isLogin
                          ? Icon(
                              Icons.mail_outline,
                              color: CustomTheme.primaryColor,
                              size: 60,
                            )
                          : Image.asset('assets/otp_logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
                Container(
                  height: 437.6.h,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/bg_round.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: widget,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
