import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grower/heiper/navigator_function.dart';
import 'package:grower/presentation/authentication/custom_bachground_screen.dart';
import 'package:grower/presentation/authentication/widget/login_widget.dart';
import 'package:grower/presentation/widgets/custom_button_widget.dart';
import '../../theme/custom_theme.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/signup_screenbg.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 50.h,
                    left: 43.w,
                    bottom: 10,
                  ),
                  child: const Text(
                    'Welcome to',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                Positioned(
                  top: 75.h,
                  left: 43.w,
                  child: Text(
                    "Grower’s Secret Calculator",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CustomTheme.primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                Positioned(
                    top: 210.h,
                    right: -30.w,
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 50,
                        backgroundImage: AssetImage('assets/truck.png'),
                      ),
                    )),
                Positioned(
                    top: 300.h,
                    left: -30.w,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 50,
                        backgroundImage: AssetImage('assets/harvest.png'),
                      ),
                    )),
                Positioned(
                    bottom: 155.h,
                    left: 46.w,
                    child: const Text(
                      "Let's",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                  bottom: 130.h,
                  left: 43.w,
                  child: Text(
                    "Get Started!",
                    style: TextStyle(
                        color: CustomTheme.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  bottom: 62.h,
                  left: 20.w,
                  right: 20.w,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CustomButtonWidget(
                        isValid: true,
                        btnTitle: 'Sign Up',
                        onBtnPress: () {
                          context.go('/login');
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
