import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/custom_small_btn_widget.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget(
      {super.key,
      required this.content,
      required this.leftBtnTitle,
      required this.title});
  final String content;
  final String leftBtnTitle;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(title),
        content: Text(
          content,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        actionsPadding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.remove('isLoggedIn');
                  Navigator.pop(context);
                },
                child: SmallBtnWidget.whiteBtn(leftBtnTitle, Colors.white),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SmallBtnWidget.filledColorBtn('No, Wait'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
