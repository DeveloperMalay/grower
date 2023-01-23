import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/heiper/navigator_function.dart';
import 'package:grower/presentation/widgets/custom_button_widget.dart';
import 'package:pinput/pinput.dart';
import '../../../theme/custom_theme.dart';
import '../../calculator/calculation_screen/calculator_screen.dart';
import '../../widgets/error_diolog.dart';
import '../../widgets/loading_dialog.dart';
import '../../widgets/success_popup_widget.dart';
import '../cubit/verify_otp/verify_otp_cubit.dart';

class OtpWidget extends StatefulWidget {
  const OtpWidget({super.key, required this.email});
  final String email;
  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  final pinController = TextEditingController();
  bool isFocused = false;
  bool isValid = false;

  final formKey = GlobalKey<FormState>();
  TextEditingController _otpController = TextEditingController();
  int _timerDuration = 20;

  void startTimer() {
    // String twoDigits(int n) => n.toString().padLeft(2, '0');
    // final seconds = twoDigits(_timerDuration.remainder(60));
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_timerDuration == 1) {
        setState(() {
          timer.cancel();
        });
      }
      setState(() {
        _timerDuration--;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
        if (state.status == VerifyStatus.loading) {
          return loadingDialog(context);
        }
        if (state.status == VerifyStatus.error) {
          errorDialog(context, state.error.errMsg);
        }
        if (state.status == VerifyStatus.loaded &&
            context.read<VerifyOtpCubit>().state.verifyotp.status == 200) {
          showDialog(
              context: context,
              builder: (context) {
                return SuccessPopUpWidget(
                  title: 'OTP Verification successful !',
                );
              });
          Timer(Duration(seconds: 2), () {
            screenReplaceNavigator(context, CalculatorScreen());
          });
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text:
                      'We have successfully sent an OTP (One-Time-\nPassword) to ',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                TextSpan(
                  text: widget.email,
                  style:
                      TextStyle(color: CustomTheme.primaryColor, fontSize: 14),
                ),
              ])),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 73.w, right: 73.w),
              child: Pinput(
                controller: _otpController,
                length: 4,
                defaultPinTheme: CustomTheme.pintheme,
                focusedPinTheme: CustomTheme.pintheme,
                submittedPinTheme: CustomTheme.pintheme,
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
            context.read<VerifyOtpCubit>().state.verifyotp.status == 403
                ? Text('Invalid Otp !')
                : Container(),
            Padding(
              padding: EdgeInsets.only(
                top: 20.0,
              ),
              child: Center(
                child: Text(
                  '00:$_timerDuration sec',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Didn’t receive OTP yet?',
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Resend',
                        style: TextStyle(
                            fontSize: 14.sp, color: CustomTheme.primaryColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            CustomButtonWidget(
              isValid: isValid,
              btnTitle: 'Continue',
              onBtnPress: () {
                if (isFocused || isValid) {
                  context
                      .read<VerifyOtpCubit>()
                      .otpVerify(widget.email, _otpController.text);
                  if (state.status == VerifyStatus.loaded &&
                      context.read<VerifyOtpCubit>().state.verifyotp.status ==
                          200) {
                    Timer(Duration(seconds: 2), () {
                      Navigator.pop(context);
                    });
                  }
                }
              },
            ),
            SizedBox(
              height: 20,
            )
          ],
        );
      },
    );
  }
}
