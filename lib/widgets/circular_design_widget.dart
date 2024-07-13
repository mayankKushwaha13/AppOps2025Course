import 'package:flutter/material.dart';
import 'package:sabjiwallah/constants/colors.dart';

class CircularDesignWidget extends StatelessWidget {
  const CircularDesignWidget(
      {super.key,
      required this.radius,
      this.x = 0,
      this.y = 0,
      this.z = 0,
      this.opacity = 0.1,
      this.color = MyColors.antiFlashWhite
      });
  final double radius;
  final double x, y, z;
  final double opacity;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      transform: Matrix4.translationValues(x, y, z),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color.withOpacity(opacity)
      ),
    );
  }
}
