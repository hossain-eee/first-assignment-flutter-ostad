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
  //snackbar method
  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Clicked on photo!"),
      ),
    );
  }

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
              readOnly: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.search),
                hintText: "Search",
              ),
            ),

            //photo
            Wrap(
              // spacing: 10,

              children: [
                /* Image.network(
                  "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                  width: 200,

                  // height: 200,
                ),
                Image.network(
                  "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                  width: 200,
                  // height: 200,
                ),
                Image.network(
                  "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                  width: 200,
                  // height: 200,
                ),
                Image.network(
                  "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                  width: 200,
                  // height: 200,
                ),
                Image.network(
                  "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                  width: 200,
                  // height: 200,
                ),
                Image.network(
                  "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                  width: 200,
                  // height: 200,
                ), */
                OutlinedButton(
                  onPressed: () {
                    showSnackBar(context);
                  },
                  child: Column(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        width: 150,
                        // height: 200,
                      ),
                      Text("Caption"),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showSnackBar(context);
                  },
                  child: Column(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        width: 150,
                        // height: 200,
                      ),
                      Text("Caption"),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showSnackBar(context);
                  },
                  child: Column(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        width: 150,
                        // height: 200,
                      ),
                      Text("Caption"),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showSnackBar(context);
                  },
                  child: Column(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        width: 150,
                        // height: 200,
                      ),
                      Text("Caption"),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showSnackBar(context);
                  },
                  child: Column(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        width: 150,
                        // height: 200,
                      ),
                      Text("Caption"),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showSnackBar(context);
                  },
                  child: Column(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        width: 150,
                        // height: 200,
                      ),
                      Text("Caption"),
                    ],
                  ),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Image.network(
                    "https://cdn.bajajauto.com/-/media/Assets/bajajauto/bikes/BikeListing/Pulsar/PulsarNS125.ashx",
                    width: 50,
                  ),
                  title: Text("Sample photo 1"),
                  subtitle: Text("Category 1"),
                ),
                ListTile(
                  leading: Image.network(
                    "https://cdn.bajajauto.com/-/media/Assets/bajajauto/bikes/BikeListing/Pulsar/PulsarNS125.ashx",
                    width: 50,
                  ),
                  title: Text("Sample photo 1"),
                  subtitle: Text("Category 1"),
                ),
                ListTile(
                  leading: Image.network(
                    "https://cdn.bajajauto.com/-/media/Assets/bajajauto/bikes/BikeListing/Pulsar/PulsarNS125.ashx",
                    width: 50,
                  ),
                  title: Text("Sample photo 1"),
                  subtitle: Text("Category 1"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
