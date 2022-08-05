import 'package:flutter/material.dart';
import 'package:student_app/constants/functions/functions.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/constants/size/size_config.dart';
import 'package:student_app/presentation/screens/payment_details_screen.dart';
import 'package:student_app/presentation/widgets/default_button.dart';

class PaymentMethodsScreen extends StatefulWidget {
  static const String routeName = '/payment-methods';
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
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
              'طرق الدفع',
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
                    SizedBox(
                      width: SizeConfig.getProportionalWidth(context, 222.0),
                      child: Text(
                        'من فضلك قم بإختيار إحدى طريق الدفع لإكمال عملية الشراء',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.5,
                          fontSize:
                              SizeConfig.getProportionalWidth(context, 14.0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 24.0),
                    ),
                    _buildPaymentMethodItem(
                      index: 0,
                      title: 'دفع إلكتروني',
                      imageUrl: 'assets/images/master_card.png',
                    ),
                    _buildPaymentMethodItem(
                      index: 1,
                      title: 'تحويل بنكي',
                      imageUrl: 'assets/images/bank_transfer.png',
                    ),
                    _buildPaymentMethodItem(
                      index: 2,
                      title: 'بايبال',
                      imageUrl: 'assets/images/paypal.png',
                    ),
                    _buildPaymentMethodItem(
                      index: 3,
                      title: 'متجر زبوني',
                      imageUrl: 'assets/images/zboni.png',
                    ),
                    _buildPaymentMethodItem(
                      index: 4,
                      title: 'متجر سلة',
                      imageUrl: 'assets/images/salla.png',
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionalHeight(context, 40.0),
                    ),
                    DefaultButton(
                        onTap: () {
                          if (chosenIndex == 1) {
                            nextPage(
                              context,
                              PaymentDetailsScreen.routeName,
                            );
                          }
                        },
                        text: 'التالي'),
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
        height: SizeConfig.getProportionalHeight(context, 72.0),
        margin: EdgeInsets.symmetric(
          vertical: SizeConfig.getProportionalHeight(context, 8.0),
        ),
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.getProportionalHeight(context, 25.0),
          horizontal: SizeConfig.getProportionalWidth(context, 16.0),
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
        child: Row(
          children: [
            Image.asset(
              imageUrl,
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
      ),
    );
  }
}
