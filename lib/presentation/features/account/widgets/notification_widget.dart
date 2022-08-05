import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';

class NotificationItem extends StatelessWidget {
  final String notification;
  const NotificationItem(this.notification, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.getProportionalHeight(context, 17.0),
        horizontal: SizeConfig.getProportionalHeight(context, 20.0),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Palette.kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/images/notification.png'),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification,
                  maxLines: 2,
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'منذ 10 دقائق',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
