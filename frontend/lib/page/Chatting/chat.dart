import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(sender: 'User', text: 'Hello!'),
    Message(sender: 'Bot', text: 'Hi!'),
  ];

  TextEditingController _textEditingController = TextEditingController();

  void _sendMessage() {
    String text = _textEditingController.text;

    if (text.isNotEmpty) {
      setState(() {
        messages.insert(0, Message(sender: 'User', text: text));
        // Bagian BackEnd
      });
      _textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
                // Profile Picture nang ngisor iki bang !!!!
                // backgroundImage: AssetImage(''),
                ),
            SizedBox(width: 8.0),
            Text(
              'Agil', // Nama Chat
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(messages[index]);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Ketik Pesan .....',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    final isUser = message.sender == 'User';

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width *
              0.7, // Set maximum width to 70% of screen width
        ),
        decoration: BoxDecoration(
          color: isUser ? Color.fromARGB(255, 105, 192, 255) : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
            bottomLeft: isUser ? Radius.circular(16.0) : Radius.circular(0.0),
            bottomRight: isUser ? Radius.circular(0.0) : Radius.circular(16.0),
          ),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
}

void main() {
  runApp(MaterialApp(
    home: ChatScreen(),
  ));
}
