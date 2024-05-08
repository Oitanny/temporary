import 'package:flutter/material.dart';
import 'login.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _logoutClicked = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181A1C),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image.asset(
                'assets/Images/setbg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 48,
                          backgroundImage: AssetImage('assets/Images/avatar.png'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'John Doe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '@JohnDoe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Text(
                            'My name is Catherine. I like dancing in the rain and travelling all around the world.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildButton(context, Icons.camera, 'Change profile picture'),
                  const SizedBox(height: 15),
                  buildButton(context, Icons.edit, 'Change Status'),
                  const SizedBox(height: 15),
                  buildButton(context, Icons.bookmark, 'Saved Posts'),
                  const SizedBox(height: 15),
                  buildButton(context, Icons.security, 'Privacy & Security'),
                  const SizedBox(height: 15),
                  buildButton(context, Icons.notifications, 'Notifications & Sounds'),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    child: ElevatedButton(
                      onPressed: _logoutClicked
                          ? null 
                          : () {
                              setState(() {
                                _logoutClicked = true;
                              });
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                                (route) => false,
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _logoutClicked ? Colors.red : const Color(0xFFF05D5E).withOpacity(0.60),
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text(
                        'Log out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context, IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
