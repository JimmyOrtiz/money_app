import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_app/constants.dart';
import 'package:get/get.dart';
import 'package:money_app/screens/dashboard.dart';
import 'package:money_app/services/controllers.dart';
import 'package:money_app/widgets/activity_card.dart';
import 'package:money_app/widgets/custom_text_form_field.dart';

class SendScreen extends StatelessWidget {
  static const String screenID = '/send screen';
  final BalanceController c = Get.find();
  final ScreenController screenController = Get.find();
  final ActivityCardController cardsController = Get.find();
  final CardFormatter cardformatter = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kMainColor,
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  'MoneyApp',
                  style: kMoneyAppTitleStyle,
                ),
                SizedBox(
                  height: 90,
                ),
                Text(
                  'To who?',
                  style: kWhiteTitleStyle,
                ),
                SizedBox(
                  height: 40,
                ),
                CreateTextFormField(
                  hintText: 'Recipient name',
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    c.recipientName.value = value;
                  },
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      if (screenController.screenID == 2) {
                        c.currentBalance.value +=
                            double.parse(c.calculatorText.value);
                        cardsController.cards.add(
                          ActivityCard(
                            title: c.recipientName.value,
                            amount: c.calculatorText.value,
                            payment:
                                screenController.screenID == 2 ? false : true,
                            creationDate: DateTime.now(),
                          ),
                        );
                        cardformatter.addToList();
                        c.calculatorText.value = '0.00';
                        c.calculatorValue.value = 0.00;
                        Get.offAll(() => Dashboard());
                      } else {
                        c.currentBalance.value -=
                            double.parse(c.calculatorText.value);
                        cardsController.cards.add(
                          ActivityCard(
                            title: c.recipientName.value,
                            amount: c.calculatorText.value,
                            payment:
                                screenController.screenID == 2 ? false : true,
                            creationDate: DateTime.now(),
                          ),
                        );
                        cardformatter.addToList();
                        var f = NumberFormat("##0.00", "en_US");
                        c.currentBalance.value =
                            double.parse(f.format(c.currentBalance.value));
                        c.calculatorText.value = '0.00';
                        c.calculatorValue.value = 0.00;
                        Get.offAll(() => Dashboard());
                      }
                    },
                    child: Text('Pay'),
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white.withAlpha(400),
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                      elevation: MaterialStateProperty.all(0.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
