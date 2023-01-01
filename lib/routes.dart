import 'package:ascend/screens/registration/register_page.dart';
import 'package:flutter/cupertino.dart';

import 'screens/home/home_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (_) => const RegisterPage(),
  '/homepage': (_) => const HomePage()
};
