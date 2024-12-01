import 'package:dev_quiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final Color overlayColor;
  final VoidCallback onTap;

  const NextButtonWidget({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.overlayColor,
    required this.onTap,
  });

  const NextButtonWidget.green({
    super.key,
    required this.label,
    required this.onTap,
  })  : backgroundColor = AppColors.darkGreen,
        fontColor = AppColors.white,
        borderColor = AppColors.green,
        overlayColor = AppColors.lightGreen;

  const NextButtonWidget.purple({
    super.key,
    required this.label,
    required this.onTap,
  })  : backgroundColor = AppColors.purple,
        fontColor = AppColors.white,
        borderColor = AppColors.green,
        overlayColor = const Color.fromARGB(255, 174, 155, 217);

  const NextButtonWidget.transparent({
    super.key,
    required this.label,
    required this.onTap,
  })  : backgroundColor = Colors.transparent,
        fontColor = AppColors.grey,
        borderColor = Colors.transparent,
        overlayColor = AppColors.lightGrey;

  const NextButtonWidget.white({
    super.key,
    required this.label,
    required this.onTap,
  })  : backgroundColor = AppColors.white,
        fontColor = AppColors.grey,
        borderColor = AppColors.border,
        overlayColor = AppColors.lightGrey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(
            backgroundColor,
          ),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
          side: WidgetStatePropertyAll(BorderSide(
            color: borderColor,
          )),
          overlayColor: WidgetStatePropertyAll(overlayColor),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
