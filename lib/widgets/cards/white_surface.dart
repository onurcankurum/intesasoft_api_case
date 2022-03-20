import 'package:flutter/material.dart';

class WhiteSurface extends StatelessWidget {
 final double elevation;
 final Widget child;
 final bool isBottomCircular;
 const WhiteSurface({Key? key,required this.elevation,required this.child, required this.isBottomCircular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: const Radius.circular(40),bottom: isBottomCircular?const Radius.circular(40):const Radius.circular(0)),
      elevation: elevation,
      child: child,
    );
  }
}