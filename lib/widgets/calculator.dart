import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/services/controllers.dart';

final BalanceController c = Get.find();

class CalculatorText extends StatelessWidget {
  const CalculatorText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '£',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            TextSpan(
                text: c.calculatorText.value.substring(
                    0, c.calculatorText.value.toString().indexOf('.')),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                )),
            TextSpan(
                text: c.calculatorText.value
                    .substring(c.calculatorText.value.toString().indexOf('.')),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                )),
          ],
        ),
      ),
    );
  }
}
