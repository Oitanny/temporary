import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociio/cacheBuilder/userProvider.dart';
import 'package:sociio/chats/widgets/recipient_tile.dart';
import 'package:sociio/models/user_model.dart';
import 'package:sociio/switch_chat_view.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  User? user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final userProvider = Provider.of<UserProvider>(context);
    user = userProvider.user;
    print(user);
  }

  final List<Map<String, String>> pinnedContacts = [
    {'name': 'Kim', 'avatar': 'assets/Images/avatar.png'},
    {'name': 'Steve', 'avatar': 'assets/Images/steve.jpeg'},
    {'name': 'Mia', 'avatar': 'assets/Images/mia.jpeg'},
  ];

  final List<Map<String, dynamic>> messages = [
    {'sender': 'Anubhav Singh', 'message': 'That was cool', 'time': '14:23', 'unread': 4},
    {'sender': 'Chandrika Singh', 'message': 'That was cool', 'time': '13:23', 'unread': 3},
    {'sender': 'Karen Singh', 'message': 'That was cool', 'time': '13:20', 'unread': 3},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      //   title: Text(
      //     'Messages',
      //     style: TextStyle(
      //       color: Colors.white, 
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   actions: [
      //     GestureDetector(
      //       onTap: () {
      //       },
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //       ),
      //     ),
      //     GestureDetector(
      //       onTap: () {
      //       },
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //          
      //       ),
      //     ),
      //     // IconButton(
      //     //   icon: Icon(
      //     //     Icons.search,
      //     //     color: Colors.white,
      //     //   ),
      //     //   onPressed: () {},
      //     // ),
      //   ],
      // ),
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
                  Expanded(
                    child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return RecipientTile();
                      },
                    ),
                  ),


            ],
          )
      
      ),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Text(
      //         'Your personal messages are end-to-end-encrypted',
      //         style: TextStyle(color: Colors.grey),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //       child: Text(
      //         'PINNED',
      //         style: TextStyle(
      //           color: Colors.red,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ),
      //     SizedBox(height: 8.0),
      //     SingleChildScrollView(
      //       scrollDirection: Axis.horizontal,
      //       child: Row(
      //         children: pinnedContacts.map((contact) {
      //           return Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //             child: Column(
      //               children: [
      //                 CircleAvatar(
      //                   radius: 36.0, 
      //                   backgroundImage: AssetImage(contact['avatar']!),
      //                   backgroundColor: Colors.transparent,
      //                 ),
      //                 SizedBox(height: 8.0),
      //                 Text(
      //                   contact['name']!,
      //                   style: TextStyle(color: Colors.white),
      //                 ),
      //               ],
      //             ),
      //           );
      //         }).toList(),
      //       ),
      //     ),
      //     SizedBox(height: 16.0),
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: messages.length,
      //         itemBuilder: (context, index) {
      //           final message = messages[index];
      //           return ListTile(
      //             leading: CircleAvatar(
      //               backgroundColor: Colors.red,
      //               backgroundImage: AssetImage('assets/Images/avatar.png'), 
      //             ),
      //             title: Text(
      //               message['sender'],
      //               style: TextStyle(color: Colors.white),
      //             ),
      //             subtitle: Text(
      //               message['message'],
      //               style: TextStyle(color: Colors.grey),
      //             ),
      //             trailing: Column(
      //               crossAxisAlignment: CrossAxisAlignment.end,
      //               children: [
      //                 Text(
      //                   message['time'],
      //                   style: TextStyle(color: Colors.grey),
      //                 ),
      //                 if (message['unread']! > 0)
      //                   CircleAvatar(
      //                     radius: 10.0,
      //                     backgroundColor: Colors.red,
      //                     child: Text(
      //                       '${message['unread']}',
      //                       style: TextStyle(
      //                         color: Colors.black,
      //                         fontSize: 12.0,
      //                       ),
      //                     ),
      //                   ),
      //               ],
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
