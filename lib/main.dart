// lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/item_provider.dart';
import './screens/item_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemProvider()),
      ],
      child: MaterialApp(
        title: 'Lembrete de Itens',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: ItemListScreen(),
      ),
    );
  }
}
