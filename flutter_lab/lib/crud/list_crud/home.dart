import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<User> users = [];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'User List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 15),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Enter Name',
                  hintText: 'Enter full name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Enter Email',
                  hintText: 'abc@xyz.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'Enter Email Address';
                //   }
                //   final emailRegex = RegExp(
                //       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
                //   if (!emailRegex.hasMatch(value.trim())) {
                //     return 'Enter Valid Email Address';
                //   }
                //   return null;
                // },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          users.add(User(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                          ));
                          nameController.clear();
                          emailController.clear();
                        });
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedIndex != -1 &&
                          _formKey.currentState!.validate()) {
                        setState(() {
                          users[selectedIndex] = User(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                          );
                          nameController.clear();
                          emailController.clear();
                          selectedIndex = -1;
                        });
                      }
                    },
                    child: const Text(
                      'Update',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // users.isEmpty
              //     ? const Text(
              //   'No User entered yet..',
              //   style: TextStyle(fontSize: 22),
              // )
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) => getRow(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              users[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(users[index].email),
          ],
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    nameController.text = users[index].name;
                    emailController.text = users[index].email;
                    selectedIndex = index;
                  });
                },
                icon: const Icon(Icons.edit),
              ),
              const SizedBox(width: 4),
              IconButton(
                onPressed: () {
                  setState(() {
                    users.removeAt(index);
                    if (selectedIndex == index) {
                      selectedIndex = -1;
                      nameController.clear();
                      emailController.clear();
                    }
                  });
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
