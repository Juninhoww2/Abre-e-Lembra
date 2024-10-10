// lib/widgets/item_card.dart

import 'package:flutter/material.dart';
import '../models/item.dart';
import '../screens/item_detail_screen.dart';
import 'dart:io';

class ItemCard extends StatelessWidget {
  final Item item;

  ItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: item.imagePath != null
            ? Image.file(
                File(item.imagePath!),
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )
            : Icon(Icons.image, size: 50),
        title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Local: ${item.location}'),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ItemDetailScreen(item.id),
            ),
          );
        },
      ),
    );
  }
}
