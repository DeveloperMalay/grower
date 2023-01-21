import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grower/presentation/widgets/custom_textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme/custom_theme.dart';
import '../calculator/widgets/alert_dialog_widget.dart';
import '../widgets/custom_appbar_widget.dart';
import '../widgets/custom_small_btn_widget.dart';
import '../widgets/error_diolog.dart';
import '../widgets/loading_dialog.dart';
import '../widgets/success_popup_widget.dart';
import 'cubit/update_profile/update_profile_cubit.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key, required this.email});
  final String email;
  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
          appbarTitle: 'Update Profile',
          isresult: false,
        ),
        body: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, state) {
            if (state.status == UpdateProfileStatus.error) {
              errorDialog(context, state.error.errMsg);
            }
            // if (state.status == UpdateProfileStatus.loading) {
            //   return loadingDialog(context);
            // } else {
            //   showDialog(
            //       context: context,
            //       builder: (context) {
            //         return SuccessPopUpWidget(
            //           title: 'Your profile successfully updated!',
            //         );
            //       });
            // }
            if (state.status == UpdateProfileStatus.loaded) {
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
                    left: 30,
                    right: 30,
                    top: 30,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
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
                        child: SvgPicture.asset(
                          'assets/profile.svg',
                          height: 35,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text('Update Profile'),
                      ),
                      SizedBox(
                        height: 44,
                      ),
                      const Text(
                        'Name*',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextFieldWidget(
                        controller: nameController,
                        hinttext: 'Enter your name',
                        ontap: () {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill the above required field!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'Mobile Number*',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextFieldWidget(
                        controller: numberController,
                        hinttext: 'Enter your mobile number',
                        inputType: TextInputType.number,
                        ontap: () {},
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length != 10) {
                            return "Please enter a valid mobile number!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text('Email Address'),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        cursorColor: CustomTheme.primaryColor,
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: CustomTheme.greylight,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          hintText: widget.email,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'Address*',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextFieldWidget(
                        maxline: 3,
                        controller: addressController,
                        hinttext: 'Enter your Address',
                        ontap: () {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill the above required field!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 44,
                      ),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        ));
                              },
                              child: SmallBtnWidget.whiteBtn(
                                  'Cencel', Colors.transparent),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<UpdateProfileCubit>()
                                      .userDetailsUpdate(
                                          nameController.text,
                                          addressController.text,
                                          numberController.text);
                                  nameController.clear();
                                  addressController.clear();
                                  numberController.clear();
                                }
                              },
                              child: SmallBtnWidget.filledColorBtn('Update'),
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
