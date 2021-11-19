import 'package:flutter/material.dart';
import 'package:moodish/controllers/mood_controller.dart';
import 'package:moodish/models/mood.dart';
import 'package:moodish/services/services.dart';

class AllMood extends StatefulWidget {
  @override
  _AllMoodState createState() => _AllMoodState();
}

class _AllMoodState extends State<AllMood> {
  List<Mood> moods = List.empty();
  bool isLoading = false;
  var services = FirebaseServices();
  var controller;

  void initState() {
    super.initState();
    controller = MoodController(services);

    controller.onSync.listen(
      (bool syncState) => setState(() => isLoading = syncState),
    );
  }

  void _getMoods() async {
    var newMoods = await controller.fetchMoods();

    setState(() => moods = newMoods);
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: moods.isEmpty ? 1 : moods.length,
          itemBuilder: (ctx, index) {
            if (moods.isEmpty) {
              return Text('Tap refresh button');
            }
            return Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              height: 120,
              decoration: BoxDecoration(
                  color: (moods[index].mood == 'Excited')
                      ? Colors.green
                      : (moods[index].mood == 'Happy')
                          ? Colors.amber
                          : (moods[index].mood == 'Sad')
                              ? Colors.orange
                              : (moods[index].mood == 'Angry')
                                  ? Colors.red
                                  : Colors.grey,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${moods[index].mood_date.toString().substring(0, moods[index].mood_date.toString().lastIndexOf(' '))}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            moods[index].mood,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          height: 50,
                          width: 50,
                          child: (moods[index].mood == 'Excited')
                              ? Image.asset('assets/excited.png')
                              : (moods[index].mood == 'Happy')
                                  ? Image.asset('assets/happy.png')
                                  : (moods[index].mood == 'Sad')
                                      ? Image.asset('assets/sad.png')
                                      : (moods[index].mood == 'Angry')
                                          ? Image.asset('assets/angry.png')
                                          : null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            );
          },
        );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/7');
          },
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        appBar: AppBar(
          title: Text('Mood Tracker'),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _getMoods,
            ),
          ],
        ),
        body: Center(child: body));
  }
}
