import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(
      children: [
        getBackground(context),
        getHomeScreen(),
      ],
    )));
  }

  Widget getBackground(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'images/bg1.png',
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'images/bg2.png',
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              'images/bg3.png',
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'images/bg4.png',
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
        ]));
  }

  Widget getHomeScreen() {
    return Center(
      child: SizedBox(
        width: 700,
        child: AppContents(),
      ),
    );
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
    return FractionallySizedBox(
        widthFactor: 0.7,
        child: Image.asset(
          'images/shikanoko_logo.png',
        ));
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
        FractionallySizedBox(
          widthFactor: 0.9,
          child: getFrame(100, 700, getInputForm('Input')),
        ),
        const ColumnSpace(h: 10),
        FractionallySizedBox(
          widthFactor: 0.9,
          child: getFrame(200, 700, getResultForm()),
        ),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(15), // 角を丸く
        border: Border.all(
          color: Colors.brown, // シカの色を意識
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.shade200, // シカの影をイメージ
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(4, 4),
          ),
        ],
      ),
    );
  }

  Widget getInputForm(String hint) {
    return TextField(
      maxLines: 5,
      onChanged: (value) {
        inputText = value;
      },
      style: TextStyle(
        fontSize: 20.0, // 少し小さめにして調整
        color: Colors.brown.shade800, // シカを意識したブラウン
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.brown.shade300),
        filled: true,
        fillColor: Colors.brown.shade100, // 優しい背景色
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none, // フレームなしで柔らかさを強調
        ),
        counterText: '',
      ),
    );
  }

  Widget getResultForm() {
    return Stack(children: [
      Container(
        width: 700,
        height: 200,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.brown.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.brown.shade400),
        ),
        child: SelectableText(
          resultText,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.brown.shade800,
          ),
        ),
      ),
      Positioned(
        top: 0,
        right: 0,
        child: Transform.translate(
            offset: const Offset(-1, -16),
            child: Opacity(
              opacity: 0.5,
              child: getCopyButton(),
            )),
      )
    ]);
  }

  Widget getButtons() {
    return Row(
      children: [
        const Spacer(),
        getButton('暗号化', () {
          setState(() {
            resultText = onclickEncrypt(inputText);
          });
        }, Icons.lock_outline),
        const Spacer(),
        getButton('復号', () {
          setState(() {
            resultText = onclickDecrypt(inputText);
          });
        }, Icons.lock_open),
        const Spacer(),
      ],
    );
  }

  Widget getButton(String text, void Function() callback, IconData ic) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown, // 錠前の色を意識した配色
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // 錠前の丸みを意識
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Row(
        children: [
          Icon(ic, color: Colors.amber), // 錠のアイコン
          const RowSpace(w: 10),
          Text(text, style: const TextStyle(color: Colors.amber)),
        ],
      ),
    );
  }

  Widget getCopyButton() {
    return ElevatedButton(
        onPressed: () {
          Clipboard.setData(ClipboardData(text: resultText));

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("コピーしました！"),
              duration: Duration(seconds: 2), // 表示時間を2秒に設定
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          minimumSize: const Size(20, 15),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
          )),
        ),
        child: const Text(
          "Copy",
          style: TextStyle(fontSize: 10),
        ));
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
