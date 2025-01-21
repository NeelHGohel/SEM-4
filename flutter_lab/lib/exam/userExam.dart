import 'package:flutter/material.dart';


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CrudUI(),
  ));
}


class CrudUI extends StatefulWidget {
  const CrudUI({super.key});

  @override
  State<CrudUI> createState() => _CrudUIState();
}

class _CrudUIState extends State<CrudUI> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Crud UI" ,style: TextStyle(color: Colors.white),),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: "Enter Name",
                  hintText: 'Enter name'
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        
                    labelText: "Enter email",
                    hintText: 'Enter email'
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter Email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    users.add(

                    ),


                  }, child: Text("Submit")),
                  ElevatedButton(onPressed: (){}, child: Text("Reset")),
                ],
              )
          
            ],
          ),
        ),
      ),
    );
  }
}
