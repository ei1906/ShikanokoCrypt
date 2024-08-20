import 'package:shikanoko/DeerChara.dart';

class DeerString {
  // テキストボックスからの入力，暗号文か平文かは不定
  List<DeerChara> _string = [];

  DeerString() {
    // nothing
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
    return;
  }

  void setCipher(String str) {
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
        return "エラー";
    }
  }
}
