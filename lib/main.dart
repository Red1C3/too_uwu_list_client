import 'package:flutter/material.dart';
import 'package:too_uwu_list_client/main_list.dart';
import 'client.dart' as client;

void main() {
  runApp(const MainApp());
  client.close();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainList(),
    );
  }

  
}
