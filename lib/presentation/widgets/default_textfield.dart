import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.obsecureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.backgroundColor = Palette.kGreyColor,
    this.maxLines = 1,
    this.onFieldSubmitted,
    this.textColor,
  }) : super(key: key);

  final String? hintText;
  final TextEditingController? controller;
  final bool obsecureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final Color backgroundColor;
  final int maxLines;
  final Function(String)? onFieldSubmitted;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        SizeConfig.getProportionalWidth(context, 13),
        0,
        SizeConfig.getProportionalWidth(context, 13),
        0,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        obscureText: obsecureText,
        onFieldSubmitted: onFieldSubmitted,
        maxLines: maxLines,
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) {
          if (value!.isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          return null;
        },
        style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: textColor ?? Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: textColor ??
                  (backgroundColor == Colors.white
                      ? Colors.grey
                      : Colors.black)),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          suffixIcon: suffixIcon ??
              (obsecureText
                  ? GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.visibility,
                        size: 20.0,
                        color: Colors.grey,
                      ),
                    )
                  : null),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 15.0,
            minHeight: 15.0,
          ),
        ),
      ),
    );
  }
}
