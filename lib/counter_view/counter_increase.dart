import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'counter_view_model.dart';

class CounterIncrease extends ViewModelWidget<CounterViewModel> {
  const CounterIncrease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CounterViewModel model) {
    return ElevatedButton(
        onPressed: () {
          model.increase();
        },
        child: const Text("Increate +"));
  }
}
