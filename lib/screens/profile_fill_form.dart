import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:sociio/cacheBuilder/signedInUser_cache.dart';
import 'package:sociio/cacheBuilder/userProvider.dart';
import 'package:sociio/navigation.dart';

import '../Home.dart';
import '../models/user_model.dart';

class ProfileFillForm extends StatefulWidget {
  final String email;
  ProfileFillForm({required this.email});
  @override
  _ProfileFillFormState createState() => _ProfileFillFormState();
}

class _ProfileFillFormState extends State<ProfileFillForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  File? image=null;
  String? _selectedGender;
  String _selectedCountry = 'Select Country';
  String _selectedCountryCode = '';


  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.text=widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fill Your Profile", style: TextStyle(color: Colors.white, fontSize: 17),),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_rounded, color: Colors.white,),),
      ),
      body: SingleChildScrollView(
        child: Container(

          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: (){
                    _pickImage();
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        backgroundImage: image == null ? AssetImage("assets/Images/no_image.jpg") : FileImage(image!) as ImageProvider<Object>?,



                      ),
                       Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(50),
                                
                              ),
                              child:Icon(Icons.edit )))
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(255, 255, 255, 0.3),
                    filled: true,
                    hintText: 'Username',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: const BorderSide(
                        color: Color(0xdcdcdcdc),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                TextFormField(
                  controller: _userIdController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(255, 255, 255, 0.3),

                    hintText: 'User ID',


                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color: Color(0xdcdcdcdc),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color: Colors.redAccent,
                        )),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    fillColor: const Color.fromRGBO(255, 255, 255, 0.3),
                    filled: true,
                    enabledBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(13),
                      borderSide: const BorderSide(
                        color: Color(0xdcdcdcdc),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _bioController,
                  decoration: InputDecoration(
                    hintText: 'Profile Bio',
                    fillColor: const Color.fromRGBO(255, 255, 255, 0.3),
                    filled: true,
                    enabledBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(13),
                      borderSide: const BorderSide(
                        color: Color(0xdcdcdcdc),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                border: Border.fromBorderSide(
                    BorderSide(
                  color: Color(0xdcdcdcdc),
                ),
                ),
                borderRadius: BorderRadius.circular(13)


          ),
              child: Row(
                children: [

                  Expanded(
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        _phoneNumberController.text=number.phoneNumber.toString();
                        // Handle changes to the phone number (optional)
                      },
                      // selectorButtonAsPrefixIcon: true,
                      hintText: 'Enter phone number',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
                SizedBox(height: 20),

                DropdownButtonFormField(
                  value: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text('Male'),
                      value: 'male',
                    ),
                    DropdownMenuItem(
                      child: Text('Female'),
                      value: 'female',
                    ),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Gender',
                    fillColor: const Color.fromRGBO(255, 255, 255, 0.3),
                    filled: true,
                    enabledBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(13),
                      borderSide: const BorderSide(
                        color: Color(0xdcdcdcdc),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    createUser();
                    // Continue button pressed
                  },
                  child: Text('Continue', style: TextStyle(color: Colors.white, fontSize: 16),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> uploadImages(File image) async {
    final storage = FirebaseStorage.instance;
    final imageUrls = <String>[];

    final reference = storage.ref().child('users_avatars/${image.path.split('/').last}');
    final uploadTask = reference.putFile(File(image.path));
    final snapshot = await uploadTask.whenComplete(() => null);
    final url = await snapshot.ref.getDownloadURL();
    return url;
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      for (var pickedFile in result.paths) {
        // Add the picked image to the images list for preview and upload
        setState(() {
          image= (File(pickedFile!));
        });
      }
    }
    print("Picked Images are:\n");
  }

  Future<void> createUser() async{
    final firestore = FirebaseFirestore.instance;
    final postsCollection = firestore.collection('users'); // Replace 'posts' with your collection name

    final timestamp = FieldValue.serverTimestamp(); // Server-side timestamp

    try {
      String url = await uploadImages(image!);

      // Create a User object using the uploaded image URL and other form data
      final user = User(
        uid: _userIdController.text,
        uname: _usernameController.text,
        uemail: _emailController.text,
        uphone: _phoneNumberController.text,
        ugender: _selectedGender!,
        ubio: _bioController.text,
        uavatar: url,
      );

      // Store user data in the local cache (shared preferences)

      // Add user data to Firestore (assuming you have a postsCollection reference)
      await postsCollection.add(user.toMap()).then((value) async {
        await storeSignedInUser(user).then((value) async{
          Provider.of<UserProvider>(context, listen: false).updateUser(user);

          // Update UserProvider with the signed-in user
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("User Added Successfully!", style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.black,
          ),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => Sociio()));
      });
    } catch (e) {
      // Handle errors appropriately (e.g., display an error message to the user)
      print("Error adding user: $e");
    }



  }


}



