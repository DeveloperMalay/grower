import 'package:flutter/material.dart';
import 'package:grower/heiper/navigator_function.dart';
import 'package:grower/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../theme/custom_theme.dart';
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
        content: Container(
          width: 390,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 22,
              ),
              Text(title, style: TextStyle(fontSize: 16, color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text(
                content,
                style: TextStyle(fontSize: 14, color: CustomTheme.textColor),
              ),
            ],
          ),
        ),
        actionsPadding: EdgeInsets.only(bottom: 30, left: 10, right: 10),
        actions: [
          SizedBox(
            height: 12,
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.remove('isLoggedIn');
                    Navigator.pop(context);
                    screenReplaceNavigator(context, SplashScreen());
                  },
                  child: SmallBtnWidget.whiteBtn(leftBtnTitle, Colors.white),
                ),
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SmallBtnWidget.filledColorBtn('No, Wait'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
