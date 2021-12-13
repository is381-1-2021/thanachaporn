import 'dart:async';

import 'package:final_app/models/notes.dart';
import 'package:final_app/services/services.dart';

class NoteController {
  final Services services;
  List<Note> note = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  NoteController(this.services);

  Future<List<Note>> fetchNote() async {
    onSyncController.add(true);

    note = await services.getNote();
    onSyncController.add(false);

    return note;
  }
}
