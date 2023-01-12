import 'package:flutter/material.dart';
import '../../../../theme/custom_theme.dart';

import '../../widgets/alert_dialog_widget.dart';

class CalculatorBottomModelSheet extends StatelessWidget {
  const CalculatorBottomModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        height: 180,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Text(
                  "More Options",
                  style:
                      TextStyle(color: CustomTheme.primaryColor, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialogWidget(
                            content: 'You are going to Exit Calculator.',
                            leftBtnTitle: "Yes, Exit",
                            title: 'Are you sure?',
                          ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
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
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialogWidget(
                          content: 'You are going to logout Calculator.',
                          leftBtnTitle: 'Yes, Logout',
                          title: 'Are you sure?'));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
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
