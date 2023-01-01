import 'package:flutter/material.dart';

import 'components/register_view.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register-Page')),
      body: const RegisterView(),
    );
  }
}
