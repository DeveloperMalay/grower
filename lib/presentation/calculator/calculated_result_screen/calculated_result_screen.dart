import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grower/presentation/calculator/calculated_result_screen/widget/result_text_widget.dart';
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
                FertilizerResultWidget(), //dry fertilizer details widget
                SizedBox(
                  height: 24,
                ),
                Divider(color: CustomTheme.primaryColor, thickness: 2),
                SizedBox(height: 24),
                DotHeaderWidget(header: "Liquid Fertilizer"), //header with dot
                FertilizerContainer(
                    title:
                        context.watch<DropdownIndexCubit>().state.fertilizer),
                SizedBox(height: 12),
                Text("Total weight of liquid fertilizer:",
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 12),
                Text("834.50 lbs",
                    style: CustomTheme.primarytextStyle(14, FontWeight.w500)),
                Container(
                    height: 1,
                    width: 226,
                    margin: EdgeInsets.only(top: 5),
                    color: Colors.grey),
                SizedBox(height: 12),
                FertilizerResultWidget(), //dry fertilizer details widget
                SizedBox(height: 24),
                Container(
                  height: 30,
                  width: 342,
                  padding: EdgeInsets.only(top: 5, bottom: 5, left: 12),
                  decoration: CustomTheme.calculatorContianerStyle,
                  child: Text('Calculated mixture is:',
                      style: CustomTheme.primarytextStyle(16, FontWeight.bold)),
                ),
                SizedBox(
                  height: 30,
                ),
                ResultTextWidget(
                    header: "Total dry + liquid fertilizer weight :",
                    result: "874.50 lbs"),
                ResultTextWidget(
                    header: "Density of a mixture:", result: "83.45 lbs/g"),
                FertilizerResultWidget(), //dry fertilizer details widget
                SizedBox(height: 24),
                ResultTextWidget(
                    header: "Max dry matter per gallon water", result: "9 lbs"),
                ResultTextWidget(
                    header: "Dry matter from liquid", result: "75.11 lbs"),
                ResultTextWidget(
                    header: "Dry material from ingredients", result: "40 lbs"),
                ResultTextWidget(
                    header: "Total Dry material", result: "115.11 lbs"),
                Container(
                  width: 342,
                  padding: EdgeInsets.all(16),
                  decoration: CustomTheme.shadowDecoration,
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
                            style: CustomTheme.primarytextStyle(
                                16, FontWeight.w400),
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
                  child: BottomOptionsWidget(), //showing bottom icons optins
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
