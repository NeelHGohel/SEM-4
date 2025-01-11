import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHide = true;
  bool isRegisterScreen = false;
  var loginText = "Login";
  var registerText = "Register";
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login/Registraction Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Enter name",
                  labelText: "Enter name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter PassWord";
                  }
                  return null;
                },
                obscureText: isHide,
                decoration: InputDecoration(
                  hintText: "Enter PassWord",
                  labelText: "Enter PassWord",
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isHide = !isHide;
                        });
                      },
                      icon: Icon(isHide
                          ? Icons.visibility_sharp
                          : Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                visible: isRegisterScreen,
                child: Container(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter confirm PassWord";
                      }
                      return null;
                    },
                    obscureText: isHide,
                    decoration: InputDecoration(
                      hintText: "Enter confirm PassWord",
                      labelText: "Enter confirm PassWord",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isHide = !isHide;
                            });
                          },
                          icon: Icon(isHide
                              ? Icons.visibility_sharp
                              : Icons.visibility_off_outlined)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {}
                },
                child: Text(isRegisterScreen ? registerText : loginText),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Are you Registered user?? "),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      isRegisterScreen = !isRegisterScreen;
                      loginText = isRegisterScreen ? registerText : loginText;
                      registerText = isRegisterScreen ? loginText : registerText;
                      setState(() {});
                    },
                    child: Text(
                      registerText,
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
