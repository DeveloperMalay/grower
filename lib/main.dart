import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/presentation/calculator/calculation_screen/cubit/reminder/reminder_cubit.dart';

import 'heiper/navigator_function.dart';
import 'presentation/calculator/calculation_screen/cubit/dropdownIndex/dropdown_index_cubit.dart';
import 'presentation/calculator/calculation_screen/cubit/dropdownIndex1/dropdown_index_cubit1.dart';
import 'presentation/calculator/calculation_screen/cubit/dropdownitem1Click/dropdownitem_click_cubit1.dart';
import 'presentation/calculator/calculation_screen/cubit/dropdownitemClick/dropdownitem_click_cubit.dart';
import 'presentation/onboarding_screen/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ReminderCubit()),
              BlocProvider(create: (context) => DropdownIndexCubit()),
              BlocProvider(create: (context) => DropdownitemClickCubit()),
              BlocProvider(create: (context) => DropdownIndexCubit1()),
              BlocProvider(create: (context) => DropdownitemClickCubit1()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Grower',
              theme: ThemeData(primaryColor: CustomTheme.primaryColor),
              home: const SplashScreen(),
            ),
          );
        });
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/grower_logo.png"),
                ),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/splashImg.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      screenReplaceNavigator(
          context, WelcomeScreen()); //It will redirect  after 3 seconds
    });
  }
}
