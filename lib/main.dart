import 'package:flutter/material.dart';
import 'package:tab_bar_view/page1.dart';
import 'package:tab_bar_view/page2.dart';
import 'package:tab_bar_view/page3.dart';

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
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  //method for onTap(index change)
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 222, 222, 222),
        appBar: AppBar(
          title: const Text("Assignment App"),
          centerTitle: true,
        ),
        //bottomNavigation with TabBar()
        bottomNavigationBar: Card(
          margin: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),

          color: Color.fromARGB(255, 0, 116, 105),

          shadowColor: Colors.orange,
          //apply TabBar()
          child: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: 'Page 1',
            ),
            Tab(
              icon: Icon(Icons.business),
              text: 'Page 2',
            ),
            Tab(
              icon: Icon(Icons.school),
              text: 'Page 3',
            ),
          ]),
        ),

        //drawer
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                padding: const EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  accountName: const Text("Flutter"),
                  accountEmail: const Text("flutter@gmail.com"),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  currentAccountPicture: Image.network(
                    "https://mdevelopers.com/storage/0_flutterheader_0c3ac92d.png",
                  ),
                  onDetailsPressed: () {
                    print("profile info");
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Page 1"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Page1(
                                isNavigator: true,
                              ))); //add boolean to set condition in page1()
                },
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text("Page 2"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Page2(
                                isNavigator: true,
                              ))); //add boolean to set condition in page2()
                },
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text("Page 3"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Page3(
                                isNavigator: true,
                              ))); //add boolean to set condition in page3()
                },
              )
            ],
          ),
        ),
        body: TabBarView(
          // index: _selectedIndex,
          children: <Widget>[
            Page1(isNavigator: false),
            Page2(isNavigator: false),
            Page3(isNavigator: false),
          ],
        ),
      ),
    );
  }
}
