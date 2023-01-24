import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../theme/custom_theme.dart';

class BottomOptionsModel {
  final String title;
  final String iconUrl;
  BottomOptionsModel({
    required this.title,
    required this.iconUrl,
  });
}

List<BottomOptionsModel> optionsList = [
  BottomOptionsModel(title: 'Home', iconUrl: 'assets/home.svg'),
  BottomOptionsModel(title: 'Reset', iconUrl: 'assets/reset.svg'),
  BottomOptionsModel(title: 'PDF', iconUrl: 'assets/pdf.svg'),
  BottomOptionsModel(title: 'Exit', iconUrl: 'assets/exit.svg')
];

class BottomOptionsWidget extends StatelessWidget {
  const BottomOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: optionsList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.only(left: 10, right: 15, bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: CustomTheme.shadowDecoration,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          optionsList[index].iconUrl,
                          height: 25,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          optionsList[index].title,
                          style: TextStyle(
                              color: CustomTheme.primaryColor, fontSize: 12),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}