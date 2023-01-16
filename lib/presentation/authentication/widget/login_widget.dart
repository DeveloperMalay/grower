import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/heiper/validator.dart';
import 'package:grower/presentation/authentication/custom_bachground_screen.dart';
import 'package:grower/presentation/authentication/widget/otp_widget.dart';
import '../../../data/repository/login_repository.dart';
import '../../../heiper/navigator_function.dart';
import '../../../theme/custom_theme.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_textfield_widget.dart';

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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text(
              'Email Address',
              style: TextStyle(
                  color: Colors.black, fontSize: CustomTheme.fontsize['sm']),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: CustomTextFieldWidget(
              controller: emailController,
              hinttext: 'abc@gmail.com',
              ontap: () {
                setState(() {
                  isFocused = true;
                });
              },
              onChanged: (value) {
                setState(() {
                  isValid = _formKey.currentState!.validate();
                });
              },
              validator: (value) {
                if (value.toString().isValidEmail != true ||
                    value == null ||
                    value.isEmpty) {
                  return "Please enter a valid email address !";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              'Please enter your email to receive an OTP (One Time Password)',
              style: TextStyle(
                fontSize: 14.sp,
                color: CustomTheme.greyshade1.withOpacity(0.8),
              ),
            ),
          ),
          Spacer(),
          CustomButtonWidget(
            isValid: isValid,
            btnTitle: 'Continue',
            onBtnPress: () {
              if (_formKey.currentState!.validate()) {
                try {
                  userLogin(emailController.text);
                } catch (e) {
                  print(e);
                }
                screenNavigator(
                    context,
                    CustomBackgroundWidget(
                        widget: OtpWidget(
                          email: emailController.text,
                        ),
                        isLogin: false));
              }
            },
          ),
          isFocused
              ? Container()
              : Center(
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
                            color: CustomTheme.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        ' and',
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      )
                    ],
                  ),
                ),
          isFocused
              ? Container()
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Text(
                      'Privacy Policy.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10,
                          color: CustomTheme.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
