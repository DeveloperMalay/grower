import 'dart:async';

import 'package:flutter/material.dart';

import 'presentation/authentication/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen());
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
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SignUpScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                .animate(animation),
            child: child,
          );
        },
      ),
    );
  }
}
