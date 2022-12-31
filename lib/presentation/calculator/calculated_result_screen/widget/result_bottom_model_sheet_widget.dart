import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: InkWell(
                  onTap: () {},
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
                            title: 'Are you want to Reset?'));
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
                            title: 'Are you sure?'));
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
    ;
  }
}
