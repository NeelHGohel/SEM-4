import 'package:flutter/material.dart';
import 'myDatabase.dart';

class FormPage extends StatefulWidget {
  final int? userId;
  final String? name;
  final String? email;
  final String? city;

  const FormPage({this.userId, this.name, this.email, this.city, super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  MyDatabaseCRUD db = MyDatabaseCRUD();

  @override
  void initState() {
    super.initState();
    if (widget.userId != null) {
      nameController.text = widget.name ?? '';
      emailController.text = widget.email ?? '';
      cityController.text = widget.city ?? '';
    }
  }

  Future<void> insertUser () async {
    if (_key.currentState?.validate() ?? false) {
      Map<String, dynamic> user = {
        MyDatabaseCRUD.USER_NAME: nameController.text,
        MyDatabaseCRUD.USER_EMAIL: emailController.text,
        MyDatabaseCRUD.USER_CITY: cityController.text,
      };

      await db.insertUser (user);

      nameController.clear();
      emailController.clear();
      cityController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User  added successfully")),
      );
    }
  }

  Future<void> updateUser (int id) async {
    if (_key.currentState?.validate() ?? false) {
      Map<String, dynamic> user = {
        MyDatabaseCRUD.USER_NAME: nameController.text,
        MyDatabaseCRUD.USER_EMAIL: emailController.text,
        MyDatabaseCRUD.USER_CITY: cityController.text,
      };

      await db.updateUser (id, user);

      nameController.clear();
      emailController.clear();
      cityController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User  updated successfully")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.userId != null ? "Edit User" : "Add User",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  hintText: "Enter email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter an email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                  labelText: "City",
                  hintText: "Enter city",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a city";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      nameController.clear();
                      emailController.clear();
                      cityController.clear();
                      setState(() {});
                    },
                    child: Text("Reset"),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (widget.userId != null) {
                        updateUser (widget.userId!);
                      } else {
                        insertUser ();
                      }
                    },
                    child: Text(widget.userId != null ? "Update" : "Submit"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}