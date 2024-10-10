import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/item.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => [..._items];

  ItemProvider() {
    loadItemsFromPreferences(); // Carrega os itens ao inicializar o provider
  }

  void addItem(
      String name, String location, String description, String? imagePath) {
    final newItem = Item(
      id: Uuid().v4(),
      name: name,
      location: location,
      description: description,
      dateAdded: DateTime.now(),
      imagePath: imagePath,
    );
    _items.add(newItem);
    notifyListeners();
    _saveItemsToPreferences(); // Salva os itens após adicionar um novo
  }

  Item findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> _saveItemsToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final itemList = _items.map((item) => json.encode(item.toMap())).toList();
    await prefs.setStringList('items', itemList);
  }

  Future<void> loadItemsFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final itemList = prefs.getStringList('items');
    if (itemList != null) {
      _items = itemList.map((item) => Item.fromMap(json.decode(item))).toList();
      notifyListeners();
    }
  }
}
