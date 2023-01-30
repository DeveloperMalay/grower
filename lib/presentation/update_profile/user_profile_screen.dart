import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grower/heiper/navigator_function.dart';
import 'package:grower/presentation/widgets/custom_textfield_widget.dart';
import '../../theme/custom_theme.dart';
import '../widgets/loading_dialog.dart';
import 'cubit/textfield_focus/textfield_focus_cubit.dart';
import 'cubit/user_details/user_details_cubit.dart';
import 'update_profile_screen.dart';
import 'widget/email_field_widget.dart';
import 'widget/text_field_header_widget.dart';
import '../widgets/custom_appbar_widget.dart';
import '../widgets/custom_small_btn_widget.dart';

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
        body: BlocConsumer<UserDetailsCubit, UserDetailsState>(
          listener: (context, state) {},
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
                        readOnly: true,
                        isfocused:
                            context.read<TextfieldFocusCubit>().state.namefocus,
                        controller: nameController,
                        hinttext: state.userDetails.data.name,
                        ontap: () {},
                        validator: (value) {
                          return null;
                        },
                      ),

                      SizedBox(
                        height: 24,
                      ),
                      TextFieldHeaderWidget(title: 'Mobile Number*'),
                      CustomTextFieldWidget(
                        readOnly: true,
                        isfocused: context
                            .read<TextfieldFocusCubit>()
                            .state
                            .numberfocus,
                        controller: numberController,
                        hinttext: state.userDetails.data.number,
                        inputType: TextInputType.number,
                        ontap: () {},
                        validator: (value) {
                          return null;
                        },
                      ),

                      SizedBox(
                        height: 24,
                      ),
                      TextFieldHeaderWidget(title: 'Email Address*'),
                      EmailFieldWidget(
                          email: state.userDetails.data
                              .email), //widget to show email field
                      SizedBox(
                        height: 24,
                      ),
                      TextFieldHeaderWidget(title: 'Address*'),
                      CustomTextFieldWidget(
                        readOnly: true,
                        isfocused: context
                            .read<TextfieldFocusCubit>()
                            .state
                            .addressfocus,
                        maxline: 3,
                        controller: addressController,
                        hinttext: state.userDetails.data.address,
                        ontap: () {},
                        validator: (value) {
                          return null;
                        },
                      ),

                      SizedBox(
                        height: 44,
                      ),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SmallBtnWidget.whiteBtn(
                                  'Cancel', Colors.transparent),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            InkWell(
                              onTap: () {
                                screenNavigator(
                                    context,
                                    UpdateProfileScreen(
                                        email: state.userDetails.data.email));
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
