import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:money_app/screens/dashboard.dart';
import 'package:money_app/screens/send_screen.dart';
import 'package:money_app/widgets/activity_card.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:money_app/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_app/services/controllers.dart';
import 'package:money_app/widgets/calculator.dart';

class PaymentScreen extends StatelessWidget {
  static const String screenID = '/payment screen';
  final BalanceController c = Get.find();
  final ScreenController screenController = Get.find();
  final ActivityCardController cardsController = Get.find();
  final CardFormatter cardformatter = Get.find();

  @override
  Widget build(BuildContext context) {
    double newUserInput = 0.00;
    return Scaffold(
      body: Container(
        color: kMainColor,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'MoneyApp',
                  style: kMoneyAppTitleStyle,
                ),
                SizedBox(
                  height: 90,
                ),
                Text(
                  'How much?',
                  style: kWhiteTitleStyle,
                ),
                SizedBox(
                  height: 40,
                ),
                CalculatorText(),
                SizedBox(
                  height: 50,
                ),
                NumericKeyboard(
                  mainAxisAlignment: kIsWeb
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  onKeyboardTap: (value) {
                    if (c.calculatorValue.value == 0.00) {
                      newUserInput = double.parse(value) / 100;
                      c.calculatorValue.value = newUserInput;
                    } else {
                      c.calculatorValue.value *= 10;
                      newUserInput = double.parse(value) / 100;
                      c.calculatorValue.value += newUserInput;
                    }
                    var f = NumberFormat("##0.00", "en_US");
                    c.calculatorText.value = f.format(c.calculatorValue.value);
                  },
                  textColor: Colors.white,
                  rightButtonFn: () {
                    var f = NumberFormat("##0.00", "en_US");
                    c.calculatorValue.value /= 10;
                    c.calculatorText.value = f.format(c.calculatorValue.value);
                  },
                  rightIcon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      if (screenController.screenID == 1) {
                        Get.to(() => SendScreen());
                      } else {
                        c.currentBalance.value +=
                            double.parse(c.calculatorText.value);
                        cardsController.cards.add(
                          ActivityCard(
                            amount: c.calculatorText.value,
                            payment: false,
                            creationDate: DateTime.now(),
                          ),
                        );
                        cardformatter.addToList();
                        c.calculatorText.value = '0.00';
                        c.calculatorValue.value = 0.00;
                        Get.to(() => Dashboard());
                      }
                    },
                    child: Text('Next'),
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
