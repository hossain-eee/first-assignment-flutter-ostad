import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  TextEditingController searchTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Gallery"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text("Welcome to My Photo Gallery!"),
            ),
            TextField(
              controller: searchTextEditingController,
              decoration: const InputDecoration(
                icon: Icon(Icons.search),
                hintText: "Search",
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}
