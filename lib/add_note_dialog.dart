import 'package:flutter/material.dart';
import 'client.dart' as client;

class AddNoteDialog extends StatefulWidget {
  const AddNoteDialog({super.key});
  @override
  State<StatefulWidget> createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State {
  final _controller = TextEditingController();

  void _addNote(BuildContext context) {
    var text = _controller.text;
    client.createNote(text).then((value) {
      if (value) {
        Navigator.pop(context);
      } else {
        //TODO show snackbar
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Note"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            autofocus: true,
            controller: _controller,
            onSubmitted: (value) => _addNote(context),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () => _addNote(context), child: const Text("Add")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"))
            ],
          )
        ],
      ),
    );
  }
}
