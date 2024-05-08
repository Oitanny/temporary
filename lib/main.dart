import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'get_started.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          storageBucket: "gs://sociio-7b374.appspot.com",
          apiKey:"AIzaSyA6GIW6RTQXXRyTqIIsYVJBIQaK5CTmm1E" ,
          appId: "1:1083862658551:android:22f603582a9161ca9ad2f2",
          messagingSenderId:"1083862658551" ,
          projectId: "sociio-7b374"
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'Sociio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    fun(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 320,
            width: 400,
            margin: const EdgeInsets.only(top: 70),
            child: Image.asset('assets/Images/logo.png'),
          ),
          const Text(
            "an initiative by",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 10,
              color: Colors.white,
              fontFamily: 'assets/fonts/OpenSans-Bold.ttf',
            ),
          ),
          SizedBox(
            height: 50,
            width: 150,
            child: Center(child: Image.asset('assets/Images/bmu_logo.png')),
          ),
          const SizedBox(height: 30),
          const SizedBox(
            height: 300,
            width: 500,
            child: Center(
              child: SpinKitWave(color: Colors.red, size: 50.0),
            ),
          ),
        ],
      ),
    );
  }

  void fun(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const GetStarted()));
    });
  }
}
