import 'package:flutter/material.dart';
import 'package:state_management/double_counter_screen.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = 0;
  }

  increment(){
    setState(() {
      _counter++;
    });
  }

  decrement(){
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: DoubleCounterScreen(
          counter: _counter,
          incrementFunction: increment,
          decrementFunction: decrement,
        ),
      ),
    );
  }
}
