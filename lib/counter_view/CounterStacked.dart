import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:statedemo/counter_view/counter_increase.dart';

import 'counter_decrease.dart';
import 'counter_view_model.dart';
import 'display_counter.dart';

class CounterStacked extends StatelessWidget {
  const CounterStacked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CounterViewModel>.reactive(
        viewModelBuilder: () => CounterViewModel(),
        onModelReady: (model) => model.initialModel(),
        builder: (context, model, _) {
          return Scaffold(
            appBar: AppBar(title: const Text("Model View")),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                DisplayCounter(),
                Divider(height: 20, color: Colors.transparent),
                CounterIncrease(),
                Divider(height: 20, color: Colors.transparent),
                CounterDecrease(),
              ],
            ),
          );
        });
  }
}
