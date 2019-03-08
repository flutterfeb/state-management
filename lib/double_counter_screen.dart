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
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: CounterText(counter: counter, onPressed: incrementFunction,),
          ),
          Expanded(
            child: CounterText(counter: counter, onPressed: decrementFunction,),
          ),
        ],
      ),
    );
  }
}
