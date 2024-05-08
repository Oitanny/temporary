import 'package:flutter/material.dart';
import 'recent.dart';
import 'settings.dart'; 
import 'notification.dart'; 
import 'search_post.dart'; 
import 'create_post.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 18.0), 
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/Images/avatar.png'),
                  ),
                ),
              ),
              const Text('Good Morning, Karen'),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, right: 0.0),
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.0, right: 4.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SearchPostPage()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12.0), 
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.search),
                              SizedBox(width: 12.0),
                              Text('Search posts...'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreatePostScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0), 
                        ),
                        backgroundColor: Colors.red, 
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
                        child: Row(
                          children: const [
                            Icon(Icons.add, color: Colors.white), 
                            SizedBox(width: 3.0),
                            Text('Create Post', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              tabTop(context),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Recent(),
          Center(child: Text('Achievements tab content')),
          Center(child: Text('Events tab content')),
        ],
      ),
    );
  }

  Widget tabTop(BuildContext context) {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      indicator: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        color: Colors.red,
      ),
      tabs: const [
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text('Recent'),
          ),
        ),
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text('Achievements'),
          ),
        ),
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text('Events'),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
