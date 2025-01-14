import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_text_field.dart';
import 'package:tanymtest_app/src/core/components/chat_messages.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';

import 'provider/chat_provider.dart';

class OpenChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;
  const OpenChatPage({
    super.key,
    required this.receiverUserEmail,
    required this.receiverUserID,
  });

  @override
  State<OpenChatPage> createState() => _OpenChatPageState();
}

class _OpenChatPageState extends State<OpenChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatProvider _chatService = ChatProvider();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserID, _messageController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white_color,
      appBar: AppBar(
        backgroundColor: AppColors.white_color,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 30,
            color: AppColors.primary_color,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/images/teacher.png',
                fit: BoxFit.cover,
                height: 45,
                width: 45,
              ),
            ),
            const SizedBox(width: 15),
            const CommonText(text: 'Асем Амирхан Али'),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          //messages
          Expanded(child: _buildMessageList()),
          //input textfield
          _buildMessageInput(),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  //message list
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.receiverUserID, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text(
            'Loading...',
            style: TextStyle(fontSize: 30),
          );
        }
        return ListView(
          children: snapshot.data!.docs
              .map(
                (document) => _buildMessageItem(document),
              )
              .toList(),
        );
      },
    );
  }

  //variable for saving
  Map<String, dynamic>? previousMessage;
  //message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    // Timestamp в объект DateTime
    DateTime dateTime = data['timestamp'].toDate();
    String time = DateFormat.Hm().format(dateTime);
    String date = DateFormat.yMd().format(dateTime);

    bool showDate = previousMessage == null ||
        previousMessage!['timestamp'].toDate().day != dateTime.day;
    previousMessage = data;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          mainAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
          children: <Widget>[
            //Text(data['senderEmail']),
            if (showDate)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.dark_grey_color))),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(date),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.dark_grey_color))),
                      ),
                    ),
                  ],
                ),
              ),
            ChatMessages(message: data['message']),
            Text(
              time,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  //message input
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: CommonTextField(
                  controller: _messageController,
                  hintText: 'Сообщение',
                  obscureText: false,
                  keyboardType: TextInputType.text,
                ),
              ),
              IconButton(
                onPressed: () {
                  sendMessage();
                  _messageController.clear();
                },
                icon: const Icon(
                  Icons.send,
                  size: 35,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
