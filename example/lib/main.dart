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
      debugShowCheckedModeBanner: false,
      title: 'Profile Photo Example',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              ProfilePhoto(
                totalWidth: 75,
                cornerRadius: 75,
                color: Colors.blue,
                outlineColor: Colors.green,
                outlineWidth: 5,
                textPadding: 0,
                name: 'Brad V',
                fontColor: Colors.white,
                nameDisplayOption: NameDisplayOptions.initials,
                fontWeight: FontWeight.w100,
                badgeSize: 30,
                badgeAlignment: Alignment.bottomRight,
                image: const AssetImage('assets/test_profile_photo.jpg'),
                badgeImage: const AssetImage('assets/star.png'),
                onTap: () {
                  // open profile
                },
                onLongPress: () {
                  // popup to message user
                },
              ),
              const SizedBox(height: 50),
              ProfilePhoto(
                totalWidth: 100,
                cornerRadius: 80,
                color: Colors.blue,
                image: const AssetImage('assets/test_profile_photo.jpg'),
              ),
              const SizedBox(height: 50),
              ProfilePhoto(
                totalWidth: 200,
                cornerRadius: 25,
                color: Colors.blue,
                outlineColor: Colors.red,
                outlineWidth: 10,
                textPadding: 10,
                name: 'Brad Varnum',
                fontColor: Colors.white,
                nameDisplayOption: NameDisplayOptions.initials,
                fontWeight: FontWeight.w100,
                showName: true,
                image: const AssetImage('assets/test_profile_photo.jpg'),
                badgeAlignment: Alignment.bottomLeft,
                badgeSize: 60,
                badgeImage: const AssetImage('assets/star.png'),
                onTap: () {
                  // open profile
                },
                onLongPress: () {
                  // popup to message user
                },
              ),
              const SizedBox(height: 50),
              ProfilePhoto(
                totalWidth: 150,
                cornerRadius: 20,
                color: Colors.deepPurple.shade300,
                outlineColor: Colors.cyan,
                outlineWidth: 10,
                textPadding: 15,
                name: 'Brad Varnum',
                fontColor: Colors.white,
                nameDisplayOption: NameDisplayOptions.splitFullName,
                fontWeight: FontWeight.w500,
                showName: true,
              ),
              const SizedBox(height: 0),
            ],
          ),
        ],
      ),
    );
  }
}
