import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  // Now, you can use the  navigateTo  method in any widget.

  Future<dynamic> pushNamed(String routeName,{Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName,{Object? arguments}) {
    return Navigator.of(this).popAndPushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,{Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate , arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
  
}

