import 'package:flutter/material.dart';

class AddOtherNutrientsDialog extends StatelessWidget {
  const AddOtherNutrientsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var container = Container(
      height: 30,
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 40),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Text(
        'Add your other nutrients in (%)',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
    return AlertDialog(
      // titlePadding: EdgeInsets.zero,
      // title: container,
      // content: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     Opacity(
      //       opacity: .2,
      //       child: Container(
      //         height: 20,
      //         child: Text(''),
      //       ),
      //     )
      //   ],
      // ),
      title: Opacity(
        opacity: 0.5,
        child: Text('Alert Dialog'),
      ),
      content: Text('This is the content of the alert dialog'),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {},
        ),
      ],
    );
  }
}
