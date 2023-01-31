import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grower/presentation/calculator/calculation_screen/cubit/reminder/reminder_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../heiper/navigator_function.dart';
import '../../../../theme/custom_theme.dart';
import '../../../update_profile/cubit/user_details/user_details_cubit.dart';
import '../../../update_profile/user_profile_screen.dart';

class ReminderPopUp extends StatelessWidget {
  const ReminderPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            context
                        .watch<UserDetailsCubit>()
                        .state
                        .userDetails
                        .data
                        .hitRemaining ==
                    0
                ? Image.asset('assets/sad_avatar1.png')
                : Image.asset('assets/avatar1.png'),
            const SizedBox(
              height: 30,
            ),
            context
                        .watch<UserDetailsCubit>()
                        .state
                        .userDetails
                        .data
                        .hitRemaining ==
                    0
                ? Text(
                    'You’ve used up your hits!',
                    style: TextStyle(fontSize: 24),
                  )
                : Text(
                    '${context.watch<UserDetailsCubit>().state.userDetails.data.hitRemaining} Hits Left!',
                    style: TextStyle(fontSize: 24),
                  ),
            const SizedBox(height: 15),
            const Text(
              'Update your profile for unlimited use.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: CustomTheme.primaryColor)),
                    child: Center(
                      child: Text(
                          context
                                      .watch<UserDetailsCubit>()
                                      .state
                                      .userDetails
                                      .data
                                      .hitRemaining ==
                                  0
                              ? "Exit"
                              : 'Skip',
                          style: TextStyle(color: CustomTheme.primaryColor)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () async {
                    context.read<ReminderCubit>().hitreduce();
                    print('hit');
                    Navigator.pop(context);
                    // context.read<ReminderCubit>().noOfHit();
                    final prefs = await SharedPreferences.getInstance();
                    String email = await prefs.getString('email')!;

                    screenNavigator(context, UserProfileScreen());
                  },
                  child: Container(
                    width: 120,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    decoration: BoxDecoration(
                      color: CustomTheme.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: CustomTheme.primaryColor),
                    ),
                    child: const Center(
                      child: Text('Update ',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
