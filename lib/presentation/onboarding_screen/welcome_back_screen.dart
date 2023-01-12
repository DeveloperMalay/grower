import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/heiper/navigator_function.dart';
import 'package:grower/presentation/authentication/custom_bachground_screen.dart';
import 'package:grower/presentation/authentication/widget/login_widget.dart';
import '../../theme/custom_theme.dart';

class WelcomeBackScreen extends StatelessWidget {
  const WelcomeBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
                child: Image.asset(
              'assets/bg2.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            )),
            Positioned(bottom: 0, child: Image.asset('assets/bg.png')),
            Positioned(
                bottom: 145.h,
                left: 46.w,
                child: const Text(
                  "Welcome back to",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            Positioned(
              bottom: 120.h,
              left: 43.w,
              child: Text(
                "Grower’s Secret Calculator",
                style: TextStyle(
                    color: CustomTheme.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 62.h,
              child: InkWell(
                onTap: () {
                  screenNavigator(
                      context,
                      CustomBackgroundWidget(
                          widget: LoginWidget(), isLogin: true));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.w),
                  height: 50,
                  width: 280.w,
                  decoration: BoxDecoration(
                      color: CustomTheme.primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
