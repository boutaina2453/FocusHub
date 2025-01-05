import 'package:flutter/material.dart';
import '../models/event.dart';

class EventProvider with ChangeNotifier {
  List<Event> _events = [];

  List<Event> get events => _events;

  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }

  void deleteEvent(String id) {
    _events.removeWhere((event) => event.id == id);
    notifyListeners();
  }
}
