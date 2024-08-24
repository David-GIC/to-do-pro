import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/material.dart';

class RootProvider with ChangeNotifier {
  int _index = 0;
  final List<TabItem> _items = const [
    TabItem(
      icon: Icons.dashboard,
      title: 'Dashboard',
    ),
    TabItem(
      icon: Icons.task_rounded,
      title: 'To-Do List',
    ),
  ];

  get items => _items;
  get index => _index;

  onChangeIndex(int val) {
    _index = val;
    notifyListeners();
  }
}
