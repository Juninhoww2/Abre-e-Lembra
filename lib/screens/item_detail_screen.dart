// lib/screens/item_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';
import 'dart:io';

class ItemDetailScreen extends StatelessWidget {
  final String itemId;

  ItemDetailScreen(this.itemId);

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<ItemProvider>(context).findById(itemId);

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            item.imagePath != null
                ? Image.file(
                    File(item.imagePath!),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 250,
                    color: Colors.grey[200],
                    child: Center(child: Icon(Icons.image, size: 100)),
                  ),
            SizedBox(height: 20),
            Text('Nome: ${item.name}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Localização: ${item.location}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Descrição: ${item.description}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('Adicionado em: ${item.dateAdded}',
                style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
