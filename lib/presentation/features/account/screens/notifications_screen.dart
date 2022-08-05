import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/data/data.dart';
import 'package:student_app/presentation/features/account/widgets/dismissible_widget.dart';
import 'package:student_app/presentation/features/account/widgets/notification_widget.dart';

class NotificationsScreen extends StatefulWidget {
  static const String routeName = '/Notifications';
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.kPrimaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'الإشعارات',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.getProportionalWidth(context, 16.0)),
          child: Container(
            width: SizeConfig.getProportionalWidth(context, 35.0),
            height: SizeConfig.getProportionalHeight(context, 35.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.3),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: SizeConfig.getProportionalHeight(context, 40.0),
            ),
            Container(
              width: double.infinity,
              height: SizeConfig.getProportionalHeight(context, 676.0),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.getProportionalWidth(context, 16.0),
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24.0),
                ),
                color: Color(0xFFFEFEFF),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: notifications.isNotEmpty
                    ? ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          vertical:
                              SizeConfig.getProportionalHeight(context, 25.0),
                        ),
                        itemBuilder: (context, index) {
                          var notification = notifications[index];
                          return DismissibleWidget(
                            child: NotificationItem(notification),
                            onDismissed: (direction) {
                              setState(() {
                                notifications.removeAt(index);
                              });
                            },
                          );
                        },
                        separatorBuilder: (context, _) => SizedBox(
                          height:
                              SizeConfig.getProportionalHeight(context, 16.0),
                        ),
                        itemCount: notifications.length,
                      )
                    : const Center(child: Text('لا توجد إشعارات جديدة')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
