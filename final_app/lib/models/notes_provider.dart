import 'package:final_app/models/notes.dart';
import 'package:flutter/material.dart';

class NotesProviders extends ChangeNotifier {
  List<Note> _note = [];

  List<Note> get getNote {
    return _note;
  }

  void addNote(String equation, String result) {
    Note note = new Note(equation, result);
    _note.add(note);

    notifyListeners();
  }
}
