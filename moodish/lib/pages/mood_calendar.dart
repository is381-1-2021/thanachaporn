//import 'package:flutter/material.dart';
//import 'package:moodish/controllers/mood_controller.dart';
//import 'package:moodish/models/mood_model.dart';
//import 'package:moodish/services/services.dart';
//import 'package:table_calendar/table_calendar.dart';

//class MoodCalendar extends StatefulWidget {
  //@override
  //_MoodCalendar createState() => _MoodCalendar();
//}

//class _MoodCalendar extends State<MoodCalendar> {
  //late final ValueNotifier<List<MoodTracker>> _selectedEvents;
  //CalendarFormat _calendarFormat = CalendarFormat.month;
  //RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  //DateTime _focusedDay = DateTime.now();
  //DateTime? _moodDate;

  //List<MoodModel> moods = List.empty();
  //bool isLoading = false;
  //var services = FirebaseServices();
  //var controller;

  //@override
  //void initState() {
    //super.initState();
    //controller = MoodController(services);

    //controller.onSync.listen(
      //(bool syncState) => setState(() => isLoading = syncState),
    //);

    //_moodDate = _focusedDay;
    //_selectedEvents = ValueNotifier(_getMoodForDay(_moodDate!));
  //}

  //@override
  //void dispose() {
    //_selectedEvents.dispose();
    //super.dispose();
 // }

  //List<MoodTracker> _getMoodForDay(DateTime day) {
    //return kEvents[day] ?? [];
  //}

  //void _onDaySelected(DateTime mood_date, DateTime focusedDay) {
    //if (!isSameDay(_moodDate, mood_date)) {
      //setState(() {
        //_moodDate = mood_date;
        //_focusedDay = focusedDay;
      //});

      //_selectedEvents.value = _getMoodForDay(mood_date);
    //}
  //}

  //@override
  //Widget build(BuildContext context) {
    //return Scaffold(
      //appBar: AppBar(
        //title: Text('Mood Tracker'),
      //),
      //body: Column(
        //children: [
          //TableCalendar<MoodTracker>(
            //firstDay: kFirstDay,
            //lastDay: kLastDay,
            //focusedDay: _focusedDay,
            //selectedDayPredicate: (day) => isSameDay(_moodDate, day),
           // calendarFormat: _calendarFormat,
            //rangeSelectionMode: _rangeSelectionMode,
            //eventLoader: _getMoodForDay,
            //startingDayOfWeek: StartingDayOfWeek.sunday,
            //calendarStyle: CalendarStyle(
              //outsideDaysVisible: false,
            //),
            //onDaySelected: _onDaySelected,
            //onFormatChanged: (format) {
              //if (_calendarFormat != format) {
                //setState(() {
                  //_calendarFormat = format;
                //});
              //}
            //},
            //onPageChanged: (focusedDay) {
              //_focusedDay = focusedDay;
            //},
          //),
          //const SizedBox(height: 8.0),
          //Expanded(
            //child: ValueListenableBuilder<List<MoodTracker>>(
              //valueListenable: _selectedEvents,
              //builder: (context, value, _) {
                //return ListView.builder(
                  //itemCount: value.length,
                  //itemBuilder: (context, index) {
                    //return Container(
                      //margin: const EdgeInsets.symmetric(
                        //horizontal: 12.0,
                        //vertical: 4.0,
                      //),
                      //decoration: BoxDecoration(
                        //border: Border.all(),
                        //borderRadius: BorderRadius.circular(12.0),
                      //),
                      //child: ListTile(
                        //onTap: () => print('${value[index]}'),
                        //title: Text('${value[index]}'),
                      //),
                    //);
                  //},
                //);
              //},
            //),
          //),
        //],
      //),
    //);
  //}
//}
