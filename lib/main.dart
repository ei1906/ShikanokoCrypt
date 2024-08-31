import 'package:flutter/cupertino.dart';
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
      getSpace(),
      getFrame(200, 700, getInputForm('Input')),
      getSpace(),
      getFrame(200, 700, getResultForm()),
      getSpace(),
      getButtons(),
      getSpace(),
    ]);
  }

  Widget getTitleLogo() {
    return Image.asset(
      'images/shikanoko_logo.jpg',
      width: 400,
    );
  }

  Widget getFrame(double h, double w, Widget c) {
    return Container(
      height: h,
      width: w,
      child: c,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.brown, // 枠線の色を設定
        ),
      ),
    );
  }

  Widget getInputForm(String hint) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Input Cipher or Crypt',
      ),
    );
  }

  Widget getResultForm() {
    return const Text('Result');
  }

  Widget getButtons() {
    return Row(
      children: [
        getSpace(),
        getButton('暗号化', () {
          ;
        }),
        getSpace(),
        getButton('暗号化', () {
          ;
        }),
        getSpace(),
      ],
    );
  }

  Widget getButton(String text, void Function() callback) {
    return OutlinedButton(
      onPressed: callback,
      child: Text(text),
    );
  }

  Widget getSpace() {
    return const Spacer();
  }
}
