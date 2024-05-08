import 'package:flutter/material.dart';

class Recent extends StatefulWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10, // Example: 10 posts
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: postCard(context),
          );
        },
      ),
    );
  }
}

Widget postCard(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.red.shade400, Colors.red.shade800], 
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: Colors.red.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset("assets/Images/avatar.png", height: 40, width: 40),
            ),
            SizedBox(width: 8),
            Text('Karen Singh'),
            Spacer(),
            Text('Just Now'),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Post (also see tweet) - Content shared on social media through a user\'s profile. It can be as simple as a blurb of text, but can also include images, videos, and links to other content. Other users of the social network can like, comment, and share the post.',
        ),
        const SizedBox(height: 8),
        Image.asset("assets/Images/image 5.png", height: 200,width: 200),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(0.0),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red.shade900, Colors.red.shade600],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.message),
                padding: const EdgeInsets.all(0.0),
              ),
              const Text('10'),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(Icons.favorite),
                    padding: const EdgeInsets.all(0.0),
                  ),
                  const Text('122'),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.send),
                padding: const EdgeInsets.all(0.0),
              ),
              IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.bookmark),
                padding: const EdgeInsets.all(0.0),
              ),
              IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.calendar_today),
                padding: const EdgeInsets.all(0.0),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
