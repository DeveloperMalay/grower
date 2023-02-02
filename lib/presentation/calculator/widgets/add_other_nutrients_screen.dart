import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/custom_theme.dart';
import '../calculation_screen/cubit/other_nutrients/other_nutrients_cubit.dart';

// ignore: must_be_immutable
class AddOtherNutrientswidget extends StatelessWidget {
  AddOtherNutrientswidget({super.key});
  TextEditingController controller = TextEditingController();
  List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController()
  ];
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Stack(
        children: [
          Positioned(
            top: 245,
            left: 0,
            right: 0,
            child: AlertDialog(
              contentPadding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              content: Container(
                height: 30,
                width: 342.w,
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Add your other nutrients in (%)',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          ),
          Positioned(
            top: 290,
            left: 0,
            right: 0,
            child: AlertDialog(
              contentPadding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              content: Container(
                width: 342,
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 60 *
                      context
                          .read<OtherNutrientsCubit>()
                          .state
                          .otherNutrients
                          .otherNutrients
                          .length
                          .toDouble(),
                  child: ListView.builder(
                      itemCount: context
                          .read<OtherNutrientsCubit>()
                          .state
                          .otherNutrients
                          .otherNutrients
                          .length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Text(
                                //   context
                                //       .watch<OtherNutrientsCubit>()
                                //       .state
                                //       .otherNutrients
                                //       .otherNutrients[index]
                                //       .name,
                                //   style: TextStyle(
                                //       color: CustomTheme.primaryColor,
                                //       fontSize: 16),
                                // ),

                                Expanded(
                                  child: SizedBox(
                                    width: 100,
                                    child: TextFormField(
                                      controller: _controllers[index],
                                      textAlign: TextAlign.right,
                                      cursorColor: CustomTheme.primaryColor,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              bottom: 0, top: 25, right: 10),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: CustomTheme
                                                      .primaryColor)),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0),
                                            child: Text(
                                              context
                                                  .watch<OtherNutrientsCubit>()
                                                  .state
                                                  .otherNutrients
                                                  .otherNutrients[index]
                                                  .name,
                                              style: TextStyle(
                                                  color:
                                                      CustomTheme.primaryColor,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          hintText: '0'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Divider(
                            //   color: Colors.grey,
                            // ),
                          ],
                        );
                      }),
                ),
              ),
            ),
          ),
          Positioned(
            top: 530,
            left: 0,
            right: 0,
            child: AlertDialog(
              contentPadding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              content: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 150.w,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          color: CustomTheme.primaryColor, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
