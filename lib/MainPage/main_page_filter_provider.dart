import 'package:flutter/material.dart';

class MainPageFilterProvider with ChangeNotifier {
  String _filter = '';

  String get filter => _filter;

  void setFilter(String filter) {
    _filter = filter;
    notifyListeners();
  }
}
