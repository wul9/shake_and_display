import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

var imagesUrls = [
  'assets/bernese.jpg',
  'assets/corgi.jpg',
  'assets/dane.jpg',
  'assets/goldie.jpg',
  'assets/husky.jpg',
  'assets/inu.jpg',
  'assets/lab.jpg',
  'assets/malamute.jpg',
  'assets/poodle.jpg',
  'assets/samoyed.jpg',
  'assets/samoyed.jpg'
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shaker',
      home: MyHomePage(title: 'Shake For An Image!'),
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
  Image _img = Image.asset('assets/moon.jpg');
  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(
        onPhoneShake: () => _img =
            Image.asset(imagesUrls[Random().nextInt(imagesUrls.length)]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox.expand(child: FittedBox(fit: BoxFit.fill,child: _img,))
    );
  }
}
