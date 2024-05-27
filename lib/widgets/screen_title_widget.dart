import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  final String headerText; 
  const ScreenHeader({super.key, required this.headerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
           Positioned(
            left: 17,
            top: 15,
            child: Text(
              headerText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w900,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(1.57),
              child: Container(
                width: 30,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 20,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFCC0000),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}