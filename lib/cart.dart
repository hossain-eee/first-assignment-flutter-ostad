import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  int numberOfProduct;
  Cart({super.key, required this.numberOfProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Total Product: $numberOfProduct",
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
