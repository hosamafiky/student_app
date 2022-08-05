import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/presentation/screens/screens.dart';
import 'package:student_app/presentation/widgets/default_button.dart';

class PaymentDetailsScreen extends StatefulWidget {
  static const String routeName = '/payment-details';
  const PaymentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  int chosenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Palette.kPrimaryColor,
        appBar: AppBar(
            backgroundColor: Palette.kPrimaryColor,
            elevation: 0.0,
            title: const Text(
              'تحويل بنكي',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: [
              Container(
                margin: EdgeInsets.only(
                  left: SizeConfig.getProportionalWidth(context, 16.0),
                  top: SizeConfig.getProportionalHeight(context, 8.0),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.3),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ]),
        body: Column(
          children: [
            SizedBox(
              height: SizeConfig.getProportionalHeight(context, 14.0),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(
                  SizeConfig.getProportionalWidth(context, 16.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                        SizeConfig.getProportionalWidth(context, 24.0)),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildPaymentMethodItem(
                      index: 0,
                      title: 'البنك الأهلي',
                      imageUrl: 'assets/images/alahli.png',
                    ),
                    _buildPaymentMethodItem(
                      index: 1,
                      title: 'بنك سامبا',
                      imageUrl: 'assets/images/samba.png',
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 40.0),
                    ),
                    DefaultButton(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          TransferScreen.routeName,
                        );
                      },
                      text: 'التالي',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodItem({
    required String title,
    required String imageUrl,
    required int index,
  }) {
    return InkWell(
      onTap: () => setState(() {
        chosenIndex = index;
      }),
      child: Container(
        width: double.infinity,
        height: SizeConfig.getProportionalHeight(context, 114.0),
        margin: EdgeInsets.symmetric(
          vertical: SizeConfig.getProportionalHeight(context, 8.0),
        ),
        padding: EdgeInsets.all(
          SizeConfig.getProportionalHeight(context, 16.0),
        ),
        decoration: BoxDecoration(
          color: Palette.kGreyColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: chosenIndex == index
                ? Palette.kPrimaryColor
                : Colors.transparent,
            width: 1.0,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  imageUrl,
                  width: SizeConfig.getProportionalWidth(context, 36.0),
                  height: SizeConfig.getProportionalHeight(context, 36.0),
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: SizeConfig.getProportionalWidth(context, 16.0),
                ),
                Text(title, style: const TextStyle(fontSize: 14.0)),
                const Spacer(),
                Image.asset(
                  index == chosenIndex
                      ? 'assets/images/checked.png'
                      : 'assets/images/unchecked.png',
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.getProportionalHeight(context, 5.0),
              ),
              child: const Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'رقم الحساب : 1230 0000 5522 5533',
                  style: TextStyle(
                    fontSize: 8.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'رقم الإيبان : 1230 0000 5522 5533',
                  style: TextStyle(
                    fontSize: 8.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
