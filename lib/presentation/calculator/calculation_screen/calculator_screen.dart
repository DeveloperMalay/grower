import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grower/presentation/calculator/calculation_screen/cubit/dropdownIndex1/dropdown_index_cubit1.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/custom_dropdown.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/custom_dropdown1.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/disclaimer_alert_dialog.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/drop_down1_options_widget.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/reminder_popup.dart';
import 'package:grower/presentation/widgets/custom_appbar_widget.dart';
import 'package:grower/presentation/widgets/custom_button_widget.dart';
import '../../../theme/custom_theme.dart';
import '../widgets/add_other_nutrients_screen.dart';
import 'cubit/dropdownIndex/dropdown_index_cubit.dart';
import 'cubit/dropdownitem1Click/dropdownitem_click_cubit1.dart';
import 'cubit/dropdownitemClick/dropdownitem_click_cubit.dart';
import 'cubit/reminder/reminder_cubit.dart';
import 'widget/calculator_textfield_widget.dart';
import 'widget/drop_down_options_widget.dart';
import 'widget/instruction_widget.dart';
import 'widget/other_nutrients_btn.dart';

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
          isresult: false,
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
                CustomDropDown(
                  onTap: () {
                    context.read<DropdownitemClickCubit>().clickedDropDown();
                  },
                ),

                SizedBox(
                  height: 5,
                ),
                context.watch<DropdownIndexCubit>().state.fertilizer ==
                        'Select fertilizer'
                    ? Container()
                    : DropDownOptionsWidget(), //showting option after selecting
                const SizedBox(
                  height: 15,
                ),
                context.watch<DropdownIndexCubit>().state.fertilizer ==
                        'Select fertilizer'
                    ? OtherNutrientsBtnWidget(
                        active: false,
                        onTap: () {},
                      )
                    : OtherNutrientsBtnWidget(
                        active: true,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AddOtherNutrientswidget());
                        }),
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
                // InkWell(
                //   onTap: () {
                //     context.read<DropdownitemClickCubit1>().clickedDropDown();
                //   },
                //   child: Container(
                //     height: 54,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: Colors.white,
                //         border: Border.all(color: Colors.white),
                //         boxShadow: const [
                //           BoxShadow(
                //             color: Colors.grey,
                //             offset: Offset(0, 0.5),
                //             blurRadius: 0.03,
                //             spreadRadius: 0.03,
                //           ),
                //         ]),
                //     child: Row(
                //       children: [
                //         const SizedBox(
                //           width: 10,
                //         ),
                //         context
                //                 .watch<DropdownitemClickCubit1>()
                //                 .state
                //                 .dropdownItenClicked1
                //             ? Icon(
                //                 Icons.expand_more_outlined,
                //                 color: CustomTheme.primaryColor,
                //                 size: 30,
                //               )
                //             : Icon(
                //                 Icons.arrow_forward_ios,
                //                 color: CustomTheme.primaryColor,
                //               ),
                //         const SizedBox(
                //           width: 10,
                //         ),
                //         Text(
                //           context.watch<DropdownIndexCubit1>().state.fertilizer,
                //           style: TextStyle(color: Colors.grey),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                CustomDropDown1(
                  onTap: () {
                    context.read<DropdownitemClickCubit1>().clickedDropDown();
                  },
                ),

                SizedBox(
                  height: 5,
                ),
                context.watch<DropdownIndexCubit1>().state.fertilizer ==
                        'Select fertilizer'
                    ? Container()
                    : DropDown1OptionsWidget(), //showing options after seleting 2nd dropdown
                const SizedBox(
                  height: 15,
                ),
                context.watch<DropdownIndexCubit1>().state.fertilizer ==
                        'Select fertilizer'
                    ? OtherNutrientsBtnWidget(
                        active: false,
                        onTap: () {},
                      )
                    : OtherNutrientsBtnWidget(
                        active: true,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AddOtherNutrientswidget());
                        },
                      ),

                const SizedBox(
                  height: 10,
                ),
                context.watch<DropdownIndexCubit>().state.fertilizer ==
                            'Select fertilizer' ||
                        context.watch<DropdownIndexCubit1>().state.fertilizer ==
                            'Select fertilizer'
                    ? Container()
                    : InstructionWidget(),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: CustomButtonWidget(
                    btnTitle: 'Continue',
                    isValid: true,
                    onBtnPress: () {
                      showDialog(
                          context: context,
                          builder: (context) => DisclaimerAlertDialog());
                    },
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
