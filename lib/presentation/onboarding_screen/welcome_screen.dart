import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/utils/const.dart';

import '../authentication/login_screen.dart';

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
              color: Colors.blue,
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
                      color: primaryColor,
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
                    bottom: 145.h,
                    left: 46.w,
                    child: const Text(
                      "Let's",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                  bottom: 120.h,
                  left: 43.w,
                  child: Text(
                    "Get Started!",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  bottom: 62.h,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40.w),
                      height: 50,
                      width: 280.w,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
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
