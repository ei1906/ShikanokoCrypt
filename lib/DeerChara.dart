// import 'dart:convert';

class DeerChara {
  final int CIPHER_NUM = 8;
  String _plain = ""; // 1文字
  List<int> _cipher = [0, 0, 0, 0, 0, 0, 0, 0]; // UTF-16の文字コードを2bitずつ

  DeerChara(String chara) {
    if (chara.length == 1) {
      setPlain(chara);
      deerEncrypt();
    } else {
      // todo: charaのサイズが奇数だった場合の対応
      setCipher(chara);
      deerDecrypt();
    }
  }

  void deerEncrypt() {
    // 2bitずつ切り出す
    int chrCode = _plain.codeUnitAt(0); // 文字コードを取得
    int mask = 3;
    for (int i = CIPHER_NUM - 1; i >= 0; i--) {
      _cipher[i] = (chrCode & mask);
      chrCode = (chrCode >> 2);
    }
  }

  void deerDecrypt() {
    int chrCode = 0;
    for (int i = 0; i < CIPHER_NUM; i++) {
      chrCode = (chrCode << 2);
      chrCode += _cipher[i];
    }
    _plain = String.fromCharCode(chrCode);
  }

  String getPlain() {
    return _plain;
  }

  List<int> getCipher() {
    return _cipher;
  }

  void setPlain(String chara) {
    _plain = chara;
  }

  void setCipher(String chara) {
    // 2文字ずつ分割して割り当てていく
    for (int i = 0; i < chara.length; i += 2) {
      switch (chara[i] + chara[i + 1]) {
        case "しか":
          _cipher[i ~/ 2] = 0;
          break;
        case "のこ":
          _cipher[i ~/ 2] = 1;
          break;
        case "こし":
          _cipher[i ~/ 2] = 2;
          break;
        case "たん":
          _cipher[i ~/ 2] = 3;
          break;
        default:
          _cipher[i ~/ 2] = -1;
          break;
      }
    }
  }
}
