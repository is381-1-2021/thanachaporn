import 'package:final_app/models/notes.dart';
import 'package:final_app/models/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(title: Text("History")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<NotesProviders>(
            builder: (context, NotesProviders data, child) {
              return ListView.builder(
                itemCount: data.getNote.length,
                itemBuilder: (context, index) {
                  return CardList(data.getNote[index]);
                },
              );
            },
          ),
        ));
  }
}

class CardList extends StatelessWidget {
  final Note note;

  CardList(this.note);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.equation,
            style: TextStyle(color: Colors.white60, fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            note.result,
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
        ],
      ),
    );
  }
}
