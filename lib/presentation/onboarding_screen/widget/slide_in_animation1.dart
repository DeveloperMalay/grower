import 'package:flutter/material.dart';

class ScreenElementAppearAnimation1 extends StatefulWidget {
  @override
  _ScreenElementAppearAnimation1State createState() =>
      _ScreenElementAppearAnimation1State();
}

class _ScreenElementAppearAnimation1State
    extends State<ScreenElementAppearAnimation1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 10),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacityAnimation.value,
      duration: Duration(seconds: 1),
      child: Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: const CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 50,
          backgroundImage: AssetImage('assets/truck.png'),
        ),
      ),
    );
  }
}
