import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grower/heiper/storing_calculation_data.dart';
import 'package:grower/presentation/calculator/calculation_screen/cubit/dropdownIndex1/dropdown_index_cubit1.dart';
import 'package:grower/presentation/calculator/calculation_screen/cubit/other_nutrients/other_nutrients_cubit.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/custom_dropdown.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/custom_dropdown1.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/disclaimer_alert_dialog.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/drop_down1_options_widget.dart';
import 'package:grower/presentation/calculator/calculation_screen/widget/reminder_popup.dart';
import 'package:grower/presentation/calculator/widgets/alert_dialog_widget.dart';
import 'package:grower/presentation/widgets/custom_appbar_widget.dart';
import 'package:grower/presentation/widgets/custom_button_widget.dart';
import '../../../heiper/calculation_function.dart';
import '../../../heiper/calculator_validator.dart';
import '../../../theme/custom_theme.dart';
import '../../update_profile/cubit/user_details/user_details_cubit.dart';
import '../widgets/add_other_nutrients_screen.dart';
import 'cubit/dropdownIndex/dropdown_index_cubit.dart';
import 'cubit/dropdownitem1Click/dropdownitem_click_cubit1.dart';
import 'cubit/dropdownitemClick/dropdownitem_click_cubit.dart';
import 'widget/calculator_textfield_widget.dart';
import '../widgets/dot_header_widget.dart';
import 'widget/drop_down_options_widget.dart';
import 'widget/instruction_widget.dart';
import 'widget/other_nutrients_btn.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({
    super.key,
    this.showpopup = "true",
  });
  final String? showpopup;
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  late TextEditingController poundController;
  late TextEditingController gallonController;
  late TextEditingController densityController;

  @override
  void initState() {
    super.initState();
    context.read<UserDetailsCubit>().userDetails();
    widget.showpopup! == 'true'
        ? Timer(Duration(seconds: 1), () {
            showDialog(
              context: context,
              builder: (context) => ReminderPopUp(),
            );
          })
        : null;
    context.read<OtherNutrientsCubit>().getOtherNutrients();
    poundController = TextEditingController();
    gallonController = TextEditingController();
    densityController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    poundController.dispose();
    gallonController.dispose();
    densityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //chceking if the remainhit has negitive number or 0
    var hitremain = context
            .watch<UserDetailsCubit>()
            .state
            .userDetails
            .data
            .hitRemaining
            .contains('-') ||
        context
            .watch<UserDetailsCubit>()
            .state
            .userDetails
            .data
            .hitRemaining
            .contains('0');

    var otherNutrients = context
        .watch<OtherNutrientsCubit>()
        .state
        .otherNutrients
        .otherNutrients;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: CustomAppbarWidget(
          appbarTitle: 'Calculator',
          isresult: false,
          ontapbackarrow: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialogWidget(
                      content: 'Your calculation will be reset',
                      leftBtnTitle: 'Yes, Exit',
                      title: 'Are you sure you want to reset?',
                      onTap: () async {
                        context.go("/resetloadingscreen");
                        for (var i = 0; i < otherNutrients.length; i++) {
                          deleteText('dryothernutrients${i}');
                          deleteText('liquidothernutrients${i}');
                        }
                      });
                });
          },
        ),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height * .9,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/bgImage.png")),
              color: CustomTheme.bgColor),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 28, right: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  DotHeaderWidget(header: "Dry Fertilizers"), //header with dot
                  const Text('Enter your required amount*',
                      style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 12),
                  CalculatorTextFieldWidget(
                      title: 'pounds',
                      hintText: 'Amount',
                      controller: poundController),
                  const SizedBox(height: 20),
                  const Text('Choose fertilizer*',
                      style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 12),
                  CustomDropDown(onTap: () {
                    context.read<DropdownitemClickCubit>().clickedDropDown();
                  }), //this widget will show dry fertilizer dropdown
                  SizedBox(height: 5),
                  context.watch<DropdownIndexCubit>().state.fertilizer ==
                          'Select fertilizer'
                      ? Container()
                      : DropDownOptionsWidget(), //showing option after selecting
                  const SizedBox(height: 15),
                  context.watch<DropdownIndexCubit>().state.fertilizer ==
                          'Select fertilizer'
                      ? OtherNutrientsBtnWidget(active: false, onTap: () {})
                      : OtherNutrientsBtnWidget(
                          active: true,
                          onTap: () {
                            showDialog(
                                barrierDismissible: !hitremain,
                                context: context,
                                builder: (context) =>
                                    AddOtherNutrientswidget(type: 'dry'));
                          }),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                          color: CustomTheme.primaryColor, thickness: 2)),
                  DotHeaderWidget(
                      header: "Liquid Fertilizers"), //header with dot
                  const Text('Enter your required amount in gallon*',
                      style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 12),
                  CalculatorTextFieldWidget(
                      title: 'gallons',
                      hintText: 'Amount',
                      controller: gallonController),
                  const SizedBox(height: 20),
                  const Text('Enter density of liquid*',
                      style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 12),
                  CalculatorTextFieldWidget(
                      title: 'd(lbs/g)',
                      hintText: 'Density',
                      controller: densityController),
                  const SizedBox(height: 20),
                  const Text('Choose fertilizer*',
                      style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 12),
                  CustomDropDown1(onTap: () {
                    context.read<DropdownitemClickCubit1>().clickedDropDown();
                  }), //this widget will show liquid fertilizer dropdown
                  SizedBox(height: 5),
                  context.watch<DropdownIndexCubit1>().state.fertilizer ==
                          'Select fertilizer'
                      ? Container()
                      : DropDown1OptionsWidget(), //showing options after seleting 2nd dropdown
                  const SizedBox(height: 15),
                  context.watch<DropdownIndexCubit1>().state.fertilizer ==
                          'Select fertilizer'
                      ? OtherNutrientsBtnWidget(active: false, onTap: () {})
                      : OtherNutrientsBtnWidget(
                          active: true,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AddOtherNutrientswidget(
                                      type: 'liquid',
                                    ));
                          }),
                  const SizedBox(height: 10),
                  context.watch<DropdownIndexCubit>().state.fertilizer ==
                              'Select fertilizer' ||
                          context
                                  .watch<DropdownIndexCubit1>()
                                  .state
                                  .fertilizer ==
                              'Select fertilizer'
                      ? Container()
                      : InstructionWidget(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30, top: 20),
                    child: CustomButtonWidget(
                        btnTitle: 'Continue',
                        isValid: checkCalculatorValidation(
                                context,
                                poundController,
                                gallonController,
                                densityController) //checking if all the fields are filled or not
                            ? false
                            : true,
                        onBtnPress: () {
                          checkCalculatorValidation(context, poundController,
                                  gallonController, densityController)
                              ? showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Please fill all the fields',
                                          style: TextStyle(
                                              color: CustomTheme.redErrorColor),
                                        ),
                                      ),
                                    );
                                  })
                              : showDialog(
                                  context: context,
                                  builder: (context) =>
                                      DisclaimerAlertDialog());
                          saveString('dryweight',
                              poundController.text); //storing drywright data
                          saveString('liquidweight',
                              gallonController.text); //storing liquid data
                          saveString('density',
                              densityController.text); //storing density data
                          calculate(poundController.text, gallonController.text,
                              densityController.text);
                        }),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
