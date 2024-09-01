import 'package:flutter/material.dart';
import './back.dart';

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
  AppContents({super.key});

  @override
  Widget build(BuildContext context) {
    return getAppContents();
  }

  Widget getAppContents() {
    return Column(children: [
      getTitleLogo(),
      const ColumnSpace(h: 10),
      getForms(),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getFrame(100, 700, getInputForm('Input')),
        const ColumnSpace(h: 10),
        getFrame(200, 700, getResultForm()),
        const ColumnSpace(h: 10),
        getButtons(),
      ],
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
          width: 3, // 枠線の太さを設定
        ),
      ),
    );
  }

  Widget getInputForm(String hint) {
    return TextField(
      maxLength: 30,
      maxLines: 5,
      onChanged: (value) {
        inputText = value;
      },
      style: TextStyle(
        fontSize: 30.0, // フォントサイズを設定
      ),
      decoration: InputDecoration(
        hintText: hint,
        counterText: '',
        border: InputBorder.none,
      ),
    );
  }

  Widget getResultForm() {
    return Text(resultText);
  }

  Widget getButtons() {
    return Row(
      children: [
        getButton('暗号化', () {
          setState(() {
            resultText = onclickEncrypt(inputText);
          });
        }),
        const RowSpace(w: 20),
        getButton('復号', () {
          setState(() {
            resultText = onclickDecrypt(inputText);
          });
        }),
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

class ColumnSpace extends StatelessWidget {
  final double h;
  const ColumnSpace({super.key, required this.h});

  @override
  Widget build(BuildContext context) {
    return getSpace();
  }

  Widget getSpace() {
    return SizedBox(height: h);
  }
}

class RowSpace extends StatelessWidget {
  final double w;
  const RowSpace({super.key, required this.w});

  @override
  Widget build(BuildContext context) {
    return getSpace();
  }

  Widget getSpace() {
    return SizedBox(width: w);
  }
}
