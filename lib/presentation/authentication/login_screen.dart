import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/heiper/validator.dart';
import 'package:grower/presentation/authentication/otp_screen.dart';
import 'package:grower/utils/const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
                      child: Icon(
                        Icons.mail_outline,
                        color: primaryColor,
                        size: 60,
                      ),
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
                      const Text('Email Address'),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: primaryColor, width: 2),
                          ),
                          hintText: 'abc@gmail.com',
                        ),
                        validator: (value) {
                          if (value.toString().isValidEmail != true ||
                              value == null ||
                              value.isEmpty) {
                            return "Please enter a valid email address !";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          value.isValidEmail
                              ? setState(() {
                                  isValid = true;
                                })
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Please enter your email to receive an OTP (One Time Password)',
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 200.h,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OtpScreen(),
                              ),
                            );
                          }
                        },
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 25.w),
                            height: 50,
                            width: 280.w,
                            decoration: BoxDecoration(
                                color: isValid ? primaryColor : seconderyColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
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
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
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
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
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
      ),
    );
  }
}
