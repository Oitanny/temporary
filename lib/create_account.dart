import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'login.dart';
import 'navigation.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  var emailText = TextEditingController();
  var passText = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                    height: 250,
                    width: 400,
                    child: Image.asset('assets/Images/logo.png')),
              ),
              const Text(
                "Create Your Account",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: 'assets/fonts/OpenSans-Bold.ttf'),
              ),

              // Email
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: 278,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailText,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an email';
                      }
                      if (!isBMUEmail(value)) {
                        return 'Email must end with @bmu.edu.in';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email ID',
                      filled: true,
                      fillColor: const Color.fromRGBO(255, 255, 255, 0.3),
                      prefixIcon: const Icon(
                        Icons.mail,
                        color: Colors.redAccent,
                      ),
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
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 278,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passText,
                      obscureText: true,
                      validator: (value){
                        if (value!.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        // You can add more complex validation criteria here
                        // For example, checking for the presence of special characters
                        // using a regular expression:
                        // if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                        //   return 'Password must contain special characters';
                        // }
                        return null; // Return null if the password is valid

                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        filled: true,
                        fillColor: const Color.fromRGBO(255, 255, 255, 0.3),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.redAccent,
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.remove_red_eye_outlined,
                          ),
                          onPressed: () {},
                        ),
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
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      value: isChecked,
                      activeColor: Colors.lightBlueAccent,
                      onChanged: (newBool) {
                        setState(() {
                          isChecked = newBool;
                        });
                      }),
                  const Text(
                    'Remember Me',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        fontFamily: 'OpenSans'),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: 250,
                  height: 49,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(39.32),
                      ),
                    ),
                    onPressed: () async {
                      String uEmail = emailText.text.toString();
                      String upass = passText.text;

                      print("Email: $uEmail, Password: $upass");
                      if (_formKey.currentState!.validate()) {
                        try{
                          FirebaseAuth auth=FirebaseAuth.instance;
                          FirebaseFirestore firestoreInstance=FirebaseFirestore.instance;
                          var response=await auth.createUserWithEmailAndPassword(email: uEmail, password: upass);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                const Sociio()),
                          );
                        } on FirebaseAuthException catch (exc){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(exc.toString())));
                          print("Error in sign up: ${exc}");

                        }
                        catch(e){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())));
                          print("Error in: ${e}");
                        }

                      }},
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 130,
                      height: 0.5,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Text(
                        'or',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 130,
                      height: 0.5,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Image.asset('assets/Images/facebook 2.png'),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25.0, right: 20, left: 20),
                    child: Image.asset('assets/Images/google 1.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Image.asset('assets/Images/apple-logo 3.png'),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          fontFamily: 'OpenSans',
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Login()));
                      },
                      child: const Text(
                        ' Sign In',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            fontFamily: 'OpenSans'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  bool isBMUEmail(String email) {
    RegExp regex = RegExp(r"@[Bb][Mm][Uu]\.edu\.in$");
    return regex.hasMatch(email);
  }

}
