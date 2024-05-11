import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sociio/models/post_model.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  final Post post;
  const PostWidget({required this.post});
  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late final Post post; // Declare 'post' as 'late'
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    post = widget.post; // Access 'post' within initState
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: EdgeInsets.all( 30),
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
              Text(post.postedBy),
              Spacer(),
              Text(getRelativeTimeText(getDifferenceInMinutes(post.postedOn.toDate()))),

              // Text(post.postedOn.toString()),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            post.description.toString()
          ),
          const SizedBox(height: 8),
          // Image.network("assets/Images/image 5.png", height: 200,width: 200),
          Stack(
          children: [
          CarouselSlider(
          items: post.images.map((imageUrl) {
    return Container(
      height: 200,
    width: 200,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16.0),
    image: DecorationImage(
    image: NetworkImage(imageUrl, ),
    fit: BoxFit.cover,
    ),
    ),
    );
    }).toList(),
    carouselController: CarouselController(),
    options: CarouselOptions(
    height: MediaQuery.of(context).size.height / 3,
    viewportFraction: 1.0,
    enableInfiniteScroll: post.images.length > 1,
    onPageChanged: (index, reason) => (() => _currentImageIndex = index),
    ),
    ),
    Positioned(
    bottom: 20.0,
    left: 0,
    right: 0,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: post.images.asMap().entries.map((entry) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: Container(
    width: 8.0,
    height: 8.0,
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: _currentImageIndex == entry.key ? Colors.white : Colors.grey,
    ),
    ),
    );
    }).toList(),
    ),
    ),
    ],
    ),
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
                Text(post.comments.length.toString()),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(Icons.favorite),
                      padding: const EdgeInsets.all(0.0),
                    ),
                    Text(post.likes.toString()),
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
    // return Container(
    //   // Your widget design here
    //   child: Column(
    //     children: [
    //       Text(post.date),
    //       Text(post.description),
    //       Text(post.hashtags),
    //       if (post.images.isNotEmpty)
    //         Image.network(post.images[0]), // Display only the first image
    //       Text(post.postedBy),
    //       Text(post.time),
    //     ],
    //   ),
    // );

  }
  int getDifferenceInMinutes(DateTime postDateTime) {
    final now = DateTime.now();
    final difference = now.difference(postDateTime);
    return difference.inMinutes.abs(); // Get absolute value of minutes
  }
  String getRelativeTimeText(int minutes) {
    if (minutes == 0) {
      return 'just now';
    } else if (minutes < 60) {
      return '$minutes minute${minutes > 1 ? 's' : ''} ago';
    } else if (minutes < 120) {
      return '1 hour ago';
    } else {
      final hours = (minutes / 60).floor();
      return '$hours hour${hours > 1 ? 's' : ''} ago';
    }
  }

}