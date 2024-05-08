import 'package:flutter/material.dart';
import 'package:sociio/switch_chat_view.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
        padding: EdgeInsets.all(10),
        child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    child: Image.asset("assets/Images/avatar.png"),
                  ),
                  SizedBox(width: 20,),
                  SwitchChatView(),
                  SizedBox(width: 20,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded)),

                ],
              ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Your personal messages are end-to-end-encrypted',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.red,
                            backgroundImage: AssetImage('assets/Images/avatar.png'),
                          ),
                          title: Text(
                            message['sender'],
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            message['message'],
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                message['time'],
                                style: TextStyle(color: Colors.grey),
                              ),
                              if (message['unread']! > 0)
                                CircleAvatar(
                                  radius: 10.0,
                                  backgroundColor: Colors.red,
                                  child: Text(
                                    '${message['unread']}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
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
