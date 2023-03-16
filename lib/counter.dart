import 'package:flutter/foundation.dart'; //this package contains changenotifier

class Counter with ChangeNotifier{
  int value=0;

  void increment(){ 
    value++;
    notifyListeners();
  }
}