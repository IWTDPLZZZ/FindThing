import 'package:flutter/material.dart';

class ProviderItem extends ChangeNotifier {
  final List<String> _location = ['Все', 'Коробка 1', 'Коробка 2', 'Коробка 3'];
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

class StorageItemMain {
  final String name;
  final String place;
  final String pathImage;
  StorageItemMain({
    required this.name,
    required this.place,
    required this.pathImage,
  });
}

class ItemsAddProvider extends ChangeNotifier {
  List<StorageItemMain> _items = [];
  List<StorageItemMain> get items => _items;

  void addItems(StorageItemMain item) {
    _items.add(item);
    notifyListeners();
  }

  void deleteItems(StorageItemMain item) {
    _items.remove(item);
    notifyListeners();
  }

  void updateItems(StorageItemMain item) {
    final int index = _items.indexWhere(
      (StorageItemMain element) => element.name == item.name,
    );
    if (index == -1) {
      return;
    }
    _items[index] = item;
    notifyListeners();
  }
}
