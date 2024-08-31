import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'しかのこ暗号',
      theme: ThemeData.light(),
      home: getHomeScreen(),
    );
  }

  Widget getHomeScreen() {
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: 700,
        child: getAppContents(),
      ),
    ));
  }

  Widget getAppContents() {
    return Column(children: [
      getTitleLogo(),
      getInputForm('Input'),
    ]);
  }

  Widget getTitleLogo() {
    // 一時的にテキストを配置
    return const Text('しかのこ暗号');
  }

  Widget getInputForm(String hint) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Input Cipher or Crypt',
      ),
    );
  }
}
