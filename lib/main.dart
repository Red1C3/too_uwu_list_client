import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget { //TODO turn stateful
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("too-UwU-list")),
        body: RefreshIndicator(
          onRefresh: () async {
            var future = await Future.delayed(Duration.zero);
            return future;
            //TODO
          },
          child: ListView(),
        ),
      ),
    );
  }
}
