import 'package:flutter/material.dart';
import 'package:flutter_lab/lab_17/lab_17_list_view.dart';
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
  List<Map<String, dynamic>> _categories = [];
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    List<Map<String, dynamic>> categories = await myDatabase.selectAllCategories();
    setState(() {
      _categories = categories;
      _selectedCategory = categories.isNotEmpty ? categories[0]['category_id'].toString() : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add To-Do'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _taskNameController,
                  decoration: const InputDecoration(
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
                const SizedBox(height: 10),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
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
                const SizedBox(height: 10),
                TextFormField(
                  controller: _dueDateController,
                  decoration: const InputDecoration(
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
                const SizedBox(height: 10),
                // Category Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                  items: _categories.map<DropdownMenuItem<String>>((category) {
                    return DropdownMenuItem<String>(
                      value: category['category_id'].toString(),
                      child: Text(category['category_name']),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _insertTask,
                  child: const Text('Add Task'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Lab17ListView(),
                      ),
                    );
                  },
                  child: const Text('Show all task'),
                ),

              ],
            ),
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

      // Fetch the selected category id
      int categoryId = int.parse(_selectedCategory!);

      await myDatabase.insertTask(taskName, description, dueDate, categoryId);

      // Show success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Task Added'),
            content: Text('Task "$taskName" has been added successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _resetForm();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  // Method to reset the form and the selected category
  void _resetForm() {
    _formKey.currentState!.reset();
    _taskNameController.clear();
    _descriptionController.clear();
    _dueDateController.clear();
    setState(() {
      _selectedCategory = _categories.isNotEmpty ? _categories[0]['category_id'].toString() : null;
    });
  }
}
