import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/authbloc.dart';
import '../bloc/login/login_event.dart';
import '../bloc/login/login_state.dart';
import '../bloc/login/loginbloc.dart';
import '../bloc/userrepotory.dart';

class LoginPage extends StatefulWidget {
  final UserRepository userRepository;
  LoginPage(this.userRepository, {Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _compController = TextEditingController();

  LoginBloc? loginBloc;

  LoginState? state;

  double _curScaleFactor = 1.0;
  @override
  void initState() {
    super.initState();
    var authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    loginBloc = LoginBloc(
      widget.userRepository,
      authenticationBloc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    prefix: Icon(Icons.person),
                    labelText: "User ID",
                    filled: true,
                    fillColor: Colors.white),
                controller: _usernameController,
                obscureText: false,
              ),
              TextFormField(
                //style: TextStyle(fontSize: fontsize1 * _curScaleFactor),
                decoration: const InputDecoration(
                    prefix: Icon(Icons.person),
                    labelText: "Password",
                    filled: true,
                    fillColor: Colors.white),
                controller: _passwordController,
                obscureText: true,
              ),
              TextFormField(
                //style: TextStyle(fontSize: fontsize1 * _curScaleFactor),
                decoration: const InputDecoration(
                    prefix: Icon(Icons.person),
                    labelText: "CompCode",
                    filled: true,
                    fillColor: Colors.white),
                controller: _compController,
                obscureText: true,
              ),
              const Divider(height: 30, color: Colors.transparent),
              ElevatedButton(
                  onPressed: () async {
                    loginBloc?.add(LoginButtonPressed(_usernameController.text,
                        _passwordController.text, _compController.text));
                  },
                  child: const Text("Please Login")),
              const Divider(height: 15, color: Colors.transparent),
              BlocBuilder(
                  bloc: loginBloc,
                  builder: (
                    BuildContext context,
                    LoginState state,
                  ) {
                    if (state is LoginFailure) {
                      return Text(state.error);
                    } else if (state is LoginLoading) {
                      return const CircularProgressIndicator();
                    }

                    return Text(state.toString());
                  }),
            ]),
      ),
    );
  }
}
