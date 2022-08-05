import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';

class RateWidget extends StatelessWidget {
  const RateWidget(
    this.context, {
    Key? key,
    required this.rate,
    required this.text,
  }) : super(key: key);
  final BuildContext context;
  final double rate;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.getProportionalHeight(context, 28.0),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.getProportionalWidth(context, 3.0),
        vertical: SizeConfig.getProportionalHeight(context, 5.0),
      ),
      decoration: BoxDecoration(
        color: Palette.kPrimaryColor,
        borderRadius: BorderRadius.circular(
          SizeConfig.getProportionalWidth(context, 5.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 11, //SizeConfig.getProportionalWidth(context, 11.0),
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: VerticalDivider(
              width: SizeConfig.getProportionalWidth(context, 1.0),
              color: Colors.white.withOpacity(0.42),
              indent: SizeConfig.getProportionalHeight(context, 0.5),
              endIndent: SizeConfig.getProportionalHeight(context, 0.5),
            ),
          ),
          Text(
            rate.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.getProportionalWidth(context, 11.0),
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.white,
            size: SizeConfig.getProportionalWidth(context, 12),
          ),
        ],
      ),
    );
  }
}
