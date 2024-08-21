import 'package:shikanoko/DeerChara.dart';

class DeerString {
  // テキストボックスからの入力，暗号文か平文かは不定
  List<DeerChara> _string = [];
  bool _error = false;

  DeerString() {
    // nothing
  }

  bool isError() {
    return _error;
  }

  String getPlain() {
    String ret = "";
    _string.forEach((element) {
      ret += element.getPlain();
    });
    return ret;
  }

  String getCipher() {
    String ret = "";
    List<int> cipher;
    _string.forEach((element) {
      cipher = element.getCipher();
      for (int i = 0; i < element.CIPHER_NUM; i++) {
        ret += toShikanoko(cipher[i]);
      }
    });
    return ret;
  }

  void setPlain(String str) {
    // 平文を1文字ずつDeerCharaクラスに入れていく
    for (int i = 0; i < str.length; i++) {
      _string.add(DeerChara(str[i]));
    }
    return;
  }

  void setCipher(String str) {
    // 2文字×8ずつDeerCharaクラスに入れていく
    for (int i = 16; i < str.length; i += 16) {
      _string.add(DeerChara(str.substring(i - 16, i)));
    }
    return;
  }

  String toShikanoko(int cipher) {
    switch (cipher) {
      case 0:
        return "しか";
      case 1:
        return "のこ";
      case 2:
        return "こし";
      case 3:
        return "たん";
      default:
        _error = true; // エラー処理
        return "エラー";
    }
  }
}
