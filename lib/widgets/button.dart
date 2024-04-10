import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double? width;
  final Color? backgroundColor;
  final Color? color;
  final String? buttonText;
  final IconData? icon;
  final Color? borderColor;
  final bool isResponsive;

  const Button({
    Key? key,
    this.width,
    this.backgroundColor,
    this.color,
    this.buttonText,
    this.icon,
    this.borderColor,
    this.isResponsive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor ?? Colors.blue, // Use default color if not provided
        border: Border.all(color: borderColor ?? Colors.transparent), // Use default border color if not provided
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, color: color ?? Colors.white), // Only show icon if provided
            if (buttonText != null) SizedBox(width: icon != null ? 5 : 0), // Add spacing if both icon and text are provided
            if (buttonText != null)
              Text(
                buttonText!,
                style: TextStyle(color: color ?? Colors.white),
              ), // Show text only if provided
          ],
        ),
      ),
    );
  }
}