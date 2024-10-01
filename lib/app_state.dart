import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _randomNum = prefs.getInt('ff_randomNum') ?? _randomNum;
    });
    _safeInit(() {
      _squareNum = prefs.getInt('ff_squareNum') ?? _squareNum;
    });
    _safeInit(() {
      _sqaure = prefs.getInt('ff_sqaure') ?? _sqaure;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _randomNum = 0;
  int get randomNum => _randomNum;
  set randomNum(int value) {
    _randomNum = value;
    prefs.setInt('ff_randomNum', value);
  }

  int _squareNum = 0;
  int get squareNum => _squareNum;
  set squareNum(int value) {
    _squareNum = value;
    prefs.setInt('ff_squareNum', value);
  }

  int _sqaure = 0;
  int get sqaure => _sqaure;
  set sqaure(int value) {
    _sqaure = value;
    prefs.setInt('ff_sqaure', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
