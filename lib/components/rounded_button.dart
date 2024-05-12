import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.value,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.textColor,
    required this.backgroundColor,
    this.onPressed,
  });

  final Text value;
  final double width, height, borderRadius;
  final Color textColor, backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: Size(width, height),
      ),
      child: value,
    );
  }
}
