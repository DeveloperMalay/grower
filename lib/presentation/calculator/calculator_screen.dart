import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grower/utils/const.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  void showPopUp() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/avatar.svg'),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    '5 Hits Left!',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Update your profile for unlimited use.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: primaryColor)),
                        child: Center(
                          child: Text('Skip',
                              style: TextStyle(color: primaryColor)),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 120,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: primaryColor)),
                        child: const Center(
                          child: Text('Update ',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   showPopUp();
    // });
  }

  bool isdropdownClicked = false;
  bool isdropdownClicked1 = false;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
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
                  'Calculator',
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
                      return ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          height: 180,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                  ),
                                  child: Text(
                                    "More Options",
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 16),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          title: const Text('Are you sure?'),
                                          content: const Text(
                                            'You are going to Exit Calculator.',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 20),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10,
                                                        horizontal: 30),
                                                    width: 120,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        border: Border.all(
                                                            color:
                                                                primaryColor)),
                                                    child: Center(
                                                      child: Text('Yes, Exit',
                                                          style: TextStyle(
                                                              color:
                                                                  primaryColor)),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    width: 120,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 20),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10,
                                                        horizontal: 30),
                                                    decoration: BoxDecoration(
                                                        color: primaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        border: Border.all(
                                                            color:
                                                                primaryColor)),
                                                    child: const Center(
                                                      child: Text('No, Wait',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Exit calculator',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          title: const Text('Are you sure?'),
                                          content: const Text(
                                            'You are going to logout Calculator.',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 20),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10,
                                                        horizontal: 20),
                                                    width: 120,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        border: Border.all(
                                                            color:
                                                                primaryColor)),
                                                    child: Center(
                                                      child: Text('Yes, Logout',
                                                          style: TextStyle(
                                                              color:
                                                                  primaryColor)),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    width: 120,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 20),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10,
                                                        horizontal: 30),
                                                    decoration: BoxDecoration(
                                                        color: primaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        border: Border.all(
                                                            color:
                                                                primaryColor)),
                                                    child: const Center(
                                                      child: Text('No, Wait',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Log Out',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      );
                    });
              },
              child: SvgPicture.asset(
                'assets/menu.svg',
                // height: 30,
              ),
            )
          ],
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
            color: bgColor,
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
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Text(
                      "Dry Fertilizers",
                      style: TextStyle(
                          color: primaryColor,
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
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 54,
                      width: 95,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 0.5),
                              blurRadius: 0.05,
                              spreadRadius: 0.05,
                            ),
                          ]),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'pounds',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 14),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 3),
                              height: 2,
                              width: 50,
                              decoration: BoxDecoration(color: primaryColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 225,
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
                      child: TextFormField(
                        cursorColor: primaryColor,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 14.0, right: 5),
                              child: Text(
                                'Amount',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    )
                  ],
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
                    setState(
                      () {
                        isdropdownClicked = !isdropdownClicked;
                      },
                    );
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
                        isdropdownClicked
                            ? Icon(
                                Icons.expand_more_outlined,
                                color: primaryColor,
                                size: 30,
                              )
                            : Icon(
                                Icons.arrow_forward_ios,
                                color: primaryColor,
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Select fertilizer',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                isdropdownClicked
                    ? Column(
                        children: [
                          Container(
                            height: 54,
                            width: 342,
                            padding: const EdgeInsets.only(top: 17, left: 33),
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(color: greylight)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 0.5),
                                    blurRadius: 0.03,
                                    spreadRadius: 0.03,
                                  ),
                                ]),
                            child: const Text(
                              'Granules 8-3-1',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          Container(
                            height: 54,
                            width: 342,
                            padding: const EdgeInsets.only(top: 17, left: 33),
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(color: greylight)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 0.5),
                                    blurRadius: 0.03,
                                    spreadRadius: 0.03,
                                  ),
                                ]),
                            child: const Text(
                              'Nitrogen 16-0-0',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          Container(
                            height: 54,
                            width: 342,
                            padding: const EdgeInsets.only(top: 17, left: 33),
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(color: greylight)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 0.5),
                                    blurRadius: 0.03,
                                    spreadRadius: 0.03,
                                  ),
                                ]),
                            child: const Text(
                              'Phosphorus Fertilizer 0-9-0',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          Container(
                            height: 54,
                            width: 342,
                            padding: const EdgeInsets.only(top: 17, left: 33),
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(color: greylight)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 0.5),
                                    blurRadius: 0.03,
                                    spreadRadius: 0.03,
                                  ),
                                ]),
                            child: const Text(
                              'Seaweed Powder Soluble 0-0-16',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          Container(
                            height: 54,
                            width: 342,
                            padding: const EdgeInsets.only(top: 17, left: 33),
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(color: greylight)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 0.5),
                                    blurRadius: 0.03,
                                    spreadRadius: 0.03,
                                  ),
                                ]),
                            child: const Text(
                              'Soluble Corn Steep Powder 7-6-4',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          Container(
                            height: 54,
                            width: 342,
                            padding: const EdgeInsets.only(top: 17, left: 33),
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
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
                            child: const Text(
                              'Other',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 24,
                  width: 117,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: seconderyColor),
                  child: const Center(
                      child: Text(
                    'Other nutrients',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Divider(
                  color: primaryColor,
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
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Liquid Fertilizers",
                      style: TextStyle(
                          color: primaryColor,
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
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 54,
                      width: 95,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 0.5),
                              blurRadius: 0.05,
                              spreadRadius: 0.05,
                            ),
                          ]),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'gallons',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 14),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 3),
                              height: 2,
                              width: 50,
                              decoration: BoxDecoration(color: primaryColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 225,
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
                      child: TextFormField(
                        cursorColor: primaryColor,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 14.0, right: 5),
                              child: Text(
                                'Amount',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    )
                  ],
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
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 54,
                      width: 95,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 0.5),
                              blurRadius: 0.05,
                              spreadRadius: 0.05,
                            ),
                          ]),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'd(lbs/g)',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 14),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 3),
                              height: 2,
                              width: 50,
                              decoration: BoxDecoration(color: primaryColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 225,
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
                      child: TextFormField(
                        cursorColor: primaryColor,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 14.0, right: 5),
                              child: Text(
                                'Density',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  ],
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
                    setState(
                      () {
                        isdropdownClicked1 = !isdropdownClicked1;
                      },
                    );
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
                        isdropdownClicked1
                            ? Icon(
                                Icons.expand_more_outlined,
                                color: primaryColor,
                                size: 30,
                              )
                            : Icon(
                                Icons.arrow_forward_ios,
                                color: primaryColor,
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Select fertilizer',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                isdropdownClicked1
                    ? Column(
                        children: [
                          Container(
                            height: 54,
                            width: 342,
                            padding: const EdgeInsets.only(top: 17, left: 33),
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(color: greylight)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 0.5),
                                    blurRadius: 0.03,
                                    spreadRadius: 0.03,
                                  ),
                                ]),
                            child: const Text(
                              'Water',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          Container(
                            height: 54,
                            width: 342,
                            padding: const EdgeInsets.only(top: 17, left: 33),
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(color: greylight)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 0.5),
                                    blurRadius: 0.03,
                                    spreadRadius: 0.03,
                                  ),
                                ]),
                            child: const Text(
                              "Grower's Secret Professional",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          Container(
                            height: 54,
                            width: 342,
                            padding: const EdgeInsets.only(top: 17, left: 33),
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(color: greylight)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 0.5),
                                    blurRadius: 0.03,
                                    spreadRadius: 0.03,
                                  ),
                                ]),
                            child: const Text(
                              "Grower's Secret Microbes",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          Container(
                            height: 54,
                            width: 342,
                            padding: const EdgeInsets.only(top: 17, left: 33),
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(color: greylight)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 0.5),
                                    blurRadius: 0.03,
                                    spreadRadius: 0.03,
                                  ),
                                ]),
                            child: const Text(
                              'Liquid Nitrogen 8-0-0',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          Container(
                            height: 54,
                            width: 342,
                            padding: const EdgeInsets.only(top: 17, left: 33),
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
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
                            child: const Text(
                              'Other',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 24,
                  width: 117,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: seconderyColor),
                  child: const Center(
                      child: Text(
                    'Other nutrients',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 17.w, vertical: 40),
                      height: 50,
                      width: 280.w,
                      decoration: BoxDecoration(
                          color: primaryColor,
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
