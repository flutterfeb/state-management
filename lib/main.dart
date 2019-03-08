import 'package:flutter/material.dart';
import 'package:state_management/double_counter_screen.dart';
import 'package:state_management/model/login_state_button.dart';
import 'package:state_management/model/login_state_enum.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LoginState _loginState;
  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = 0;
    _loginState = LoginState.loggedOut;
  }

  increment() {
    setState(() {
      _counter++;
    });
  }

  decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            DoubleCounterScreen(
              counter: _counter,
              incrementFunction: increment,
              decrementFunction: decrement,
            ),
            LoginStateButton(
                loginState: _loginState,
                changeLoginState: (LoginState newLoginState) {
                  _loginState = newLoginState;
                  setState(() {});
                }),
            CheckStatusButton(currentLoginState: _loginState)
          ],
        ),
      ),
    );
  }
}

class CheckStatusButton extends StatelessWidget {
  final LoginState currentLoginState;

  const CheckStatusButton({Key key, @required this.currentLoginState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Current Login Satus is $currentLoginState"),
          ),
        );
      },
      child: Text("Check Login Status"),
    );
  }
}
