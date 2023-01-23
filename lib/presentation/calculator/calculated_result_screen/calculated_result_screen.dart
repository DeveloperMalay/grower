import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/fertilizer_container.dart';
import 'package:grower/presentation/calculator/widgets/dot_header_widget.dart';
import '../../../theme/custom_theme.dart';
import '../../widgets/custom_appbar_widget.dart';
import '../calculation_screen/cubit/dropdownIndex/dropdown_index_cubit.dart';
import 'widget/bottom_options_widgets.dart';
import 'widget/fertilizer_result_widget.dart';

class CalculatedResultScreen extends StatefulWidget {
  const CalculatedResultScreen({super.key});

  @override
  State<CalculatedResultScreen> createState() => _CalculatedResultScreenState();
}

class _CalculatedResultScreenState extends State<CalculatedResultScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: CustomAppbarWidget(
          appbarTitle: 'Calculated Results',
          isresult: true,
        ),
        backgroundColor: CustomTheme.bgColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DotHeaderWidget(header: 'Dry Fertilizer'), //header with dot
                FertilizerContainer(
                    title:
                        context.watch<DropdownIndexCubit>().state.fertilizer),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Total weight of dry fertilizer:",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Text("40 lbs",
                    style: CustomTheme.primarytextStyle(14, FontWeight.w500)),
                Container(
                    height: 1,
                    width: 226,
                    margin: EdgeInsets.only(top: 5),
                    color: Colors.grey),
                SizedBox(height: 12),
                DryFertilizerResultWidget(),
                SizedBox(
                  height: 24,
                ),
                Divider(
                  color: CustomTheme.primaryColor,
                  thickness: 2,
                ),
                SizedBox(height: 24),
                DotHeaderWidget(header: "Liquid Fertilizer"), //header with dot
                FertilizerContainer(
                    title:
                        context.watch<DropdownIndexCubit>().state.fertilizer),
                SizedBox(height: 12),
                Text("Total weight of liquid fertilizer:",
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 12),
                Text(
                  "834.50 lbs",
                  style: TextStyle(
                      fontSize: 14,
                      color: CustomTheme.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 1,
                  width: 226,
                  margin: EdgeInsets.only(top: 5),
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue[100]!,
                          offset: Offset(3.5, 4),
                          blurRadius: 10,
                          spreadRadius: 0.4,
                        ),
                      ]),
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
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Phosphorus(P)",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Phosphorus(P)",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
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
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
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
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
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
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Boron (B)",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Calcium (Ca)",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "D",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "E",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
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
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "6",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "6",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "6",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "6",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
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
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "15",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "15",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "15",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "15",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 30,
                  width: 342,
                  padding: EdgeInsets.only(top: 5, bottom: 5, left: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue[100]!,
                          offset: Offset(3.5, 4),
                          blurRadius: 10,
                          spreadRadius: 0.4,
                        ),
                      ]),
                  child: Text(
                    'Calculated mixture is:',
                    style: TextStyle(
                        color: CustomTheme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Total dry + liquid fertilizer weight :",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "874.50 lbs",
                  style: TextStyle(
                      fontSize: 14,
                      color: CustomTheme.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 1,
                  width: 342,
                  margin: EdgeInsets.only(top: 5),
                  color: CustomTheme.primaryColor,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Density of a mixture:",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "83.45 lbs/g",
                  style: TextStyle(
                      fontSize: 14,
                      color: CustomTheme.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 1,
                  width: 342,
                  margin: EdgeInsets.only(top: 5),
                  color: CustomTheme.primaryColor,
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue[100]!,
                          offset: Offset(3.5, 4),
                          blurRadius: 10,
                          spreadRadius: 0.4,
                        ),
                      ]),
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
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Phosphorus(P)",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Phosphorus(P)",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
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
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
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
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
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
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Boron (B)",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Calcium (Ca)",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "D",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "E",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
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
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "6",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "6",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "6",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "6",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
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
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "15",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "15",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "15",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "15",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: CustomTheme.primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Max dry matter per gallon water",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "9 lbs",
                  style: TextStyle(
                      fontSize: 14,
                      color: CustomTheme.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 1,
                  width: 342,
                  margin: EdgeInsets.only(top: 5),
                  color: CustomTheme.primaryColor,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Dry matter from liquid",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "75.11 lbs",
                  style: TextStyle(
                      fontSize: 14,
                      color: CustomTheme.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 1,
                  width: 342,
                  margin: EdgeInsets.only(top: 5),
                  color: CustomTheme.primaryColor,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Dry material from ingredients",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "40 lbs",
                  style: TextStyle(
                      fontSize: 14,
                      color: CustomTheme.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 1,
                  width: 342,
                  margin: EdgeInsets.only(top: 5),
                  color: CustomTheme.primaryColor,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Total Dry material",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "115.11 lbs",
                  style: TextStyle(
                      fontSize: 14,
                      color: CustomTheme.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 1,
                  width: 342,
                  margin: EdgeInsets.only(top: 5),
                  color: CustomTheme.primaryColor,
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: 342,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue[100]!,
                          offset: Offset(3.5, 4),
                          blurRadius: 10,
                          spreadRadius: 0.4,
                        ),
                      ]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mixture is:',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '106.11 lbs',
                            style: TextStyle(
                                fontSize: 16, color: CustomTheme.primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Pounds over suggested limit of 9 pounds dry material per gallon',
                        style: TextStyle(fontSize: 14, color: Colors.red),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: BottomOptionsWidget(), //showing bottom optins
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
