import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/presentation/calculator/calculator_screen.dart';
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
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  TextEditingController _otpController = TextEditingController();
  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
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
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    const Text(
                        'We have successfully sent an OTP (One-Time-Password) to abcd@gmail.com'),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Pinput(
                        controller: _otpController,
                        length: 4,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        validator: (s) {},
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin) => print(pin),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                        child: Text(
                      '00:20 sec',
                      style: TextStyle(color: Colors.grey),
                    )),
                    SizedBox(
                      height: 15.h,
                    ),
                    Center(
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
                    SizedBox(
                      height: 200.h,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
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
                                    const Text('OTP Verification successful !'),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              );
                            });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CalculatorScreen(),
                          ),
                        );
                      },
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 25.w),
                          height: 50,
                          width: 280.w,
                          decoration: BoxDecoration(
                              color: seconderyColor,
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
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'By Clicking Continue, you agree to our ',
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                          Text(
                            ' Terms of Services',
                            style: TextStyle(
                                fontSize: 10,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            ' and',
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                        'Privacy Policy.',
                        style: TextStyle(
                            fontSize: 10,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
