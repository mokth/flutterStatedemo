import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'CounterState.dart';
import 'bloc/auth/authbloc.dart';
import 'bloc/auth/authstate.dart';
import 'bloc/userrepotory.dart';
import 'blog_page/loading_indicator.dart';
import 'blog_page/login_page.dart';
import 'blog_page/splash.dart';
import 'counter_provider/Counter_provider.dart';
import 'counter_view/CounterStacked.dart';
import 'counter_view/counter_view_model.dart';
import 'home.dart';
import 'list_view/list_view_demo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //runApp(const MyApp());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CounterViewModel()),
    ],
    child: MyApp2(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CounterProvider());
  }
}

class MyApp2 extends StatelessWidget {
  MyApp2({Key? key}) : super(key: key);
  var userRepository = UserRepository();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var authenticationBloc = AuthenticationBloc(userRepository: userRepository);
    return BlocProvider<AuthenticationBloc>(
        create: (context) => authenticationBloc,
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, AuthenticationState state) {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              debugShowCheckedModeBanner: false,
              home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  bloc: authenticationBloc,
                  builder: (BuildContext context, AuthenticationState state) {
                    if (state is AuthenticationUninitialized) {
                      return SplashPage();
                    }
                    if (state is AuthenticationAuthenticated) {
                      return HomePage();
                      //ListViewDemo();
                      // CounterProvider();
                      // HomePage();
                    }

                    if (state is AuthenticationUnauthenticated) {
                      return LoginPage(userRepository);
                    }
                    if (state is AuthenticationLoading) {
                      return LoadingIndicator();
                    }
                    return Text('');
                  }));
        }));
  }
}
