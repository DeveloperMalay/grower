import 'package:flutter/material.dart';
import '../../../../theme/custom_theme.dart';

class DryFertilizerResultWidget extends StatelessWidget {
  const DryFertilizerResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: CustomTheme.shadowDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 173,
                child: Text(
                  "Nutrients",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Text(
                "TDW(lbs)",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "NPK(%)",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Divider(
            color: CustomTheme.primaryColor,
            thickness: 1.5,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 110,
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nitrogen(N)",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Phosphorus(P)",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Phosphorus(P)",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                width: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "6.40",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "0",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "0",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                  ],
                ),
              ),
              Container(
                width: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "16",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "0",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "0",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                "Other added nutrients",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Divider(
            color: CustomTheme.primaryColor,
            thickness: 1.5,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 110,
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "A",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Boron (B)",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Calcium (Ca)",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "D",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "E",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                width: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "6",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "6",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "6",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "6",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "6",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                  ],
                ),
              ),
              Container(
                width: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "15",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "15",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "15",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "15",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "15",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
