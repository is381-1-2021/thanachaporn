import 'package:flutter/material.dart';

import 'pages/Log_in.dart';
import 'pages/Task_over_view.dart';
import 'pages/confirm_payment.dart';
import 'pages/daily_activities.dart';
import 'pages/daily_mood.dart';
import 'pages/daily_quote.dart';
import 'pages/home.dart';
import 'pages/monthly_mood.dart';
import 'pages/monthly_quote.dart';
import 'pages/product_catalog.dart';
import 'pages/task_edit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        '/3': (context) => TaskOverview(),
        '/4': (context) => TaskEdit(),
        '/5': (context) => ProductCatalog(),
        '/6': (context) => ConfirmPayment(),
        '/7': (context) => DailyMood(),
        '/8': (context) => MonthlyMood(),
        '/9': (context) => DailyQuote(),
        '/10': (context) => MonthlyQuote(),
        '/11': (context) => DailyActivities(),
      },
    );
  }
}
