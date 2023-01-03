import 'package:flutter/cupertino.dart';

class Console {
  static log(dynamic data) {
    debugPrint("=========================");
    debugPrint(data.toString());
    debugPrint("=========================");
  }
}
