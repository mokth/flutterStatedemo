import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:statedemo/counter_provider/counter_decrease.dart';
import 'package:statedemo/counter_provider/counter_increase.dart';
import 'package:statedemo/counter_view/counter_increase.dart';

import '../api/api_repo.dart';
import '../bloc/auth/authbloc.dart';
import '../bloc/auth/authevent.dart';
import '../counter_view/counter_view_model.dart';
import 'display_counter.dart';

class CounterProvider extends StatelessWidget {
  CounterProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CounterViewModel>().initialModel();
    return Scaffold(
      appBar: AppBar(title: const Text("Provider")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const DisplayProviderCounter(),
          const Divider(height: 20, color: Colors.transparent),
          const CounterProviderIncrease(),
          const Divider(height: 20, color: Colors.transparent),
          const CounterProviderDecrease(),
          const Divider(height: 30, color: Colors.transparent),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back")),
          const Divider(height: 30, color: Colors.transparent),
        ],
      ),
    );
  }

  testApi() async {
    APIRepository api = APIRepository();
    var list = await api.getItemType("AB", "JB");
    print("Download list count ${list.length}");
  }
}
