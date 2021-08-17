import 'package:get/get.dart';
import "package:collection/collection.dart";
import 'package:intl/intl.dart';
import 'package:money_app/widgets/activity_card.dart';

final ActivityCardController cardsController = Get.find();

class BalanceController extends GetxController {
  var currentBalance = 0.00.obs;
  var calculatorText = '0.00'.obs;
  var calculatorValue = 0.00.obs;
  var recipientName = ''.obs;
}

class ScreenController extends GetxController {
  int screenID = 0;

  changeScreenID(int screen) {
    screenID = screen;
  }
}

class ActivityCardController extends GetxController {
  List<ActivityCard> cards = [];

  var f = DateFormat('yyyy-mm-dd');
}

class CardFormatter extends GetxController {
  Map<String, List<ActivityCard>> cardList = groupBy(cardsController.cards,
      (card) => cardsController.f.format(card.creationDate));

  addToList() {
    cardList = groupBy(cardsController.cards,
        (card) => cardsController.f.format(card.creationDate));
  }
}
