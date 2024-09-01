import './DeerString.dart';

String onclickEncrypt(String input) {
  DeerString str = DeerString();
  str.setPlain(input);
  return str.getCipher();
}

String onclickDecrypt(String input) {
  DeerString str = DeerString();
  str.setCipher(input);
  return str.getPlain();
}
