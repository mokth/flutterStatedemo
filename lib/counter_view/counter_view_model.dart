import 'package:flutter/cupertino.dart';

class CounterViewModel extends ChangeNotifier {
  int _counter = 0;

  void initialModel() {
    _counter = 0;
  }

  void increase() {
    _counter = _counter + 1;
    notifyListeners();
  }

  void decrease() {
    _counter = _counter - 1;
    notifyListeners();
  }

  int getCounter() {
    return _counter;
  }
}
