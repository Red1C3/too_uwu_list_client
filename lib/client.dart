import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:too_uwu_list_client/note_model.dart';

const String host = "127.0.0.1:8000"; //Change me to switch host IP/domain

var _client = http.Client();

Future<List<Note>> fetchNotes() async {
  var url = Uri.http(host, 'notes');
  var response = await _client.get(url);

  var decodedReponse =
      jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;

  var notes = <Note>[];
  for (int i = 0; i < decodedReponse.length; i++) {
    notes.add(
        Note(id: decodedReponse[i]['id'], content: decodedReponse[i]['note']));
  }

  return Future.value(notes);
}

void close() {
  _client.close();
}
