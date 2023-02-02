import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../theme/custom_theme.dart';

// ignore: must_be_immutable
class FertilizerResultWidget extends StatelessWidget {
  FertilizerResultWidget({
    super.key,
    required this.data,
    required this.index,
    required this.tdwofN,
    required this.tdwofP,
    required this.tdwofK,
    this.totalpercentN,
    this.totalpercentP,
    this.totalpercentK,
  });
  var data;
  final int index;
  String tdwofN;
  String tdwofP;
  String tdwofK;
  String? totalpercentN;
  String? totalpercentP;
  String? totalpercentK;
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
                width: 155.w,
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
                width: 100.w,
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
                      "Potassium(K)",
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 40.w,
              ),
              Container(
                width: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      tdwofN,
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      tdwofP,
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      tdwofK,
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
                      totalpercentN ?? data[index].percentN!,
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      totalpercentP ?? data[index].percentP!,
                      style: TextStyle(
                          fontSize: 14, color: CustomTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      totalpercentK ?? data[index].percentK!,
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
                width: 83,
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
                width: 62.w,
              ),
              Container(
                width: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
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
        ],
      ),
    );
  }
}
