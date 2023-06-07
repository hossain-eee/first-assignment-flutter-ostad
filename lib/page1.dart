import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  bool isNavigator;
  Page1({super.key, required this.isNavigator});
  
  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
       backgroundColor: Color.fromARGB(255, 222, 222, 222),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {},
        heroTag: const Text("page1"),//when multiple floating action button swith from single pagee then there is problem occure, to remove use this tag with different value in every floating action button
        child: const Icon(Icons.add),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Page 1",style: TextStyle(fontSize: 28),),
            isNavigator
                ? OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Back to Home Page",  ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
