import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String equation;
  String result;

  Note(this.equation, this.result);

  factory Note.fromJson(
    Map<String, dynamic> json,
  ) {
    return Note(
      json['equation'] as String,
      json['result'] as String,
    );
  }
}

class AllNote {
  final List<Note> note;

  AllNote(this.note);

  factory AllNote.fromJson(
    List<dynamic> json,
  ) {
    var x = json.map((record) => Note.fromJson(record)).toList();

    return AllNote(x);
  }

  factory AllNote.fromSnapshot(QuerySnapshot snapshot) {
    var x = snapshot.docs.map((record) {
      return Note.fromJson(record.data() as Map<String, dynamic>);
    }).toList();

    return AllNote(x);
  }
}
