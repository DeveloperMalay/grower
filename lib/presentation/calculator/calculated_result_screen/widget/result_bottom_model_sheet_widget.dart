import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/heiper/navigator_function.dart';
import 'package:grower/presentation/calculator/calculation_screen/calculator_screen.dart';
import 'package:grower/presentation/update_profile/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../theme/custom_theme.dart';
import '../../../update_profile/user_profile_screen.dart';
import '../../widgets/alert_dialog_widget.dart';

class ResultBottomModelSheet extends StatefulWidget {
  const ResultBottomModelSheet({super.key});

  @override
  State<ResultBottomModelSheet> createState() => _ResultBottomModelSheetState();
}

class _ResultBottomModelSheetState extends State<ResultBottomModelSheet> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: Container(
        height: 300.h,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  height: 7,
                  width: 103,
                  decoration: BoxDecoration(color: CustomTheme.bgColor),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: InkWell(
                  onTap: () {
                    screenReplaceNavigator(context, CalculatorScreen());
                  },
                  child: const Text(
                    'Home',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: InkWell(
                  onTap: () {
                    screenNavigator(context, UserProfileScreen());
                  },
                  child: const Text(
                    'View Profile',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    'Download result as PDF',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialogWidget(
                              content: 'You are going to Reset Calculator.',
                              leftBtnTitle: "Yes, Reset ",
                              title: 'Are you want to Reset?',
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ));
                  },
                  child: const Text(
                    'Reset calculator',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialogWidget(
                              content: 'You are going to Exit Calculator.',
                              leftBtnTitle: "Yes, Exit",
                              title: 'Are you sure?',
                              onTap: () {
                                SystemNavigator.pop();
                              },
                            ));
                  },
                  child: const Text(
                    'Exit calculator',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialogWidget(
                              content: 'You are going to logout Calculator.',
                              leftBtnTitle: 'Yes, Logout',
                              title: 'Are you sure?',
                              onTap: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                prefs.remove('isLoggedIn');

                                SystemNavigator.pop();
                              },
                            ));
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
