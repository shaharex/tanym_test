import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/components/chat_app_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.teacher});
  final teacher;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ChatAppBar(text: widget.teacher['name']),
        // body: ,
      ),
    );
  }
}
