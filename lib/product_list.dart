import 'package:assignment_module_7/cart.dart';
import 'package:flutter/material.dart';
import 'package:assignment_module_7/product.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int totalItemCount = 0;
  //list of item
  List<Product> productList = [
    Product(name: "Product 1", price: 1.5, itemCount: 0),
    Product(name: "Product 2", price: 2.5, itemCount: 0),
    Product(name: "Product 3", price: 3.5, itemCount: 0),
    Product(name: "Product 4", price: 4.5, itemCount: 0),
    Product(name: "Product 5", price: 5.5, itemCount: 0),
    Product(name: "Product 6", price: 6.5, itemCount: 0),
    Product(name: "Product 7", price: 7.5, itemCount: 0),
    Product(name: "Product 8", price: 8.5, itemCount: 0),
    Product(name: "Product 9", price: 9.5, itemCount: 0),
    Product(name: "Product 10", price: 10.5, itemCount: 0),
    Product(name: "Product 11", price: 11.5, itemCount: 0),
    Product(name: "Product 12", price: 12.5, itemCount: 0),
    Product(name: "Product 13", price: 13.5, itemCount: 0),
    Product(name: "Product 14", price: 14.5, itemCount: 0),
    Product(name: "Product 15", price: 15.5, itemCount: 0),
    Product(name: "Product 16", price: 16.5, itemCount: 0),
    Product(name: "Product 17", price: 18.5, itemCount: 0),
    Product(name: "Product 19", price: 19.5, itemCount: 0),
    Product(name: "Product 20", price: 20.5, itemCount: 0),
  ];

  //store selected productItem name by button click
  List<String> selectedProductNames = [];


  //method for all the operation by Button Click
  void operation(Product product) {

     //add selected product name to the list by button click
    selectedProductNames.add(product.name);
   
    /* ########## get unique name and their number of selection ###########################*/
      //set to store unique name
    Set<String> uniqueProductNames = {};
    //loop to store product name form list to set
    for (String productName in selectedProductNames) {
      uniqueProductNames.add(productName);
    }
    //map to store unique Product as key and its count as value
    Map<String, int> duplicateProductNames = {};
    //compare with uniquesProductNames (set) and productList(list)
    for (String productName in uniqueProductNames) {
      //count for duplicate
      int count = 0;
      for (String product in selectedProductNames) {
        if (productName == product) {
          count++;
        }
        //add this productName as key and count as value of map
        duplicateProductNames[productName] = count;
      } //for
    } //for

    // Print the duplicate product names and the number of times they appear.
    duplicateProductNames.forEach((key, value) {
      
      print("Key:${key}, value: ${value}");
    });

    // print(uniqueProductNames);
    print("duplicate in Map: $duplicateProductNames");


    /*####################  End unique name ########################## */


    //item count increase by click button
    product.itemCount++;
    //number of total product count
    totalItemCount++;

    //condition for alert dialog
    if (totalItemCount == 5) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Congratulations!"),
              
               content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("You've bought 5 products"),
                    ...duplicateProductNames.entries.map((entry) {
            String key = entry.key;
            String value = entry.value.toString();
            return Text("$key ($value)");
          }).toList(),
                ],
              ), 
              actions: [
                TextButton(
                  onPressed: () {
                    //back to previous screen
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          //map() to iterate the productList item
          ...productList.map((product_index) {
            return ListTile(
              title: Text(product_index.name),
              subtitle: Text("\$${product_index.price}"),
              trailing: Column(
                children: [
                  Text("Counter: ${product_index.itemCount}"),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          //need index to increase a specific list item count, so put the map method object, because its iterating over the list one by one
                          // countItem(productList[0]); // first item, count increase
                          operation(
                              product_index); // dynamic index got by map method object
                          print("Total count : $totalItemCount");
                          // print(product_index.name);
                          print(selectedProductNames);
                          // print("Product Name: $productName");
                        },
                        child: const Text("Buy Now")),
                  )
                ],
              ),
            );
          }).toList(),
        ],
      ),
      //Navigate to Cart() page by button click
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => Cart(numberOfProduct: totalItemCount)));
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
