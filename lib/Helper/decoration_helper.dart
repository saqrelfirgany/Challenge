import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetShadow extends StatelessWidget {
  const GetShadow({
    Key? key,
    required this.child,
    this.radius = 16,
    this.elevation = 1,
    this.color = Colors.white,
  }) : super(key: key);
  final Widget child;
  final double radius;
  final double elevation;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: color,
      elevation: elevation,
      borderRadius: BorderRadius.circular(radius.r),
      child: child,
    );
  }
}

BoxDecoration decorationRadius({Color color = Colors.white,double radius = 8}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius.r),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        offset: const Offset(0, 0),
        blurRadius: 4.0,
      )
    ],
  );
}

BoxDecoration decorationRadiusBorder({
  Color borderColor = const Color(0xFFDFDFDF),
  double borderWidth = 1,
  Color color = Colors.white,
}) {
  return decorationRadius(color: color).copyWith(
    border: Border.all(width: borderWidth, color: borderColor),
  );
}

BoxDecoration decorationDoubleRadiusBorder({
  Color color = const Color(0xFFDFDFDF),
}) {
  return decorationRadiusBorder(color: color).copyWith(
    borderRadius: BorderRadius.circular(20.r),
  );
}

BoxDecoration decorationDoubleRadius() {
  return decorationRadius().copyWith(
    borderRadius: BorderRadius.circular(20.r),
  );
}

BoxDecoration decorationDoubleRadiusTop() {
  return decorationDoubleRadius().copyWith(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30.r),
      topRight: Radius.circular(30.r),
    ),
  );
}

BoxDecoration decorationDoubleRadiusNoShad() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.r),
  );
}
