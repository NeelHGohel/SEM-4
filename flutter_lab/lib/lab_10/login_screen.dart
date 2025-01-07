import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  GlobalKey<FormState> _key = new GlobalKey<FormState>();
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Name";
                }
                return null;
              },
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "Enter Name",
                  labelText: "Enter Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            )
          ],
        )));
  }
}
