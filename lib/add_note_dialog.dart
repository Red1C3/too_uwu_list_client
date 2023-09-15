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
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to create note")));
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () => _addNote(context),
                      child: const Text("Add"))),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")))
            ],
          )
        ],
      ),
    );
  }
}
