import 'dart:math';
import 'package:flutter/material.dart';

class ExplicitWidget extends StatefulWidget {
  const ExplicitWidget({Key? key}) : super(key: key);

  @override
  State<ExplicitWidget> createState() => _ExplicitWidgetState();
}

class _ExplicitWidgetState extends State<ExplicitWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1.5, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
          position: offsetAnimation,
          child: Image(
            image: AssetImage('assets/stone.png'),
            width: 150,
          )),
    );
  }
}

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
// }



