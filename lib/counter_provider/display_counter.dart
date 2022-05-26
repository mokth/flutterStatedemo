import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../counter_view/counter_view_model.dart';

class DisplayProviderCounter extends StatelessWidget {
  const DisplayProviderCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Counter : ${context.watch<CounterViewModel>().getCounter().toStringAsFixed(0)}",
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    );
  }
}
