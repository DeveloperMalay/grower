import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grower/utils/const.dart';

class AddOtherNutrientswidget extends StatelessWidget {
  const AddOtherNutrientswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
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
            AlertDialog(
              contentPadding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              content: Container(
                  width: 342.w,
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'A',
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          ),
                          Text(
                            '15',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Boron(B)',
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          ),
                          Text(
                            '15',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Calcium(Ca)',
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          ),
                          Text(
                            '15',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'D',
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          ),
                          Text(
                            '15',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'E',
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          ),
                          Text(
                            '15',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
                  )),
            ),
            AlertDialog(
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
                      style: TextStyle(color: primaryColor, fontSize: 16),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
