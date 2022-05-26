import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'counter_view_model.dart';

class CounterDecrease extends ViewModelWidget<CounterViewModel> {
  const CounterDecrease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CounterViewModel model) {
    return ElevatedButton(
        onPressed: () {
          model.decrease();
        },
        child: const Text("Decrease +"));
  }
}
