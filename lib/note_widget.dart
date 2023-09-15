import 'package:flutter/material.dart';
import 'package:too_uwu_list_client/note_model.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.note, required this.deleteFunc});
  final Note note;
  final void Function(int) deleteFunc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(note.content),
        IconButton(
            onPressed: () {
              deleteFunc(note.id);
            },
            icon: const Icon(Icons.delete))
      ],
    );
  }
}
