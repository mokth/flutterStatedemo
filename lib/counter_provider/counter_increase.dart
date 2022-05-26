import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../counter_view/counter_view_model.dart';

class CounterProviderIncrease extends StatelessWidget {
  const CounterProviderIncrease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<CounterViewModel>().increase();
        },
        child: const Text("Increate +"));
  }
}
