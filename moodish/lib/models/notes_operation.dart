import 'package:flutter/cupertino.dart';
import 'package:moodish/models/note.dart';

class NotesOperation extends ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get getNotes {
    return _notes;
  }

  NotesOperation() {
    addNewNote('ไม่จำเป็นต้องแข่งขัน เพราะเรานั้นไม่ใช่ไก่');
  }

  void addNewNote(String quote) {
    Note note = Note(DateTime.now(), quote);
    _notes.add(note);
    notifyListeners();
  }
}
