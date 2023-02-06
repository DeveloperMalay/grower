import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grower/heiper/navigator_function.dart';
import 'package:grower/presentation/calculator/calculation_screen/calculator_screen.dart';
import 'package:grower/presentation/update_profile/cubit/user_details/user_details_cubit.dart';
import 'package:grower/presentation/update_profile/cubit/valid_number/valid_number_cubit.dart';
import 'package:grower/presentation/update_profile/widget/error_text_widget.dart';
import 'package:grower/presentation/widgets/custom_textfield_widget.dart';
import '../../theme/custom_theme.dart';
import '../calculator/calculation_screen/cubit/reminder/reminder_cubit.dart';
import '../calculator/widgets/alert_dialog_widget.dart';
import '../widgets/custom_appbar_widget.dart';
import '../widgets/custom_small_btn_widget.dart';
import '../widgets/error_diolog.dart';
import '../widgets/success_popup_widget.dart';
import 'cubit/not_empty_string_validator/not_empty_str_validator_cubit.dart';
import 'cubit/textfield_click/textfield_click_cubit.dart';
import 'cubit/textfield_focus/textfield_focus_cubit.dart';
import 'cubit/update_profile/update_profile_cubit.dart';
import 'widget/email_field_widget.dart';
import 'widget/form_validator_function.dart';
import 'widget/text_field_header_widget.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({
    super.key,
  });

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController numberController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    numberController = TextEditingController();
    addressController = TextEditingController();
    context.read<UserDetailsCubit>().userDetails();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    numberController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).viewInsets);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppbarWidget(
          appbarTitle: 'User Profile',
          isresult: false,
          ontapbackarrow: () {
            Navigator.pop(context);
          },
        ),
        body: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, state) {
            if (state.status == UpdateProfileStatus.error) {
              errorDialog(context, state.error.errMsg);
            }
            if (state.status == UpdateProfileStatus.loaded) {
              Timer(Duration(seconds: 2), () {
                print('run');
                screenReplaceNavigator(context, CalculatorScreen());
              });
              showDialog(
                  context: context,
                  builder: (context) {
                    return SuccessPopUpWidget(
                      title: 'Your profile successfully\n updated!',
                    );
                  });
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 30,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
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
                      Center(
                        child: Image.asset(
                          'assets/profile.png',
                          height: 35,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text('User Profile'),
                      ),
                      SizedBox(
                        height: 44,
                      ),
                      TextFieldHeaderWidget(title: 'Name*'),
                      CustomTextFieldWidget(
                        isfocused:
                            context.read<TextfieldFocusCubit>().state.namefocus,
                        controller: nameController,
                        hinttext: context
                                .read<UserDetailsCubit>()
                                .state
                                .userDetails
                                .data
                                .name
                                .isEmpty
                            ? "Enter your name"
                            : context
                                .read<UserDetailsCubit>()
                                .state
                                .userDetails
                                .data
                                .name,
                        ontap: () {
                          context
                              .read<TextfieldClickCubit>()
                              .emailtextfieldClick();
                          context.read<TextfieldFocusCubit>().focusName();
                          shouldUpdate(context);
                        },
                        validator: (value) {
                          return null;
                        },
                      ),
                      context.watch<NotEtyStrValidatorCubit>().state.validname
                          ? Container()
                          : ErrorTextWidget(
                              errorText:
                                  "Please fill the above required field!"),
                      SizedBox(
                        height: 24,
                      ),
                      TextFieldHeaderWidget(title: 'Mobile Number*'),
                      CustomTextFieldWidget(
                        isfocused: context
                            .read<TextfieldFocusCubit>()
                            .state
                            .numberfocus,
                        controller: numberController,
                        hinttext: context
                                .read<UserDetailsCubit>()
                                .state
                                .userDetails
                                .data
                                .number
                                .isEmpty
                            ? 'Enter your mobile number'
                            : context
                                .read<UserDetailsCubit>()
                                .state
                                .userDetails
                                .data
                                .number,
                        inputType: TextInputType.number,
                        ontap: () {
                          context
                              .read<TextfieldClickCubit>()
                              .numbertextfieldClick();
                          context.read<TextfieldFocusCubit>().focusNumber();
                        },
                        validator: (value) {
                          return null;
                        },
                      ),
                      context.watch<ValidNumberCubit>().state.validphone
                          ? Container()
                          : ErrorTextWidget(
                              errorText: "Please enter a valid mobile number!"),
                      SizedBox(
                        height: 24,
                      ),
                      TextFieldHeaderWidget(title: 'Email*'),
                      EmailFieldWidget(
                          email: context
                              .watch<UserDetailsCubit>()
                              .state
                              .userDetails
                              .data
                              .email), //widget to show email field
                      SizedBox(
                        height: 24,
                      ),
                      TextFieldHeaderWidget(title: 'Address*'),
                      CustomTextFieldWidget(
                        isfocused: context
                            .read<TextfieldFocusCubit>()
                            .state
                            .addressfocus,
                        maxline: 3,
                        controller: addressController,
                        hinttext: context
                                .read<UserDetailsCubit>()
                                .state
                                .userDetails
                                .data
                                .address
                                .isEmpty
                            ? 'Enter your Address'
                            : context
                                .read<UserDetailsCubit>()
                                .state
                                .userDetails
                                .data
                                .address,
                        ontap: () {
                          context
                              .read<TextfieldClickCubit>()
                              .addresstextfieldClick();
                          context.read<TextfieldFocusCubit>().focusAddress();
                        },
                        validator: (value) {
                          return null;
                        },
                      ),
                      context
                              .watch<NotEtyStrValidatorCubit>()
                              .state
                              .validaddress
                          ? Container()
                          : ErrorTextWidget(
                              errorText:
                                  "Please fill the above required field!"),
                      SizedBox(
                        height: 44,
                      ),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialogWidget(
                                          title:
                                              'Are you sure you want to cancel?',
                                          content:
                                              'Your profile is not updated!',
                                          leftBtnTitle: 'Yes, Exit',
                                          onTap: () {
                                            Navigator.pop(context);
                                            context.push('/calculator');
                                            context
                                                .read<NotEtyStrValidatorCubit>()
                                                .getInitialState();
                                            context
                                                .read<ValidNumberCubit>()
                                                .getinitialState();
                                            nameController.clear();
                                            numberController.clear();
                                            addressController.clear();
                                          },
                                        ));
                              },
                              child: SmallBtnWidget.whiteBtn(
                                  'Cancel', Colors.transparent),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  validateForm(
                                      context,
                                      nameController.text,
                                      numberController.text,
                                      addressController
                                          .text); //function to check if the form is valid or not
                                  shouldUpdate(context)
                                      ? context
                                          .read<UpdateProfileCubit>()
                                          .userDetailsUpdate(
                                              nameController.text,
                                              addressController.text,
                                              numberController.text)
                                      : null;
                                  shouldUpdate(context)
                                      ? context
                                          .read<ReminderCubit>()
                                          .hitreduce()
                                      : null;
                                }
                              },
                              child: SmallBtnWidget.filledColorBtn(
                                  'Update', clickanyField(context)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
