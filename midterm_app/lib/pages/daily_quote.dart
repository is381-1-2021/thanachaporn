import 'package:flutter/material.dart';

class DailyQuote extends StatelessWidget {
  const DailyQuote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Quote'),
      ),
      body: Center(),
    );
  }
}
