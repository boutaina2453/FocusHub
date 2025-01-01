import 'package:flutter/material.dart';
import '../models/message.dart';

class ChatProvider with ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  void sendMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }
}
