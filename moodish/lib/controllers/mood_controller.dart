import 'dart:async';

import 'package:moodish/models/mood.dart';
import 'package:moodish/services/services.dart';

class MoodController {
  final Services services;
  List<Mood> moods = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  MoodController(this.services);

  Future<List<Mood>> fetchNotes() async {
    onSyncController.add(true);
    moods = await services.getMoods();
    onSyncController.add(false);

    return moods;
  }
}
