import 'package:flutter/material.dart';

class MainPageData {
  String filter = '';
}

class MainPageProvider with ChangeNotifier {
  final MainPageData _data = MainPageData();

  MainPageData get data => _data;

  void setFilter(String filter) {
    _data.filter = filter;
    notifyListeners();
  }
}
