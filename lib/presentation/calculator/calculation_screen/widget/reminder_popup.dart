import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grower/presentation/calculator/calculation_screen/cubit/reminder/reminder_cubit.dart';
import '../../../../utils/const.dart';
import '../../../update_profile/update_profile_screen.dart';

class ReminderPopUp extends StatelessWidget {
  const ReminderPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          context.watch<ReminderCubit>().state.hitReminder == 0
              ? Image.asset('assets/sad_avatar.png')
              : Image.asset('assets/avatar.png'),
          // SvgPicture.asset('assets/avatar.svg'),
          const SizedBox(
            height: 30,
          ),
          context.watch<ReminderCubit>().state.hitReminder == 0
              ? Text(
                  'You’ve used up your hits!',
                  style: TextStyle(fontSize: 24),
                )
              : Text(
                  '${context.watch<ReminderCubit>().state.hitReminder} Hits Left!',
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: primaryColor)),
                  child: Center(
                    child: Text(
                        context.watch<ReminderCubit>().state.hitReminder == 0
                            ? "Exit"
                            : 'Skip',
                        style: TextStyle(color: primaryColor)),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  context.read<ReminderCubit>().noOfHit();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateProfileScreen()));
                },
                child: Container(
                  width: 120,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: primaryColor),
                  ),
                  child: const Center(
                    child:
                        Text('Update ', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
