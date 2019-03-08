import 'package:flutter/material.dart';

class InheritedCounter extends InheritedWidget {
  final int counter;

  const InheritedCounter({
    Key key,
    @required this.counter,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static InheritedCounter of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(InheritedCounter)
        as InheritedCounter;
  }

  @override
  bool updateShouldNotify(InheritedCounter old) {
    return old.counter != counter;
  }
}
