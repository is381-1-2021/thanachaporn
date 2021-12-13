import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/models/notes.dart';
import 'package:final_app/models/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Note> note = List.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text("History"),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("thanachaporn_final")
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.blueGrey.shade900,
                      padding: EdgeInsets.all(10.0),
                      height: 120,
                      child: ListTile(
                        title: Consumer<NotesProviders>(
                          builder: (context, model, child) {
                            return Text(
                                '${snapshot.data!.docs[index]["equation"]}',
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 20));
                          },
                        ),
                        subtitle: Consumer<NotesProviders>(
                          builder: (context, model, child) {
                            return Text(
                                '${snapshot.data!.docs[index]["result"]}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 35));
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
