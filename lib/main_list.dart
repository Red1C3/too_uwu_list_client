import 'package:flutter/material.dart';
import 'package:too_uwu_list_client/add_note_dialog.dart';
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
    var notes = await client.fetchNotes();
    setState(() {
      _notes = notes;
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
              return DecoratedBox(
                  decoration: const BoxDecoration(
                      border: BorderDirectional(
                    top: BorderSide(color: Color.fromARGB(255, 143, 143, 143)),
                  )),
                  child: NoteWidget(
                      note: _notes[index],
                      deleteFunc: (int id) {
                        client.deleteNote(id).then((success) {
                          if (success) {
                            fetchNotes();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Failed to delete note")));
                          }
                        });
                      }));
            })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (BuildContext context) => const AddNoteDialog());
          fetchNotes();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  @override
  void dispose() {
    client.close();
    super.dispose();
  }
}
