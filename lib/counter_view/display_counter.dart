import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'counter_view_model.dart';

class DisplayCounter extends ViewModelWidget<CounterViewModel> {
  const DisplayCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CounterViewModel model) {
    return Text(
      "Counter : ${model.getCounter().toStringAsFixed(0)}",
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    );
  }
}
