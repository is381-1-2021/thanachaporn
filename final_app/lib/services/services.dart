import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/models/notes.dart';

abstract class Services {
  Future<List<Note>> getNote();
}

class FirebaseServices extends Services {
  @override
  Future<List<Note>> getNote() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('thanachaporn_final').get();
    var all = AllNote.fromSnapshot(snapshot);
    return all.note;
  }
}
