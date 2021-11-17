import 'package:flutter/material.dart';
import 'package:moodish/controllers/task_controller.dart';
import 'package:moodish/models/task.dart';
import 'package:moodish/services/services.dart';

class AllTask extends StatefulWidget {
  @override
  _AllTaskState createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  List<Task> tasks = List.empty();
  bool isLoading = false;
  var services = FirebaseServices();
  var controller;

  void initState() {
    super.initState();
    controller = TaskController(services);

    controller.onSync.listen(
      (bool syncState) => setState(() => isLoading = syncState),
    );
  }

  void _getTasks() async {
    var newTasks = await controller.fetchTasks();

    setState(() => tasks = newTasks);
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: tasks.isEmpty ? 1 : tasks.length,
          itemBuilder: (ctx, index) {
            if (tasks.isEmpty) {
              return Text('Tap button to fetch tasks');
            }
            return ListTile(
              title: Text(tasks[index].headline),
              subtitle: Text(tasks[index].detail),
            );
          },
        );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: _getTasks,
          child: Icon(
            Icons.search,
            size: 30,
          ),
        ),
        appBar: AppBar(
          title: Text('All your tasks'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/4');
              },
            ),
          ],
        ),
        body: Center(child: body));
  }
}
