import 'package:flutter/material.dart';

class ScreenElementAppearAnimation2 extends StatefulWidget {
  @override
  _ScreenElementAppearAnimation2State createState() =>
      _ScreenElementAppearAnimation2State();
}

class _ScreenElementAppearAnimation2State
    extends State<ScreenElementAppearAnimation2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
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
        height: 150,
        width: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: const CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 50,
          backgroundImage: AssetImage('assets/harvest.png'),
        ),
      ),
    );
  }
}
