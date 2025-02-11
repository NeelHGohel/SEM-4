// Write a flutter code to design To-Do list insert screen and do validation on it.
import 'package:flutter/material.dart';

import '../lab_15/database.dart';

class TodoInsertScreen extends StatefulWidget {
  @override
  _TodoInsertScreenState createState() => _TodoInsertScreenState();
}

class _TodoInsertScreenState extends State<TodoInsertScreen> {
  final _formKey = GlobalKey<FormState>();
  final _taskNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dueDateController = TextEditingController();

  MyDatabase myDatabase = MyDatabase();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add To-Do'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _taskNameController,
                decoration: InputDecoration(
                  labelText: 'Task Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _dueDateController,
                decoration: InputDecoration(
                  labelText: 'Due Date (YYYY-MM-DD)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a due date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _insertTask,
                child: Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _insertTask() async {
    if (_formKey.currentState!.validate()) {
      String taskName = _taskNameController.text;
      String description = _descriptionController.text;
      String dueDate = _dueDateController.text;
      await myDatabase.insertTask(taskName, description, dueDate, 1);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Task Added'),
            content: Text('Task "$taskName" has been added successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _taskNameController.clear();
                  _descriptionController.clear();
                  _dueDateController.clear();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}