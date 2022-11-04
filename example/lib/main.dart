import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Photo Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('profile_photo example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfilePhoto(
              radius: 100,
              color: Colors.blue,
              outlineColor: Colors.orange,
              outlineWidth: 10,
              textPadding: 10,
              name: 'Brad Varnum',
              fontColor: Colors.white,
              nameDisplayOption: NameDisplayOptions.lastName,
              fontWeight: FontWeight.bold,
            ),
            
          ],
        ),
      ),
      
    );
  }
}
