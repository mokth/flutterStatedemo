import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:statedemo/counter_view/counter_view_model.dart';

class CounterProviderDecrease extends StatelessWidget {
  const CounterProviderDecrease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<CounterViewModel>().decrease();
        },
        child: const Text("Decrease +"));
  }
}
