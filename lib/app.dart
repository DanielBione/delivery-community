import 'package:ascend/routes.dart';
import 'package:ascend/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: currentAppTheme,
      initialRoute: '/',
      routes: routes,
    );
  }
}
