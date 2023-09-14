import 'package:flutter/material.dart';

class MainList extends StatefulWidget{
  const MainList({super.key});

  @override
  State createState()=>_MainListState();
}

class _MainListState extends State{

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: const Text("too-UwU-list")),
        body: RefreshIndicator(
          onRefresh: () async {
            var future = await Future.delayed(Duration.zero);
            return future;
            //TODO
          },
          child: ListView(),
        ),
      );
  }
}