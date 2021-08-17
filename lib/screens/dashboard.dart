import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/constants.dart';
import 'package:money_app/screens/payment_screen.dart';
import 'package:money_app/widgets/reusable_icon_button.dart';
import 'package:money_app/widgets/balance_text.dart';
import 'package:money_app/services/controllers.dart';

final ScreenController screenController = Get.find();
final ActivityCardController cardsController = Get.find();
final CardFormatter cardFormatter = Get.find();
final String text = '';

class Dashboard extends StatelessWidget {
  static const String screenID = '/dashboard';

  @override
  Widget build(BuildContext context) {
    Get.put<ActivityCardController>(ActivityCardController());
    return Scaffold(
      body: Container(
        color: kMainColor,
        child: SafeArea(child: _buildColumn()),
      ),
    );
  }
}

Widget _buildColumn() => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // First container
        _buildTopContainer(),
        // Section with offset
        _buildMidContainerWithButtons(),
        // Bottom grey container
        _buildBottomContainer(),
      ],
    );

Widget _buildTopContainer() => Flexible(
      flex: 3,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'MoneyApp',
              style: kMoneyAppTitleStyle,
            ),
            SizedBox(
              height: 35,
            ),
            BalanceText(),
          ],
        ),
      ),
    );

Widget _buildMidContainerWithButtons() {
  final buttonHeight = 100.0;
  return Stack(
    children: [
      // Use same background color like the second container
      Container(height: buttonHeight, color: Colors.grey[200]),
      // Translate the button
      Transform.translate(
        offset: Offset(0.0, -buttonHeight / 2.0),
        child: Center(
          child: Container(
            height: buttonHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 16.0,
                  offset: Offset(0.0, 6.0),
                  color: Colors.black.withOpacity(0.16),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(90.0, 10.0, 90.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ReusableIconButton(
                  text: 'Pay',
                  onPressed: () {
                    screenController.screenID = 1;
                    Get.to(() => PaymentScreen());
                  },
                  icon: Stack(
                    children: <Widget>[
                      Icon(
                        Icons.phone_iphone_outlined,
                        size: 45.0,
                        color: Colors.black,
                      ),
                      Positioned(
                        left: 12.0,
                        top: 10.0,
                        child: Icon(
                          Icons.attach_money_outlined,
                          size: 20.0,
                          color: const Color(0xffd640cc),
                        ),
                      ),
                      Positioned(
                        left: 22.0,
                        top: 7.0,
                        child: Icon(
                          Icons.arrow_right_alt_outlined,
                          size: 25.0,
                          color: const Color(0xffd640cc),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                ReusableIconButton(
                  text: 'Top up',
                  onPressed: () {
                    screenController.screenID = 2;
                    Get.to(() => PaymentScreen());
                  },
                  icon: Stack(
                    children: <Widget>[
                      Icon(
                        Icons.payment_outlined,
                        size: 45.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        child: Container(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            cardsController.cards.isEmpty
                ? 'No recent activity'
                : 'Recent activity',
            style: kBlackSubtitleStyle,
          ),
        ),
      ),
    ],
  );
}

Widget _buildBottomContainer() => Flexible(
      flex: 5,
      child: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    for (var cardGroup in cardFormatter.cardList.entries)
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5.0),
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                cardGroup.key ==
                                        cardsController.f.format(DateTime.now())
                                    ? 'Today'
                                    : cardGroup.key,
                              ),
                            ),
                            for (var cardGroup
                                in cardFormatter.cardList.entries)
                              for (var card in cardGroup.value.where(
                                  (element) =>
                                      DateTime.parse(cardsController.f
                                          .format(element.creationDate)) ==
                                      DateTime.parse(cardGroup.key)))
                                card,
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
