import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/services/controllers.dart';

final BalanceController c = Get.find();

class BalanceText extends StatelessWidget {
  const BalanceText({
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
                text: c.currentBalance.value != 0.00
                    ? c.currentBalance.value.toString().substring(
                        0, c.currentBalance.value.toString().indexOf('.'))
                    : '0.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                )),
            TextSpan(
              text: c.currentBalance.value != 0.00
                  ? c.currentBalance.value
                      .toString()
                      .substring(c.currentBalance.value.toString().indexOf('.'))
                  : '00',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
