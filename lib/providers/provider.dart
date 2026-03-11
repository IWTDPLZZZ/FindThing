import 'package:flutter/material.dart';

class ProviderItem extends ChangeNotifier {
  List<String> _location = ['Все', 'Коробка 1', 'Коробка 2', 'Коробка 3'];
  int _indexLocation = 0;
  List<String> get location => _location;
  int get indexLocation => _indexLocation;

  void setIndexLocation(int index) {
    _indexLocation = index;
    notifyListeners();
  }

  void addLocation(String newlocation) {
    String trimLocation = newlocation.trim();
    if (trimLocation.isEmpty) {
      return;
    }

    bool exist = _location.any(
      (element) => element.toLowerCase() == trimLocation.toLowerCase(),
    );
    if (exist) {
      print('Location already exists');
      return;
    }
    if (!exist) {
      _location.add(trimLocation);
      _indexLocation = _location.length - 1;
      notifyListeners();
    }
  }

  void deleteLocation(String location) {
    String trimLocation = location.trim();
    if (trimLocation.isEmpty) {
      return;
    }
    _location.remove(trimLocation);
    _indexLocation = _location.length - 1;
    notifyListeners();
  }
}
