import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:first_application/models/product.dart';
import 'package:first_application/api/product_form.dart';

class RestApi extends StatefulWidget {
  const RestApi({super.key});

  @override
  State<RestApi> createState() => _RestApiState();
}

class _RestApiState extends State<RestApi> {
  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // Get
  Future<void> fetchData() async {
    try {
      var response = await http.get(
        Uri.parse('http://localhost:8001/products'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        setState(() {
          productList = jsonList.map((item) => Product.fromJson(item)).toList();
        });
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  /*
  // Post
  Future<void> createProduct() async {
    try {
      var response = await http.post(
        Uri.parse("http://localhost:8001/products"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": "IPhone 5s",
          "description": "Apple smartphone",
          "price": 21999.00,
        }),
      );
      if (response.statusCode == 201) {
        // Your Code Here..
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  // Put
  Future<void> updateProduct({dynamic idUpdate = "44b7"}) async {
    try {
      var response = await http.put(
        Uri.parse("http://localhost:8001/products/$idUpdate"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": "iPhone 5 plus",
          "description": "Apple smartphone",
          "price": 34900.00,
        }),
      );
      if (response.statusCode == 200) {
        // Your Code Here..
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }
  */

  // Delete
  Future<void> deleteProduct(String productId) async {
    try {
      var response = await http.delete(
        Uri.parse("http://localhost:8001/products/$productId"),
      );
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Delete Successfully'),
            backgroundColor: Colors.green,
          ),
        );
        fetchData();
      } else {
        throw Exception("Failed to delete products");
      }
    } catch (e) {
      print(e);
    }
  }

  // Post & Put Navigation
  void navigateToForm({Product? product}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductForm(product: product)),
    );
    if (result == true) {
      fetchData();
    }
  }

  void confirmDelete(Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete?'),
          content: Text('Are you sure to delete ${product.name}'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Yes, Delete', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
                deleteProduct(product.id.toString());
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: Colors.blue,
        actions: [IconButton(icon: Icon(Icons.refresh), onPressed: fetchData)],
      ),
      body: Center(
        child: ListView.separated(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final product = productList[index];
            return ListTile(
              leading: Text(product.id.toString()),
              title: Row(
                children: [
                  Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  IconButton(onPressed: () => navigateToForm(product: product), icon: Icon(Icons.edit, size: 15, color: Colors.blue))
                ]
              ),
              subtitle: Text(product.desc),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${product.price.toString()} ฿'),
                  IconButton(onPressed: () => confirmDelete(product), icon: Icon(Icons.delete, size: 20, color: Colors.red))
                ]
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToForm(),
        child: Icon(Icons.add),
        tooltip: 'Add Product',
      ),
    );
  }
}
