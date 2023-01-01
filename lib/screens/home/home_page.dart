import 'package:ascend/screens/home/components/home_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main-Page'),
      ),
      body: const HomeView(),
    );
  }
}
