import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../presentation/views/index/index.dart';

class Routes {
  static const String index = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    dynamic data = settings.arguments;
    switch (settings.name) {
      case index:
        return MaterialPageRoute(
          builder: (context) => const AppIndex(),
          settings: settings,
        );

      //Default Route is error route
      default:
        return CupertinoPageRoute(
          builder: (context) => errorView(settings.name ?? 'Unknown'),
        );
    }
  }

  static Widget errorView(String name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}
