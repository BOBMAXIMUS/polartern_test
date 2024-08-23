import 'package:flutter/material.dart';

class GlobalKeyManager {
  static final GlobalKeyManager _instance = GlobalKeyManager._internal();

  factory GlobalKeyManager() {
    return _instance;
  }

  GlobalKeyManager._internal();

  final GlobalKey globalKey = GlobalKey();
}
