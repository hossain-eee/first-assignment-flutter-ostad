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
        centerTitle: true,
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Welcome to My Photo Gallery!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //space before search bar
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: searchTextEditingController,
                // readOnly: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  border: OutlineInputBorder()
                ),
              ),
            ),

            //space before image
            SizedBox(height: 15,),
            //photo
            Wrap(
              spacing: 7,
              runSpacing: 7,
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
                        width: 130,

                        // height: 150,
                      ),
                       Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: FractionallySizedBox(
                          widthFactor: 0.6,
                          child: Container(

                            height: 25,
                            // color: Colors.grey.withOpacity(0.4),
                            color: Colors.blueGrey.withOpacity(0.4),
                            child: const Center(
                              child: Text(
                                "Caption",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
                  ),
                  onPressed: () {
                    showSnackBar(context, "Clicked on photo!");
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        // "https://www.bmwgroup.com/content/dam/grpw/websites/bmwgroup_com/brands/einstiegsseite/1280x854_P90351044_highRes_the-new-bmw-8-series.jpg",
                        width: 130,

                        // height: 150,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: FractionallySizedBox(
                          widthFactor: 0.6,
                          child: Container(

                            height: 25,
                            // color: Colors.grey.withOpacity(0.4),
                            color: Colors.blueGrey.withOpacity(0.4),
                            child: const Center(
                              child: Text(
                                "Caption",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
                  ),
                  onPressed: () {
                    showSnackBar(context, "Clicked on photo!");
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        // "https://www.bmwgroup.com/content/dam/grpw/websites/bmwgroup_com/brands/einstiegsseite/1280x854_P90351044_highRes_the-new-bmw-8-series.jpg",
                        width: 130,

                        // height: 150,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: FractionallySizedBox(
                          widthFactor: 0.6,
                          child: Container(

                            height: 25,
                            // color: Colors.grey.withOpacity(0.4),
                            color: Colors.blueGrey.withOpacity(0.4),
                            child: const Center(
                              child: Text(
                                "Caption",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
                  ),
                  onPressed: () {
                    showSnackBar(context, "Clicked on photo!");
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        // "https://www.bmwgroup.com/content/dam/grpw/websites/bmwgroup_com/brands/einstiegsseite/1280x854_P90351044_highRes_the-new-bmw-8-series.jpg",
                        width: 130,

                        // height: 150,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: FractionallySizedBox(
                          widthFactor: 0.6,
                          child: Container(

                            height: 25,
                            // color: Colors.grey.withOpacity(0.4),
                            color: Colors.blueGrey.withOpacity(0.4),
                            child: const Center(
                              child: Text(
                                "Caption",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
                  ),
                  onPressed: () {
                    showSnackBar(context, "Clicked on photo!");
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        // "https://www.bmwgroup.com/content/dam/grpw/websites/bmwgroup_com/brands/einstiegsseite/1280x854_P90351044_highRes_the-new-bmw-8-series.jpg",
                        width: 130,

                        // height: 150,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: FractionallySizedBox(
                          widthFactor: 0.6,
                          child: Container(

                            height: 25,
                            // color: Colors.grey.withOpacity(0.4),
                            color: Colors.blueGrey.withOpacity(0.4),
                            child: const Center(
                              child: Text(
                                "Caption",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
                  ),
                  onPressed: () {
                    showSnackBar(context, "Clicked on photo!");
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/2676096/pexels-photo-2676096.jpeg?auto=compress&cs=tinysrgb&w=300",
                        // "https://www.bmwgroup.com/content/dam/grpw/websites/bmwgroup_com/brands/einstiegsseite/1280x854_P90351044_highRes_the-new-bmw-8-series.jpg",
                        width: 130,

                        // height: 150,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: FractionallySizedBox(
                          widthFactor: 0.6,
                          child: Container(

                            height: 25,
                            // color: Colors.grey.withOpacity(0.4),
                            color: Colors.blueGrey.withOpacity(0.4),
                            child: const Center(
                              child: Text(
                                "Caption",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
