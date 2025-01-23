import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class FormEntry extends StatefulWidget {
  const FormEntry({super.key});

  @override
  State<FormEntry> createState() => _FormEntryState();
}

class _FormEntryState extends State<FormEntry> {
  List<Model> studentlist = [];
  List<Model> filteredlist = [];
  TextEditingController searchcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController rollcontroller = TextEditingController();
  int select = -1;

  @override
  void initState() {
    super.initState();
    filteredlist = List.from(studentlist);
  }

  void filterContacts(String query) {
    setState(() {
      if (query.isEmpty) {
        // Show all students if search query is empty
        filteredlist = List.from(studentlist);
      } else {
        // Filter based on the query
        filteredlist = studentlist
            .where((c) => c.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CRUD Operations",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView( // Wrap entire body with SingleChildScrollView
          child: Column(
            children: [
              SizedBox(height: 10),
              TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter a name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                controller: rollcontroller,
                maxLength: 3,
                decoration: InputDecoration(
                  labelText: "RollNo",
                  hintText: "Enter a rollno",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        String name = namecontroller.text.trim();
                        String rollno = rollcontroller.text.trim();
                        setState(
                              () {
                            if (name.isNotEmpty && rollno.isNotEmpty) {
                              studentlist.add(Model(name: name, rollno: rollno));
                              namecontroller.text = '';
                              rollcontroller.text = '';
                              filteredlist = studentlist;
                            }
                          },
                        );
                      },
                      child: Text(
                        "ADD",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 30),
                    ElevatedButton(
                      onPressed: () {
                        String name = namecontroller.text.trim();
                        String rollno = rollcontroller.text.trim();
                        setState(
                              () {
                            if (name.isNotEmpty &&
                                rollno.isNotEmpty &&
                                select != -1) {
                              namecontroller.text = '';
                              rollcontroller.text = '';
                              studentlist[select].name = name;
                              studentlist[select].rollno = rollno;
                              filteredlist = studentlist;
                              select = -1;
                            }
                          },
                        );
                      },
                      child: Text(
                        "UPDATE",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              TextField(
                controller: searchcontroller,
                onChanged: filterContacts,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search by name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )),
              ),
              SizedBox(height: 20),
              filteredlist.isEmpty
                  ? Center(child: Text("No students available"))
                  : ListView.builder(
                shrinkWrap: true, // This makes the ListView take up only as much space as needed
                physics: NeverScrollableScrollPhysics(), // Disable the scroll of ListView when inside SingleChildScrollView
                itemCount: filteredlist.length,
                itemBuilder: (context, index) {
                  return getListItem(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getListItem(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(filteredlist[index].name![0]),
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.blue,
        ),
        title: Text(filteredlist[index].name!),
        subtitle: Text(filteredlist[index].rollno!),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Delete button
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () => deleteStudent(index),
            ),
            SizedBox(width: 10),
            // Edit button
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  namecontroller.text = filteredlist[index].name!;
                  rollcontroller.text = filteredlist[index].rollno!;
                  select = studentlist.indexOf(filteredlist[index]);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // Delete student dialog
  void deleteStudent(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("DELETE"),
          content: Text("Are you sure you want to delete this student?"),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  studentlist.removeAt(index);
                  filteredlist = List.from(studentlist); // Refresh filtered list
                });
                Navigator.of(context).pop();
              },
              child: Text("YES"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("NO"),
            ),
          ],
        );
      },
    );
  }
}
