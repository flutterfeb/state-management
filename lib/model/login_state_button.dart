import 'package:flutter/material.dart';
import 'package:state_management/model/login_state_enum.dart';

class LoginStateButton extends StatelessWidget {
  final LoginState loginState;
  final Function(LoginState newState) changeLoginState;

  const LoginStateButton(
      {Key key, @required this.loginState, @required this.changeLoginState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
