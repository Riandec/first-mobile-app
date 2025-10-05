import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:first_application/models/product.dart';

class ProductForm extends StatefulWidget {
  final Product? product;
  const ProductForm({super.key, this.product});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  bool isLoading = false;
  bool get isEditMode => widget.product != null;

  @override
  void initState() {
    super.initState();
    if (isEditMode) {
      _nameController.text = widget.product!.name;
      _descController.text = widget.product!.desc;
      _priceController.text = widget.product!.price.toString();
    }
  }

  Future<void> submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      final productData = {
        'name': _nameController.text,
        "description": _descController.text,
        "price": double.parse(_priceController.text),
      };
    
      try {
        http.Response response;
        if (isEditMode) {
          // Put: Update
          response = await http.put(
            Uri.parse("http://localhost:8001/products/${widget.product!.id}"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(productData),
          );
          // Post: Create
        } else {
          response = await http.post(
            Uri.parse("http://localhost:8001/products"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(productData),
          );
        }

        if (response.statusCode == 200 || response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Save Successfully'), 
              backgroundColor: Colors.green
            )
          );
          Navigator.of(context).pop(true);
        } else {
          throw Exception("Failed to save product");
        }
      } catch (e) {
        print(e);
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Management'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a product name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price', suffixText: '฿'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a price';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid price';
                }
                return null;
              },
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: submitForm,
              
              child: Text('Save'),
            )
          ],
        )
      )
    );
  }
}