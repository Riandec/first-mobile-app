import 'package:flutter/material.dart';
import 'package:first_application/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  List<User>? userList;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  void fetchUser() async {
    try {
      var response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          userList = data.map((item) => User.fromJson(item)).toList();
        });
      } else {
        setState(() {
          userList = null;
        });
        print('Failed to fetch data');
        print(
          'Status code: ${response.statusCode} Response body: ${response.body}',
        );
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        userList = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple API Call')),
      body: Center(
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            final user = userList![index];
            return ListTile(
              leading: Text(user.id.toString()),
              title: Text(user.name),
              subtitle: Text(user.email),
              trailing: Text('(${user.username})'),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
