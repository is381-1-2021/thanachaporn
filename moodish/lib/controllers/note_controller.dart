import 'dart:async';

import 'package:moodish/models/note.dart';
import 'package:moodish/services/services.dart';

class NoteController {
  final Services services;
  List<Note> notes = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  NoteController(this.services);

  Future<List<Note>> fetchNotes() async {
    onSyncController.add(true);
    notes = await services.getNotes();
    onSyncController.add(false);

    return notes;
  }
} 
