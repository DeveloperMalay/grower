import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/presentation/calculator/calculation_screen/calculator_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

import '../../utils/const.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final pinController = TextEditingController();
  bool isFocused = false;
  bool isValid = false;

  final formKey = GlobalKey<FormState>();
  TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    pinController.dispose();

    super.dispose();
  }

  final defaultPinTheme = PinTheme(
    width: 40,
    height: 40,
    textStyle: const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: seconderyColor.withOpacity(0.3)),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  final focusedPinTheme = PinTheme(
    width: 40,
    height: 40,
    textStyle: const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      color: seconderyColor.withOpacity(0.3),
      border: Border.all(color: seconderyColor.withOpacity(0.3)),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  // PinTheme? focusedPinTheme;
  final submittedPinTheme = PinTheme(
    width: 40,
    height: 40,
    textStyle: const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      color: seconderyColor.withOpacity(0.3),
      border: Border.all(color: seconderyColor.withOpacity(0.3)),
      borderRadius: BorderRadius.circular(10),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height * .9678,
          width: MediaQuery.of(context).size.width,
          color: primaryColor,
          child: Column(
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
                    color: seconderyColor,
                  ),
                  child: Center(
                    child: Image.asset('assets/otp_logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 51.h,
              ),
              Container(
                height: 456.h,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(130),
                  ),
                ),
                child: Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text(
                          'We have successfully sent an OTP (One-Time-Password) to abcd@gmail.com'),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 75.0, left: 73.w, right: 73.w),
                      child: Pinput(
                        controller: _otpController,
                        length: 4,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        validator: (s) {
                          if (s!.isEmpty) {
                            return "invalid Otp!";
                          }
                        },
                        onTap: () {
                          setState(() {
                            isFocused = true;
                          });
                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin) {
                          setState(() {
                            isValid = true;
                            isFocused = false;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 130.0, left: 129.1.w, right: 129.1.w),
                      child: const SizedBox(
                        width: 70,
                        child: Text(
                          '00:20 sec',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 160.0, left: 60.w, right: 60.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Didn’t receive OTP yet?',
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.grey),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Resend',
                            style:
                                TextStyle(fontSize: 14.sp, color: primaryColor),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: isFocused ? 200.h : 50.h,
                      child: InkWell(
                        onTap: () {
                          isFocused || isValid
                              ? showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Lottie.asset(
                                            'assets/green_tick.json',
                                            repeat: true,
                                            reverse: true,
                                            animate: true,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                              'OTP Verification successful !'),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    );
                                  })
                              : null;

                          isFocused || isValid
                              ? Timer(Duration(seconds: 2), () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CalculatorScreen(),
                                    ),
                                  );
                                })
                              : null;
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 17.w),
                          height: 50,
                          width: 280.w,
                          decoration: BoxDecoration(
                              color: isValid ? primaryColor : seconderyColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              'Continue',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
