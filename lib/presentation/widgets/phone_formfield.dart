import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';

import '../../data/models/country_model.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    Key? key,
    required this.initialValue,
    required this.countries,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  final Country initialValue;
  final List<Country> countries;
  final Function(Country?)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.getProportionalWidth(context, 13.0),
      ),
      decoration: BoxDecoration(
        color: Palette.kGreyColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          SizedBox(
            width: SizeConfig.getProportionalWidth(context, 43.0),
            height: SizeConfig.getProportionalHeight(context, 24.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                iconSize: 22.0,
                value: initialValue,
                menuMaxHeight: 120.0,
                onChanged: onChanged,
                items: countries
                    .asMap()
                    .map((index, value) => MapEntry(
                          index,
                          DropdownMenuItem(
                            value: value,
                            child: Image.asset(
                              value.flag,
                              width: SizeConfig.getProportionalWidth(
                                context,
                                24.0,
                              ),
                            ),
                          ),
                        ))
                    .values
                    .toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.getProportionalWidth(context, 10.0),
            ),
            child: const VerticalDivider(
              width: 2.0,
              color: Palette.kPrimaryColor,
            ),
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: controller,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1.0,
                  ),
                ),
                hintText: 'أدخل رقم الجوال',
                hintStyle: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'هذا الحقل مطلوب';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
