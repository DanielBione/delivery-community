import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'models/register/register.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => RegisterProvider(register: [])),
  ], child: const App()));
}
