import 'package:final_app/pages/calculator.dart';
import 'package:final_app/pages/load_history.dart';
import 'package:final_app/pages/history.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'models/notes_provider.dart';
import 'pages/history_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotesProviders(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primaryColor: Colors.blueGrey.shade900),
      home: Calculator(),
      routes: <String, WidgetBuilder>{
        '/1': (context) => Calculator(),
        '/2': (context) => HistoryPage(), //Providerได้อย่างเดียว
        '/3': (context) => LoadHistory(), //Firebaseได้อย่างเดียว
        '/4': (context) => History(),
      },
    );
  }
}
