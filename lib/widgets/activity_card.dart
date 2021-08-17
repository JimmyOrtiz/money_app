import 'package:flutter/material.dart';
import 'package:money_app/constants.dart';

class ActivityCard extends StatelessWidget {
  ActivityCard({
    this.title,
    required this.amount,
    required this.payment,
    required this.creationDate,
  });

  final String? title;
  final String amount;
  final bool payment;
  final DateTime creationDate;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      width: size.width,
      height: size.height * .08,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      height: 30,
                      width: 30,
                    ),
                    Positioned(
                      left: 3,
                      top: 2,
                      child: Icon(
                        payment == true
                            ? Icons.shopping_bag
                            : Icons.add_circle_rounded,
                        size: 25.0,
                        color: kGeneralColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  payment == true ? title! : 'Top Up',
                  style: kActivityCardTextStyle,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 20.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: payment == false
                          ? '+' + amount.substring(0, amount.indexOf('.'))
                          : amount.substring(0, amount.indexOf('.')),
                      style: TextStyle(
                        color: payment == true ? Colors.black : kMainColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 33,
                      )),
                  TextSpan(
                      text: amount.substring(amount.indexOf('.')),
                      style: TextStyle(
                        color: payment == true ? Colors.black : kMainColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 25,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
