import 'package:farmo_exp/widgets/chat_message.dart';
import 'package:flutter/material.dart';



class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primaryColor: Color(0xFF075E54), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF25D366)),
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Implement more options menu
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat list
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with the actual number of chats
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    // Add user profile image
                    radius: 28,
                  ),
                  title: Text('Contact Name'), // Display contact's name
                  subtitle: Text('Last message'), // Display last message
                  trailing: Text('Time'), // Display message time
                  onTap: () {
                    // Navigate to chat screen
                   Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatMessages() // Navigate to ChatScreen
                   ));
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open contacts or create new chat
          
        },
        child: Icon(Icons.message),
      ),
    );
  }
}









