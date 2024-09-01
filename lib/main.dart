import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'しかのこ暗号',
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getHomeScreen();
  }

  Widget getHomeScreen() {
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: 700,
        child: AppContents(),
      ),
    ));
  }
}

class AppContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getAppContents();
  }

  Widget getAppContents() {
    return Column(children: [
      getTitleLogo(),
      Space(),
      getForms(),
      Space(),
    ]);
  }

  Widget getTitleLogo() {
    return Image.asset(
      'images/shikanoko_logo.jpg',
      width: 400,
    );
  }

  Widget getForms() {
    return Forms();
  }
}

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  // 状態を保持するグローバル変数
  String inputText = '';
  String resultText = '';

  @override
  Widget build(BuildContext context) {
    return getForms();
  }

  Widget getForms() {
    return Column(children: [
      getFrame(200, 700, getInputForm('Input')),
      Space(),
      getFrame(200, 700, getResultForm()),
      Space(),
      getButtons(),
    ]);
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
    return Text(resultText);
  }

  Widget getButtons() {
    return Row(
      children: [
        Space(),
        getButton('暗号化', () {
          setState(() {
            resultText = '暗号化したよ';
          });
        }),
        Space(),
        getButton('復号', () {
          setState(() {
            resultText = '復号したよ';
          });
        }),
        Space(),
      ],
    );
  }

  Widget getButton(String text, void Function() callback) {
    return OutlinedButton(
      onPressed: callback,
      child: Text(text),
    );
  }
}

class Space extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getSpace();
  }

  Widget getSpace() {
    return const Spacer();
  }
}
