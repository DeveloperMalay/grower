import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/presentation/calculator/calculation_screen/cubit/dropdownIndex1/dropdown_index_cubit1.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/custom_dropdown.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/custom_dropdown1.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/disclaimer_alert_dialog.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/reminder_popup.dart';
import 'package:grower/presentation/widgets/custom_appbar_widget.dart';
import '../../../theme/custom_theme.dart';
import '../widgets/add_other_nutrients_screen.dart';
import 'cubit/dropdownIndex/dropdown_index_cubit.dart';
import 'cubit/dropdownitem1Click/dropdownitem_click_cubit1.dart';
import 'cubit/dropdownitemClick/dropdownitem_click_cubit.dart';
import 'cubit/reminder/reminder_cubit.dart';
import '../widgets/fertilizer_model.dart';
import 'widget/calculator_textfield_widget.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final poundController = TextEditingController();
  @override
  void initState() {
    super.initState();
    poundController.text = 'Initial text';
    Timer(Duration(seconds: 1), () {
      print(context.read<ReminderCubit>().state.hitReminder);
      showDialog(
        context: context,
        builder: (context) => ReminderPopUp(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: CustomAppbarWidget(
          appbarTitle: 'Calculator',
        ),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height * .9,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                "assets/bgImage.png",
              ),
            ),
            color: CustomTheme.bgColor,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                          color: CustomTheme.primaryColor,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Dry Fertilizers",
                      style: TextStyle(
                          color: CustomTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Enter your required amount*',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 12,
                ),
                CalculatorTextFieldWidget(
                  title: 'pounds',
                  hintText: 'Amount',
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Choose fertilizer*',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {
                    context.read<DropdownitemClickCubit>().clickedDropDown();
                  },
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0.5),
                            blurRadius: 0.03,
                            spreadRadius: 0.03,
                          ),
                        ]),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        context
                                .watch<DropdownitemClickCubit>()
                                .state
                                .dropdownItenClicked
                            ? Icon(
                                Icons.expand_more_outlined,
                                color: CustomTheme.primaryColor,
                                size: 30,
                              )
                            : Icon(
                                Icons.arrow_forward_ios,
                                color: CustomTheme.primaryColor,
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          context.watch<DropdownIndexCubit>().state.fertilizer,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                context
                        .watch<DropdownitemClickCubit>()
                        .state
                        .dropdownItenClicked
                    ? CustomDropDown()
                    : Container(),
                SizedBox(
                  height: 5,
                ),
                context.watch<DropdownIndexCubit>().state.fertilizer ==
                        'Choose fertilizer*'
                    ? Container()
                    : Container(
                        height: 28,
                        width: 342,
                        padding: const EdgeInsets.only(top: 0, left: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 0.5),
                                blurRadius: 0.03,
                                spreadRadius: 0.03,
                              ),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('N'),
                                SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  fertilizerData[context
                                          .watch<DropdownIndexCubit>()
                                          .state
                                          .dropdownindex]
                                      .amountofN,
                                  style: TextStyle(
                                      color: CustomTheme.primaryColor),
                                )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('P'),
                                SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  fertilizerData[context
                                          .watch<DropdownIndexCubit>()
                                          .state
                                          .dropdownindex]
                                      .amountofP,
                                  style: TextStyle(
                                      color: CustomTheme.primaryColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('K'),
                                SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  fertilizerData[context
                                          .watch<DropdownIndexCubit>()
                                          .state
                                          .dropdownindex]
                                      .amountofK,
                                  style: TextStyle(
                                      color: CustomTheme.primaryColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                context.watch<DropdownIndexCubit>().state.fertilizer ==
                        'Choose fertilizer*'
                    ? Container(
                        height: 24,
                        width: 117,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: CustomTheme.seconderyColor,
                        ),
                        child: const Center(
                            child: Text(
                          'Other nutrients',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                      )
                    : InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AddOtherNutrientswidget());
                        },
                        child: Container(
                          height: 24,
                          width: 117,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: CustomTheme.primaryColor,
                          ),
                          child: const Center(
                              child: Text(
                            'Other nutrients',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )),
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                Divider(
                  color: CustomTheme.primaryColor,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                          color: CustomTheme.primaryColor,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Liquid Fertilizers",
                      style: TextStyle(
                          color: CustomTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Enter your required amount in gallon*',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 12,
                ),
                CalculatorTextFieldWidget(
                  title: 'gallons',
                  hintText: 'Amount',
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Enter density of liquid*',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 12,
                ),
                CalculatorTextFieldWidget(
                  title: 'd(lbs/g)',
                  hintText: 'Density',
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Choose fertilizer*',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {
                    context.read<DropdownitemClickCubit1>().clickedDropDown();
                  },
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0.5),
                            blurRadius: 0.03,
                            spreadRadius: 0.03,
                          ),
                        ]),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        context
                                .watch<DropdownitemClickCubit1>()
                                .state
                                .dropdownItenClicked1
                            ? Icon(
                                Icons.expand_more_outlined,
                                color: CustomTheme.primaryColor,
                                size: 30,
                              )
                            : Icon(
                                Icons.arrow_forward_ios,
                                color: CustomTheme.primaryColor,
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          context.watch<DropdownIndexCubit1>().state.fertilizer,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                context
                        .watch<DropdownitemClickCubit1>()
                        .state
                        .dropdownItenClicked1
                    ? CustomDropDown1()
                    : Container(),
                SizedBox(
                  height: 5,
                ),
                context.watch<DropdownIndexCubit1>().state.fertilizer ==
                        'Choose fertilizer*'
                    ? Container()
                    : Container(
                        height: 28,
                        width: 342,
                        padding: const EdgeInsets.only(top: 0, left: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            // border: Border(bottom: BorderSide(color: greylight)),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 0.5),
                                blurRadius: 0.03,
                                spreadRadius: 0.03,
                              ),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('N'),
                                SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  fertilizerData1[context
                                          .watch<DropdownIndexCubit1>()
                                          .state
                                          .dropdownindex]
                                      .amountofN,
                                  style: TextStyle(
                                      color: CustomTheme.primaryColor),
                                )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('P'),
                                SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  fertilizerData1[context
                                          .watch<DropdownIndexCubit1>()
                                          .state
                                          .dropdownindex]
                                      .amountofP,
                                  style: TextStyle(
                                      color: CustomTheme.primaryColor),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('K'),
                                SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  fertilizerData1[context
                                          .watch<DropdownIndexCubit1>()
                                          .state
                                          .dropdownindex]
                                      .amountofK,
                                  style: TextStyle(
                                      color: CustomTheme.primaryColor),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                context.watch<DropdownIndexCubit1>().state.fertilizer ==
                        'Choose fertilizer*'
                    ? Container(
                        height: 24,
                        width: 117,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: CustomTheme.seconderyColor,
                        ),
                        child: const Center(
                            child: Text(
                          'Other nutrients',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                      )
                    : InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AddOtherNutrientswidget());
                        },
                        child: Container(
                          height: 24,
                          width: 117,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: CustomTheme.primaryColor,
                          ),
                          child: const Center(
                              child: Text(
                            'Other nutrients',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                context.watch<DropdownIndexCubit>().state.fertilizer ==
                            'Choose fertilizer*' ||
                        context.watch<DropdownIndexCubit1>().state.fertilizer ==
                            'Choose fertilizer*'
                    ? Container()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Instructions:',
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                margin:
                                    EdgeInsets.only(right: 10, top: 5, left: 7),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              Text(
                                'We do not recommend adding more than a 1:1\n ratio of dry fertilizer to water.',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                margin:
                                    EdgeInsets.only(right: 10, top: 5, left: 7),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              Text(
                                'Less than a 1:1 ratio of dry fertilizer to liquids\nwith other dissolved materials.',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                            ],
                          )
                        ],
                      ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => DisclaimerAlertDialog());
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 17.w, vertical: 40),
                      height: 50,
                      width: 280.w,
                      decoration: BoxDecoration(
                          color: CustomTheme.primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
