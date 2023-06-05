import 'dart:convert';

import 'package:ai_app/api_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'CustomShape.dart';

class ChatGPTScreen extends StatefulWidget {
  @override
  _ChatGPTScreenState createState() => _ChatGPTScreenState();
}

class _ChatGPTScreenState extends State<ChatGPTScreen> {
  final List<Message> _messages = [];

  final TextEditingController _textEditingController = TextEditingController();

  void onSendMessage() async {
    Message message = Message(text: _textEditingController.text, isMe: true);

    _textEditingController.clear();

    setState(() {
      _messages.insert(0, message);
    });

    String response = await sendMessageToChatGpt(message.text);

    Message chatGpt = Message(text: response, isMe: false);

    setState(() {
      _messages.insert(0, chatGpt);
    });
  }

  Future<String> sendMessageToChatGpt(String message) async {
    Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");

    Map<String, dynamic> body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": message}
      ],
      "max_tokens": 500,
    };

    final response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer ${APIKey.apiKey}",
      },
      body: json.encode(body),
    );

    print(response.body);

    Map<String, dynamic> parsedReponse = json.decode(response.body);

    String reply = parsedReponse['choices'][0]['message']['content'];
    reply = utf8.decode(reply.runes.toList()); // Türkçe karakterleri çözümle

    return reply;
  }

  Widget _buildMessage(Message message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment:
          message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message.isMe ? 'Sen' : 'Yapay Zeka',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: message.isMe ? Color(0xFF5C469C) : Color(0xFF1D267D),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                message.text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4ADFC),
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF0C134F),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "AFET TOOLS",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontFamily: "MonomaniacOne-Regular",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF0C134F),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    style: TextStyle(color: Colors.white), // Input alanı yazı rengi
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      hintText: 'Mesajınızı giriniz',
                      hintStyle: TextStyle(color: Colors.white54), // Hint yazı rengi
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.white), // İcon rengi
                  onPressed: onSendMessage,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}
