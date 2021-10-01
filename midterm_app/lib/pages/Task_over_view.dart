import 'package:flutter/material.dart';

class TaskOverview extends StatelessWidget {
  const TaskOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Overview'),
      ),
      body: Center(),
    );
    ;
  }
}
