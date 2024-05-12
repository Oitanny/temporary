
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociio/cacheBuilder/message_cache.dart';
import 'package:sociio/cacheBuilder/userProvider.dart';
import 'package:sociio/chats/services/chat_service.dart';
import 'package:sociio/chats/widgets/recipient_tile.dart';
import 'package:sociio/models/chat_model.dart';
import 'package:sociio/models/user_model.dart';
import 'package:sociio/switch_chat_view.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  User? user;
  List<Map<String, dynamic>>? messagesAll;
  List<Map<String, dynamic>> messages = [];

  // final List<Map<String, String>> pinnedContacts = [
  //   {'name': 'Kim', 'avatar': 'assets/Images/avatar.png'},
  //   {'name': 'Steve', 'avatar': 'assets/Images/steve.jpeg'},
  //   {'name': 'Mia', 'avatar': 'assets/Images/mia.jpeg'},
  // ];

  List<ChatMessage> cachedMessages=[];

  // final List<Map<String, dynamic>> messages = [
  //   {'sender': 'Anubhav Singh', 'message': 'That was cool', 'time': '14:23', 'unread': 4},
  //   {'sender': 'Chandrika Singh', 'message': 'That was cool', 'time': '13:23', 'unread': 3},
  //   {'sender': 'Karen Singh', 'message': 'That was cool', 'time': '13:20', 'unread': 3},
  // ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final userProvider = Provider.of<UserProvider>(context);
    user = userProvider.user;

  }
  Future<void> _loadCachedMessages() async {
    final messages = await ChatCacheService().getAllLatestMessages();
    setState(() {
      cachedMessages = messages;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCachedMessages();

  }





  @override
  Widget build(BuildContext context) {
    print(cachedMessages);
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),

      body:
      Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(8),
        child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user!.uavatar),
                  ),
                  SizedBox(width: 20,),
                  Text("Messages", style: TextStyle(fontSize: 20),),
                  // SwitchChatView(),
                  SizedBox(width: 20,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded), style: IconButton.styleFrom(
                    shape: CircleBorder(side: BorderSide(color: Color(0xFF4a4a4a)),  ), backgroundColor:Color(0xFF4a4a4a)
                  ),),

                ],
              ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your personal messages are',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        Text(
                          ' end-to-end-encrypted',
                          style: TextStyle(color: Colors.red, fontSize: 13),
                        ),

                      ],
                    ),
                  ),
                  Divider(color: Color.fromRGBO(255, 255, 255, 0.2), thickness: 0.5,),
              cachedMessages.isEmpty
                  ? Container(child: Center(child: Text('You haven\'t sent any messages so far...'))) // Show placeholder
                  :
              Expanded(
                    child: ListView.builder(
                      itemCount: cachedMessages.length,
                      itemBuilder: (context, index) {
                        final message = cachedMessages[index];
                        return RecipientTile(otherUser: message.senderId, latestMsg: message.message, timestamp: message.timestamp);
                      },
                    ),
                  ),


            ],
          )

      ),

    );
  }
}
