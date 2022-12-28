import 'package:flutter/material.dart';
import 'package:grower/utils/const.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/signup_screenbg.png"),
            ),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              const Text(
                'Welcome to',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Positioned(
                top: 40,
                child: Text(
                  "Grower’s Secret Calculator",
                  style: TextStyle(color: primaryColor, fontSize: 20),
                ),
              ),
              Positioned(
                  top: 100,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    child: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 50,
                      backgroundImage: AssetImage('assets/truck.png'),
                    ),
                  )),
              Positioned(
                  top: 300,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    child: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 50,
                      backgroundImage: AssetImage('assets/harvest.png'),
                    ),
                  )),
              const Positioned(
                  bottom: 50,
                  child: Text(
                    "Let's",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
              Positioned(
                bottom: 30,
                child: Text(
                  "Get Started!",
                  style: TextStyle(color: primaryColor, fontSize: 20),
                ),
              ),
              Positioned(
                bottom: 70,
                left: 51,
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
