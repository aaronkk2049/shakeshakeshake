import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';
void main() {
  runApp(const ShakeApp());
}

class ShakeApp extends StatelessWidget {
  const ShakeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shake for Random Image',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Shake for Random Image'),
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
  int index= 0;
  Random rng= Random();
  List<String> images=["image1.jpg","image2.jpg","image3.jpg","image4.jpg","image5.jpg","image6.jpg",
    "image7.jpg","image8.jpg","image9.jpg","image10.jpg",];
  void initState(){
    super.initState();
    ShakeDetector sd = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        index = rng.nextInt(10);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Image(
        image: AssetImage(images[index]),
        fit: BoxFit.cover,
      ),
    );
  }
}
