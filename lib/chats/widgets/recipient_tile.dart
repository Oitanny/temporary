import 'package:flutter/material.dart';

final List<Map<String, dynamic>> messages = [
  {'sender': 'Anubhav Singh', 'message': 'That was cool', 'time': '14:23', 'unread': 4},
  {'sender': 'Chandrika Singh', 'message': 'That was cool', 'time': '13:23', 'unread': 3},
  {'sender': 'Karen Singh', 'message': 'That was cool', 'time': '13:20', 'unread': 3},
];

class RecipientTile extends StatelessWidget {
  const RecipientTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all( 8),
      decoration: BoxDecoration(
          color: Color(0xFF4a4a4a),

          borderRadius: BorderRadius.circular(20)
      ),
      child: ListTile(

        leading: CircleAvatar(
          backgroundColor: Colors.red,
          backgroundImage: AssetImage('assets/Images/avatar.png'),
        ),
        title: Text(
          messages.first['sender'],
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          messages.first['message'],
          style: TextStyle(color: Colors.grey),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              messages.first['time'],
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 7,),
            if (messages.first['unread']! > 0)
              CircleAvatar(
                radius: 10.0,
                backgroundColor: Colors.red,
                child: Text(
                  '${messages.first['unread']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
