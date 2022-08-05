import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.notSelected = false,
    this.width,
    this.height,
    this.textStyle,
  }) : super(key: key);

  final String text;
  final Function() onTap;
  final bool notSelected;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? SizeConfig.getProportionalHeight(context, 48),
        decoration: BoxDecoration(
          color: notSelected ? Colors.white : Palette.kPrimaryColor,
          borderRadius: BorderRadius.circular(10.0),
          border: notSelected
              ? Border.all(
                  width: 1.0,
                  color: Palette.kPrimaryColor,
                )
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                color: notSelected ? Palette.kPrimaryColor : Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
