import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'render_fetch_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//initialize the variable for weather data
  String description = "";
  String location = "";
  String icon =
      "01n"; //default icon code to avoid error, until get actual icon code from server.
  double temp = 0.0;
  double temp_min = 0.0;
  double temp_max = 0.0;
  int update_time = 0; //dt
  bool isProgress = false;
  bool isError = false;
  late double latitude;
  /*  = 23.811056; */ //default if loaded delay then load it, dhaka
  late double longitude;
  /* =
      90.407608; */ //default if loaded delay then load it, dhaka
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //api fetch method

    getCurrentPosition();
    print("Api Calling");
  }

  //get data by api calling

  void getWeatherDataApiFetch(double lat, double lon) async {
    isProgress = true;
    setState(() {});
    try {
      Response response = await get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=e2351c130c41ae0f6209a33fd6d47744"),
      );
      Map<String, dynamic> data = jsonDecode(response.body);

      description = data['weather'][0]['description'];
      icon = data['weather'][0]['icon'];
      location = data["name"];
      temp = data['main']['temp'];
      temp_max = data['main']['temp_max'];
      temp_min = data['main']['temp_min'];
      update_time = data['dt'];

      tempConversion();
      unixToTimeConvert();
    } catch (e) {
      isError = true;
      print("error Message for me:$e");
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            titlePadding: const EdgeInsets.only(left: 16),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Warning",
                ),
                IconButton(
                    onPressed: () {
                      getCurrentPosition();
                      setState(() {});
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.refresh)),
              ],
            ),
            content: const Text(
              "Error! Data can't be load",
              style: TextStyle(color: Colors.red),
            ),
            contentPadding: const EdgeInsets.only(left: 16),
            actions: [
              IconButton(
                onPressed: () {
                  // SystemNavigator.pop(); //close the app
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          );
        },
      );
    }
    isProgress = false;
    setState(() {});
  }

  //server provide kelvin, kelvin to celsius conversion
  tempConversion() {
    temp = temp - 273.15;
    temp_min = temp_min - 273.15;
    temp_max = temp_max - 273.15;
  }

//utc to local time conversion
  String unixToTimeConvert() {
    int unixTimestamp = update_time; // Example Unix timestamp
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    DateTime localDateTime = dateTime.toLocal();

    String formattedTime = DateFormat('hh:mm a').format(localDateTime);
    print("Local time: $formattedTime");
    return formattedTime;
  }

  void getCurrentPosition() async {
    isProgress = true;
    isError = false;
    setState(() {});
    //permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("Permission not given");
      Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      print("Latitude : " + currentPosition.latitude.toString());
      print("Longitude :" + currentPosition.longitude.toString());
      latitude = currentPosition.latitude;
      longitude = currentPosition.longitude;
    }
    //call api fetchi method
    getWeatherDataApiFetch(latitude, longitude);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //vertical space between widget
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Weather"),
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: const Color.fromARGB(255, 124, 81, 254),

        actions: [
          IconButton(
              onPressed: () {
                //refresh the data
                getCurrentPosition();
              },
              icon: const Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                //refresh the data
                getCurrentPosition();
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 80, 47, 166),
              Color.fromARGB(255, 80, 47, 166),
              Color.fromARGB(255, 81, 48, 167),
              Color.fromARGB(255, 81, 48, 167),
              Color.fromARGB(255, 86, 53, 171),
              Color.fromARGB(255, 86, 53, 171),
              Color.fromARGB(255, 86, 53, 171),
              Color.fromARGB(255, 86, 53, 171),
              Color.fromARGB(255, 100, 57, 181),
              Color.fromARGB(255, 123, 83, 191),
              Color.fromARGB(255, 139, 106, 199),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        //fetch data insert, if error occurs then display error text unless load all data
        child: isError
            ? const Center(
                child: Text(
                  "Error, can't load data",
                  style: TextStyle(fontSize: 20, color: Colors.white38),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child:
                      isProgress //when data is fetching(its take time) then insted of show blank screen show loading indicator
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : RenderingFetchData(
                              //data fetch complete now render the data
                              location: location,
                              description: description,
                              icon: icon,
                              size: size,
                              temp: temp,
                              temp_max: temp_max,
                              temp_min: temp_min,
                              unixToTimeConvert: unixToTimeConvert),
                ),
              ),
      ),
    );
  }
}
