import 'package:flutter/material.dart';
import 'package:find_thing/models/storage_item_main_page.dart';

/// Location filter tabs for the main list (e.g. boxes / "Все").
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

  /// Removes a location tab. Avoids [RangeError] when the list becomes empty.
  void deleteLocation(String location) {
    final String trimLocation = location.trim();
    if (trimLocation.isEmpty) {
      return;
    }
    _location.remove(trimLocation);
    if (_location.isEmpty) {
      _indexLocation = 0;
    } else {
      _indexLocation = _location.length - 1;
    }
    notifyListeners();
  }
}



/// Inventory items shown on the home screen; use with [Consumer] / [context.watch].
class ItemsAddProvider extends ChangeNotifier {
  List<StorageItemMainPage> _items = [];
  List<StorageItemMainPage> get items => _items;

  void addItems(StorageItemMainPage item) {
    _items.add(item);
    notifyListeners();
  }

  void deleteItems(StorageItemMainPage item) {
    _items.remove(item);
    notifyListeners();
  }

  void updateItems(StorageItemMainPage item) {
    final int index = _items.indexWhere(
      (StorageItemMainPage element) => element.name == item.name,
    );
    if (index == -1) {
      return;
    }
    _items[index] = item;
    notifyListeners();
  }
}
