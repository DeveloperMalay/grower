import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/presentation/authentication/cubit/email_checker/email_checker_cubit.dart';
import 'package:grower/presentation/authentication/cubit/login/login_cubit.dart';
import 'package:grower/presentation/authentication/custom_bachground_screen.dart';
import 'package:grower/presentation/authentication/widget/otp_widget.dart';
import 'package:grower/presentation/widgets/error_diolog.dart';
import '../../../heiper/navigator_function.dart';
import '../../../theme/custom_theme.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_textfield_widget.dart';
import '../../widgets/loading_dialog.dart';
import '../cubit/isSignInValid/is_signin_valid_cubit.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;
  bool isFocused = false;

  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          errorDialog(context, state.error.errMsg);
        }
        if (state.status == LoginStatus.loading) {
          return loadingDialog(context);
        }
        if (state.status == LoginStatus.loaded) {
          screenReplaceNavigator(
              context,
              CustomBackgroundWidget(
                  widget: OtpWidget(
                    email: emailController.text,
                  ),
                  isLogin: false));
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.0, left: 10),
                child: Text(
                  'Email Address',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: CustomTheme.fontsize['sm']),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomTextFieldWidget(
                  isfocused: isFocused,
                  controller: emailController,
                  hinttext: 'abc@gmail.com',
                  ontap: () {
                    setState(() {
                      isFocused = true;
                    });
                  },
                  onChanged: (value) {
                    context.read<EmailCheckerCubit>().checkEmail(value);
                    context.read<IsSigninValidCubit>().checkSignIn(
                        context.read<EmailCheckerCubit>().state.isemailValid);
                  },
                  validator: (value) {
                    return null;
                  },
                ),
              ),
              context.watch<EmailCheckerCubit>().state.isemailValid
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(top: 7.0, left: 10),
                      child: Text('Please enter a valid email address !',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                          )),
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 10),
                child: Text(
                  'Please enter your email to receive an OTP (One Time Password)',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: CustomTheme.greyshade1.withOpacity(0.8),
                  ),
                ),
              ),
              Spacer(),
              Column(
                children: [
                  context.watch<IsSigninValidCubit>().state.isSignInValid
                      ? CustomButtonWidget(
                          isValid: context
                              .read<IsSigninValidCubit>()
                              .state
                              .isSignInValid,
                          btnTitle: 'Continue',
                          onBtnPress: () {
                            print(context
                                .read<IsSigninValidCubit>()
                                .state
                                .isSignInValid);
                            if (_formKey.currentState!.validate() ||
                                emailController.text.isNotEmpty) {
                              try {
                                context
                                    .read<LoginCubit>()
                                    .loginUser(emailController.text);
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                        )
                      : CustomButtonWidget(
                          isValid: context
                              .watch<IsSigninValidCubit>()
                              .state
                              .isSignInValid,
                          btnTitle: 'Continue',
                          onBtnPress: () {
                            print(context
                                .read<IsSigninValidCubit>()
                                .state
                                .isSignInValid);
                          },
                        ),
                  isFocused
                      ? Container()
                      : RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'By Clicking Continue, you agree to our ',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                              TextSpan(
                                  text: ' Terms of Services',
                                  style: CustomTheme.primarytextStyle(
                                      10, FontWeight.bold)),
                              TextSpan(
                                text: ' and',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                  isFocused
                      ? Container()
                      : Center(
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 18.0.h),
                              child: Text('Privacy Policy.',
                                  textAlign: TextAlign.center,
                                  style: CustomTheme.primarytextStyle(
                                      10, FontWeight.bold))))
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
