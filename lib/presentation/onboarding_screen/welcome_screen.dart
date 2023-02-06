import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grower/presentation/widgets/custom_button_widget.dart';
import '../../theme/custom_theme.dart';
import 'cubit/change_image/change_image_cubit.dart';
import 'widget/slide_in_animation1.dart';
import 'widget/slide_in_animation2.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    context.read<ChangeImageCubit>().changeImage();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInToLinear));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: FadeTransition(
            opacity: _fadeInFadeOut,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: context.watch<ChangeImageCubit>().state.switchImage
                    ? DecorationImage(
                        image: AssetImage("assets/signup_bg1.png"),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: AssetImage("assets/signup_screenbg.png"),
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
                      child: ScreenElementAppearAnimation1()),
                  Positioned(
                      top: 300.h,
                      left: -30.w,
                      child: ScreenElementAppearAnimation2()),
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
      ),
    );
  }
}
