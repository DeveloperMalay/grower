import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/custom_theme.dart';
import '../calculator/calculation_screen/widget/calculator_bottom_model_sheet.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbarWidget({super.key, required this.appbarTitle});
  final String appbarTitle;
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          )),
      title: Container(
        height: 34,
        width: 250,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: CustomTheme.greylight,
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/grower_logo.png',
              height: 30,
            ),
            Text(
              appbarTitle,
              style: TextStyle(color: CustomTheme.primaryColor, fontSize: 14),
            )
          ],
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                context: context,
                builder: (context) {
                  return CalculatorBottomModelSheet();
                });
          },
          child: SvgPicture.asset(
            'assets/menu.svg',
          ),
        )
      ],
    );
  }
}
