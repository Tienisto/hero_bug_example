import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Hero1Page(),
    );
  }
}

class Hero1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text('Hero1Page'),
          Hero(
            tag: 'hero-button',
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => Hero2Page()));
              },
              child: const Text('Open Hero2Page (This button will stay invisible soon)'),
            ),
          )
        ],
      ),
    );
  }
}

class Hero2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Hero2Page'),
          Hero(
            tag: 'hero-button',
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, PageRouteBuilder(
                  pageBuilder: (context, a1, a2) => EndPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ), (r) => r.isFirst);
              },
              child: const Text('Open EndPage'),
            ),
          )
        ],
      ),
    );
  }
}

class EndPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('EndPage'),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Pop me'),
          ),
        ],
      ),
    );
  }
}
