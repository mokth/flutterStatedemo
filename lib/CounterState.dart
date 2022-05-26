import 'package:flutter/material.dart';

class CounterState extends StatefulWidget {
  CounterState({Key? key}) : super(key: key);

  @override
  State<CounterState> createState() => _CounterState();
}

class _CounterState extends State<CounterState> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Statefull Widget")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Counter : ${counter.toStringAsFixed(0)}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const Divider(height: 20, color: Colors.transparent),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  counter = counter + 1;
                });
              },
              child: const Text("Increate +")),
          const Divider(height: 20, color: Colors.transparent),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  counter = counter - 1;
                });
              },
              child: const Text("Decrease +"))
        ],
      ),
    );
  }
}
