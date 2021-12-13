import 'package:final_app/controllers/notes_controller.dart';
import 'package:final_app/models/notes.dart';
import 'package:final_app/services/services.dart';
import 'package:flutter/material.dart';

class LoadHistory extends StatefulWidget {
  @override
  _LoadHistoryState createState() => _LoadHistoryState();
}

class _LoadHistoryState extends State<LoadHistory> {
  List<Note> note = List.empty();
  bool isLoading = false;
  var services = FirebaseServices();
  var controller;

  void initState() {
    super.initState();
    controller = NoteController(services);

    controller.onSync.listen(
      (bool syncState) => setState(() => isLoading = syncState),
    );
  }

  void _getNote() async {
    var newNote = await controller.fetchNote();

    setState(() => note = newNote);
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: note.isEmpty ? 1 : note.length,
          itemBuilder: (context, index) {
            if (note.isEmpty) {
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("There's no history yet",
                      style: TextStyle(color: Colors.white60, fontSize: 20)),
                ],
              );
            }
            return Container(
              padding: EdgeInsets.all(8.0),
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note[index].equation,
                    style: TextStyle(color: Colors.white60, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    note[index].result,
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ],
              ),
            );
          },
        );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      floatingActionButton: FloatingActionButton(
        onPressed: _getNote,
        child: Icon(
          Icons.refresh,
          size: 30,
        ),
        backgroundColor: Colors.lightBlue.shade900,
      ),
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Center(child: body),
    );
  }
}
