import 'package:flutter/material.dart';
import '../lab_15/database.dart';

class EditTaskScreen extends StatefulWidget {
  final Map<String, dynamic> task;
  const EditTaskScreen({super.key, required this.task});

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _taskNameController;
  late TextEditingController _dueDateController;
  String? _selectedCategory;
  String? _selectedStatus;
  late int _categoryId;

  @override
  void initState() {
    super.initState();
    _taskNameController = TextEditingController(text: widget.task['task_name']);
    _dueDateController = TextEditingController(text: widget.task['due_date']);
    _selectedCategory = widget.task['category_name'];
    _selectedStatus = widget.task['status'];

    // Assuming category_name is a string and you need to map it to the category_id
    _categoryId = _getCategoryIdFromName(_selectedCategory!);
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    _dueDateController.dispose();
    super.dispose();
  }

  // Helper function to map category name to category ID
  int _getCategoryIdFromName(String categoryName) {
    // You could also fetch category_id from the database or pass it directly with the task
    switch (categoryName) {
      case 'Work':
        return 1;
      case 'Personal':
        return 2;
      case 'Shopping':
        return 3;
      case 'Study':
        return 4;
      case 'Fitness':
        return 5;
      default:
        return 0; // Default to 0 or an error code, if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _taskNameController,
                decoration: const InputDecoration(labelText: 'Task Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dueDateController,
                decoration: const InputDecoration(labelText: 'Due Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a due date';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(labelText: 'Category'),
                items: ['Work', 'Personal', 'Shopping', 'Study', 'Fitness'].map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                    _categoryId = _getCategoryIdFromName(value!); // Update category ID based on selection
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedStatus,
                decoration: const InputDecoration(labelText: 'Status'),
                items: ['pending', 'completed'].map((status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedStatus = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a status';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Call the updateTask method with individual fields
                    await MyDatabase().updateTask(
                      widget.task['task_id'], // Pass task ID
                      _taskNameController.text,
                      widget.task['description'] ?? '', // Keep the existing description
                      _dueDateController.text,
                      _categoryId, // Pass category ID
                      _selectedStatus!, // Pass status
                    );

                    Navigator.pop(context);
                  }
                },
                child: const Text('Save Changes'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
