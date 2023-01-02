import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import '../../utils/const.dart';
import '../calculator/calculation_screen/widget/calculator_bottom_model_sheet.dart';
import '../calculator/widgets/alert_dialog_widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).viewInsets);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: Container(
            height: 34,
            width: 250,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: greylight,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/grower_logo.png',
                  height: 30,
                ),
                Text(
                  'Update Profile',
                  style: TextStyle(color: primaryColor, fontSize: 14),
                )
              ],
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return CalculatorBottomModelSheet();
                    });
              },
              child: SvgPicture.asset(
                'assets/menu.svg',
              ),
            )
          ],
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * .9,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 30,
                ),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/bgImage.png",
                    ),
                  ),
                  color: bgColor,
                ),
                child: Stack(
                  children: [
                    Column(
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
                        TextFormField(
                          cursorColor: primaryColor,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2),
                            ),
                            hintText: 'Enter your name',
                          ),
                          onTap: () {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please fill the above required field!";
                            }
                            return null;
                          },
                          onChanged: (value) {},
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
                        TextFormField(
                          cursorColor: primaryColor,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2),
                            ),
                            hintText: 'Enter your mobile number',
                          ),
                          onTap: () {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a valid mobile number!";
                            } else if (value.length != 10) {
                              return "Please enter a valid mobile number!";
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text('Email Address'),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          cursorColor: primaryColor,
                          readOnly: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: greylight,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: 'abc@gmail.com',
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
                        TextFormField(
                          cursorColor: primaryColor,
                          maxLines: 3,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2),
                            ),
                            hintText: 'Enter your Address',
                          ),
                          onTap: () {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please fill the above required field!";
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 44,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialogWidget(
                                          title: 'Are you want to cancel?',
                                          content:
                                              'You profile is not updated!',
                                          leftBtnTitle: 'Yes, Exit',
                                        ));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: primaryColor)),
                                child: Center(
                                  child: Text('Cancel',
                                      style: TextStyle(
                                          color: primaryColor, fontSize: 14)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Lottie.asset(
                                                'assets/green_tick.json',
                                                repeat: true,
                                                reverse: true,
                                                animate: true,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                  'Your profile successfuly updated!'),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                }
                              },
                              child: Container(
                                width: 130,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: primaryColor),
                                ),
                                child: const Center(
                                  child: Text('Update',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
