import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moodish/pages/add_quote.dart';
import 'package:moodish/pages/all_quote.dart';
import 'package:moodish/pages/confirm_payment.dart';
import 'package:moodish/pages/mood_calendar2.dart';
import 'package:moodish/pages/product_catalog.dart';
import 'package:moodish/pages/task_edit.dart';
import 'package:moodish/pages/task_overview.dart';
import 'package:provider/provider.dart';

import 'models/form_model.dart';
import 'models/notes_operation.dart';
import 'pages/LogIn.dart';
import 'pages/daily_mood.dart';
import 'pages/home.dart';
import 'pages/mood_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FormModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotesOperation(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF8B82D0),
        accentColor: Color(0xFF5F478C),
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontFamily: 'Montserrat', color: Colors.black),
        ),
      ),
      initialRoute: '/2',
      routes: <String, WidgetBuilder>{
        '/1': (context) => LogIn(),
        '/2': (context) => Home(),
        '/3': (context) => AllTask(),
        '/4': (context) => TodoEntryScreen(),
        '/5': (context) => ProductCatalog(),
        '/6': (context) => MakeOrder(),
        '/7': (context) => DailyMood(),
        '/8': (context) => AllMood(),
        '/9': (context) => AddQuote(),
        '/10': (context) => AllQuote(),
        '/11': (context) => ShowListProduct(),
      },
    );
  }
}
