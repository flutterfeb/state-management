import 'package:flutter/material.dart';
import 'package:state_management/counter_text.dart';
import 'package:state_management/inherited_counter.dart';

class DoubleCounterScreen extends StatelessWidget {
  final Function incrementFunction;
  final Function decrementFunction;

  const DoubleCounterScreen({
    Key key,
    @required this.incrementFunction,
    @required this.decrementFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = InheritedCounter.of(context).counter;
    return Row(
      children: <Widget>[
        Expanded(
          child: CounterText(
            counter: counter,
            onPressed: incrementFunction,
            isIncrementor: true,
          ),
        ),
        Expanded(
          child: CounterText(
            counter: counter,
            onPressed: decrementFunction,
            isIncrementor: false,
          ),
        ),
      ],
    );
  }
}
