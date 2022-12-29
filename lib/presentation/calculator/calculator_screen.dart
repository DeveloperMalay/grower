import 'package:flutter/material.dart';
import 'package:grower/utils/const.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [Image.asset('assets/menu.png')],
      ),
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height * .9,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/bgImage.png"),
          ),
          color: bgColor,
        ),
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
                  " Dry Fertilizers",
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
                          style: TextStyle(color: primaryColor, fontSize: 14),
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
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none)),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
