import 'package:flutter/material.dart';
import 'package:state_management/counter_text.dart';

class DoubleCounterScreen extends StatelessWidget {
  final int counter;
  final Function incrementFunction;
  final Function decrementFunction;

  const DoubleCounterScreen({
    Key key,
    @required this.counter, this.incrementFunction, this.decrementFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: CounterText(counter: counter, onPressed: incrementFunction, isIncrementor: true,),
        ),
        Expanded(
          child: CounterText(counter: counter, onPressed: decrementFunction,isIncrementor: false,),
        ),
      ],
    );
  }
}
