import 'package:flutter/widgets.dart';

class CartViewModel extends ChangeNotifier {
  int orderCount = 1;

  void increaseOrder() {
    orderCount++;
    notifyListeners();
  }

  void decreaseOrder() {
    if (orderCount == 1) return;
    orderCount--;
    notifyListeners();
  }
}
