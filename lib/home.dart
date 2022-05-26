import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import 'api/api_repo.dart';
import 'bloc/auth/authbloc.dart';
import 'bloc/auth/authevent.dart';
import 'counter_provider/Counter_provider.dart';
import 'counter_view/CounterStacked.dart';
import 'list_view/list_view_demo.dart';
import 'list_view/list_view_demo_before.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("State Demo")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                navigate(CounterProvider());
              },
              child: const Text("Provider")),
          const Divider(color: Colors.transparent),
          ElevatedButton(
              onPressed: () {
                navigate(const CounterStacked());
              },
              child: const Text("Model View")),
          const Divider(color: Colors.transparent),
          ElevatedButton(
              onPressed: () {
                navigate(const ListViewDemoBefore());
              },
              child: const Text("List View")),
          const Divider(color: Colors.transparent),
          ElevatedButton(
              onPressed: () {
                navigate(const ListViewDemo());
              },
              child: const Text("List View After +")),
          const Divider(color: Colors.transparent),
          ElevatedButton(
              onPressed: () {
                testApi();
              },
              child: const Text("Test Api")),
          const Divider(color: Colors.transparent),
          ElevatedButton(
              onPressed: () {
                signOut(context);
              },
              child: const Text("Sign Out")),
          const Divider(color: Colors.transparent),
        ],
      ),
    );
  }

  testApi() async {
    APIRepository api = APIRepository();
    var list = await api.getItemType("AB", "JB");
    print("Download list count ${list.length}");
  }

  signOut(BuildContext context) {
    var authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    authenticationBloc.add(LoggedOut());
  }

  navigate(Widget page) {
    Navigator.push(
        context!,
        PageTransition(
            type: PageTransitionType.rightToLeftWithFade, child: page));
  }
}
