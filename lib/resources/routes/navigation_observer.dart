import 'dart:developer';
import 'package:flutter/cupertino.dart';

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('did push route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('did pop route');
  }
}

// @override
// void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
//   print('MyTest didPush: $route');
// }
//
// @override
// void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
//   print('MyTest didPop: $route');
// }
//
// @override
// void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
//   print('MyTest didRemove: $route');
// }
//
// @override
// void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
//   print('MyTest didReplace: $newRoute');
// }