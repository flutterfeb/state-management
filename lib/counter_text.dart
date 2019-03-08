import 'package:flutter/material.dart';

class CounterText extends StatefulWidget {
  final Function onPressed;
  final int counter;

  const CounterText({Key key, this.onPressed, @required this.counter})
      : super(key: key);

  @override
  _CounterTextState createState() => _CounterTextState();
}

class _CounterTextState extends State<CounterText>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  String get counter => "${widget.counter}";

  Function get onPressed => widget.onPressed;

  Animation<double> textSizeAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            }
            if (status == AnimationStatus.dismissed) {
              controller.forward();
            }
          })
          ..addListener(() {
            setState(() {});
          });
    textSizeAnimation = Tween(begin: 20.0, end: 50.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(
          counter,
          style: TextStyle(fontSize: textSizeAnimation.value),
        ),
      ),
    );
  }
}

// class CounterText extends StatelessWidget {
//  final Function onPressed;
//  final int counter;
//
//  const CounterText({Key key, this.onPressed, @required this.counter})
//      : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: RaisedButton(
//        onPressed: onPressed,
//        child: Text(
//          "$counter",
//          style: TextStyle(fontSize: 25),
//        ),
//      ),
//    );
//  }
//}
