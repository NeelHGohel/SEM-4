import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final int id;
  final String name;

  User({
    required this.id,
    required this.name,

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
    );
  }
}

Future<User> fetchUser(int id, bool extraInfo) async {
  final response = await http.get(Uri.parse(
      'https://jsonplaceholder.typicode.com/users/$id?extraInfo=$extraInfo'));

  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}

class UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text('User $index'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailPage(userId: index + 1, extraInfo: true),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class UserDetailPage extends StatelessWidget {
  final int userId;
  final bool extraInfo;

  UserDetailPage({required this.userId, required this.extraInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: FutureBuilder<User>(
        future: fetchUser(userId, extraInfo),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          } else {
            User user = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${user.id}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Name: ${user.name}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}