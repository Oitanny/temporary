import 'package:flutter/material.dart';

import 'signup_form.dart';
import 'login.dart';

class Let_in extends StatelessWidget {
  const Let_in({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: SizedBox(
                height: 250,
                width: 310,
                child: Image.asset('assets/Images/logo.png')),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SizedBox(
              width: 278,
              height: 50,
              child: ElevatedButton(
          
                style: ElevatedButton.styleFrom(
          
                  backgroundColor: Colors.white.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                ),
                onPressed: () {
                  print("Continue with Facebook");
                },
                child: Row(
                  children: [
                    Image.asset('assets/Images/facebook 2.png'),
                    const Padding(
                      padding: EdgeInsets.only(left: 32.0),
                      child: Text(
                        'Continue with Facebook',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              width: 278,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // <-- Radius
                  ),
                ),
                onPressed: () {
                  print("Continue with Google");
                },
                child: Row(
                  children: [
                    Image.asset('assets/Images/google 1.png'),
                    const Padding(
                      padding: EdgeInsets.only(left: 32.0),
                      child: Text(
                        'Continue with Google',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              width: 278,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                ),
                onPressed: () {
                  print("Continue with Apple");
                },
                child: Row(
                  children: [
                    Image.asset('assets/Images/apple-logo 3.png'),
                    const Padding(
                      padding: EdgeInsets.only(left: 32.0),
                      child: Text(
                        'Continue with Apple',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
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
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const Login()),
                  );
                },
                child: const Text(
                  'Sign in with Password',
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
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don’t have an account?',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      fontFamily: 'OpenSans',
                      color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SignUpForm()));
                  },
                  child: const Text(
                    ' Sign Up',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        fontFamily: 'OpenSans'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          )
                ],
              ),
        ));
  }
}
