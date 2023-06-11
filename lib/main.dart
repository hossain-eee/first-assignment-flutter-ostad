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
  void showSnackBar(BuildContext context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(milliseconds: 500),
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
              spacing: 5,
              runSpacing: 5,
              children: [

                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    // alignment: Alignment.topLeft,
                    padding: EdgeInsets.zero,

                  ),
                  onPressed: () {
                    showSnackBar(context, "Clicked on photo!");
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        // "https://www.bmwgroup.com/content/dam/grpw/websites/bmwgroup_com/brands/einstiegsseite/1280x854_P90351044_highRes_the-new-bmw-8-series.jpg",
                        width: 100,

                        // height: 200,
                      ),
                       const Positioned(
                        bottom: 5,
                        left: 0,
                        right: 0,
                        child: Text(
                          "Caption",
                          textAlign: TextAlign.center,
                          style: TextStyle(

                            color: Colors.white,




                          ),
                        ),
                      )
                    ],
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    // alignment: Alignment.topLeft,
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.cyan,
                  ),
                  onPressed: () {
                    showSnackBar(context, "Clicked on photo!");
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        // "https://www.bmwgroup.com/content/dam/grpw/websites/bmwgroup_com/brands/einstiegsseite/1280x854_P90351044_highRes_the-new-bmw-8-series.jpg",
                        width: 100,

                        // height: 200,
                      ),
                      Positioned(
                        bottom: 5,
                        left: 0,
                        right: 0,
                        child: Text(
                          "Caption",
                          textAlign: TextAlign.center,
                          style: TextStyle(

                            color: Colors.white,


                          ),
                        ),
                      )
                    ],
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    // alignment: Alignment.topLeft,
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.cyan,
                  ),
                  onPressed: () {
                    showSnackBar(context, "Clicked on photo!");
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        // "https://www.bmwgroup.com/content/dam/grpw/websites/bmwgroup_com/brands/einstiegsseite/1280x854_P90351044_highRes_the-new-bmw-8-series.jpg",
                        width: 100,

                        // height: 200,
                      ),
                      Positioned(
                        bottom: 5,
                        left: 0,
                        right: 0,
                        child: Text(
                          "Caption",
                          textAlign: TextAlign.center,
                          style: TextStyle(

                            color: Colors.white,


                          ),
                        ),
                      )
                    ],
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    // alignment: Alignment.topLeft,
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.cyan,
                  ),
                  onPressed: () {
                    showSnackBar(context, "Clicked on photo!");
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        // "https://www.bmwgroup.com/content/dam/grpw/websites/bmwgroup_com/brands/einstiegsseite/1280x854_P90351044_highRes_the-new-bmw-8-series.jpg",
                        width: 100,

                        // height: 200,
                      ),
                      Positioned(
                        bottom: 5,
                        left: 0,
                        right: 0,
                        child: Text(
                          "Caption",
                          textAlign: TextAlign.center,
                          style: TextStyle(

                            color: Colors.white,


                          ),
                        ),
                      )
                    ],
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    // alignment: Alignment.topLeft,
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.cyan,
                  ),
                  onPressed: () {
                    showSnackBar(context, "Clicked on photo!");
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        // "https://www.bmwgroup.com/content/dam/grpw/websites/bmwgroup_com/brands/einstiegsseite/1280x854_P90351044_highRes_the-new-bmw-8-series.jpg",
                        width: 100,

                        // height: 200,
                      ),
                      Positioned(
                        bottom: 5,
                        left: 0,
                        right: 0,
                        child: Text(
                          "Caption",
                          textAlign: TextAlign.center,
                          style: TextStyle(

                            color: Colors.white,


                          ),
                        ),
                      )
                    ],
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    // alignment: Alignment.topLeft,
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.cyan,
                  ),
                  onPressed: () {
                    showSnackBar(context, "Clicked on photo!");
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        // "https://www.bmwgroup.com/content/dam/grpw/websites/bmwgroup_com/brands/einstiegsseite/1280x854_P90351044_highRes_the-new-bmw-8-series.jpg",
                        width: 100,

                        // height: 200,
                      ),
                      Positioned(
                        bottom: 5,
                        left: 0,
                        right: 0,
                        child: Text(
                          "Caption",
                          textAlign: TextAlign.center,
                          style: TextStyle(

                            color: Colors.white,


                          ),
                        ),
                      )
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
                    // "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                    width: 50,
                  ),
                  title: Text("Sample photo 1"),
                  subtitle: Text("Category 1"),
                ),
                ListTile(
                  leading: Image.network(
                    "https://cdn.bajajauto.com/-/media/Assets/bajajauto/bikes/BikeListing/Pulsar/PulsarNS125.ashx",
                    // "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                    width: 50,
                  ),
                  title: Text("Sample photo 2"),
                  subtitle: Text("Category 2"),
                ),
                ListTile(
                  leading: Image.network(
                    "https://cdn.bajajauto.com/-/media/Assets/bajajauto/bikes/BikeListing/Pulsar/PulsarNS125.ashx",
                    // "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                    width: 50,
                  ),
                  title: Text("Sample photo 3"),
                  subtitle: Text("Category 3"),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: IconButton(
                alignment: Alignment.bottomRight,
                onPressed: () {
                  showSnackBar(context, "Photos Uploaded Successfully!");
                },
                icon: Icon(
                  Icons.cloud_upload,
                  color: Colors.blue,
                  size: 50,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
