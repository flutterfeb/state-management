import 'package:flutter/material.dart';
import 'package:state_management/model/login_state_enum.dart';

class LoginStateButton extends StatelessWidget {
  final LoginState loginState;
  final Function(LoginState newState) changeLoginState;

  const LoginStateButton(
      {Key key, @required this.loginState, @required this.changeLoginState})
      : super(key: key);

  LoginState getNewLoginState() {
    LoginState newState;
    switch (loginState) {
      case LoginState.loggedOut:
        newState = LoginState.loggedIn;
        break;
      case LoginState.loggedIn:
        newState = LoginState.loggedInPro;
        break;
      case LoginState.loggedInPro:
        newState = LoginState.loggedOut;
        break;
    }
    return newState;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        changeLoginState(getNewLoginState());
      },
      child: loginState == LoginState.loggedInPro
          ? Icon(
              Icons.star,
              size: 25,
            )
          : Text(
              loginState == LoginState.loggedOut
                  ? "LOG In"
                  : "Subscribe to Pro",
              style: TextStyle(fontSize: 25),
            ),
    );
  }
}
