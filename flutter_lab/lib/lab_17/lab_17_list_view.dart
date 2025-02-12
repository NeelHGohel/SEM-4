import 'package:flutter/material.dart';
import '../lab_15/database.dart';

class Lab17ListView extends StatefulWidget {
  const Lab17ListView({super.key});

  @override
  State<Lab17ListView> createState() => _Lab17ListViewState();
}

class _Lab17ListViewState extends State<Lab17ListView> {
  MyDatabase db = MyDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: db.selectAllTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No tasks available.'));
          } else {
            final tasks = snapshot.data!;

            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];

                Icon statusIcon;
                Color statusColor;
                if (task['status'] == 'completed') {
                  statusIcon =
                      const Icon(Icons.check_circle, color: Colors.green);
                  statusColor = Colors.green[50]!;
                } else {
                  statusIcon = const Icon(Icons.pending, color: Colors.orange);
                  statusColor = Colors.orange[50]!;
                }

                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: statusIcon,
                    title: Text(
                      task['task_name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Due: ${task['due_date']}'),
                        Text(
                          'Category: ${task['category_name']}',
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal),
                    tileColor: statusColor,
                    onTap: ()  {
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
