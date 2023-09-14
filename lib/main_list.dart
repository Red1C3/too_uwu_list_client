import 'package:flutter/material.dart';
import 'package:too_uwu_list_client/note_model.dart';
import 'package:too_uwu_list_client/note_widget.dart';
import 'client.dart' as client;

class MainList extends StatefulWidget {
  const MainList({super.key});

  @override
  State createState() => _MainListState();
}

class _MainListState extends State {
  var _notes = <Note>[];

  Future<void> fetchNotes() async {
    setState(() async {
      _notes = await client.fetchNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("too-UwU-list")),
      body: RefreshIndicator(
        onRefresh: () => fetchNotes(),
        child: ListView.builder(
            itemCount: _notes.length,
            itemBuilder: ((context, index) {
              return NoteWidget(
                  note: _notes[index],
                  deleteFunc: (int id) async {
                    //TODO
                  });
            })),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //await fetchNotes(); TODO do sync-wise
  }
}
