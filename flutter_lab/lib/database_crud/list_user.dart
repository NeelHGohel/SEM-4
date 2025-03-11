import 'package:flutter/material.dart';
import 'myDatabase.dart';
import 'page.dart';

class UserListForCRUD extends StatefulWidget {
  const UserListForCRUD({super.key});

  @override
  State<UserListForCRUD> createState() => _UserListForCRUDState();
}

class _UserListForCRUDState extends State<UserListForCRUD> {
  late MyDatabaseCRUD db;

  @override
  void initState() {
    super.initState();
    db = MyDatabaseCRUD();
  }

  Future<List<Map<String, dynamic>>> _getAllUsers() async {
    return await db.getAllUsers();
  }

  Future<void> _deleteUser(int userId) async {
    await db.deleteUser(userId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FormPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No users found"));
          }

          List<Map<String, dynamic>> users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var user = users[index];
              int userId = user[MyDatabaseCRUD.USER_ID];
              String name = user[MyDatabaseCRUD.USER_NAME];
              String email = user[MyDatabaseCRUD.USER_EMAIL];
              String city = user[MyDatabaseCRUD.USER_CITY];

              return ListTile(
                title: Text(name),
                subtitle: Text('$email - $city'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormPage(
                              userId: userId,
                              name: name,
                              email: email,
                              city: city,
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _deleteUser(userId);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
